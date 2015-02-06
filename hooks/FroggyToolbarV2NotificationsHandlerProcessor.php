<?php
/**
 * 2013-2015 Froggy Commerce
 *
 * NOTICE OF LICENSE
 *
 * You should have received a licence with this module.
 * If you didn't buy this module on Froggy-Commerce.com, ThemeForest.net
 * or Addons.PrestaShop.com, please contact us immediately : contact@froggy-commerce.com
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to benefit the updates
 * for newer PrestaShop versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    Froggy Commerce <contact@froggy-commerce.com>
 * @copyright 2013-2015 Froggy Commerce
 * @license   Unauthorized copying of this file, via any medium is strictly prohibited
 */

class FroggyToolbarV2NotificationsHandlerProcessor extends FroggyHookProcessor
{
	public $types = array('order', 'customer', 'customer_message');
	public $types_key = array('order' => 'OR', 'customer' => 'CU', 'customer_message' => 'CM');

	public function run()
	{
		// Load fc cookie (using our own cookie for compatibility 1.4 / 1.5 / 1.6)
		$cookie_fc = new Cookie('psFroggyToolbar');

		// Check cookie employee
		if ((int)$cookie_fc->id_employee < 1)
			die('Not logged!');

		// Dispatcher
		if (Tools::getValue('updateElementEmployeeType') != '')
			$this->setNotificationsAsViewed();
		else
			$this->getNotifications();
	}

	public function getNotifications()
	{
		// Load fc cookie (using our own cookie for compatibility 1.4 / 1.5 / 1.6)
		$cookie_fc = new Cookie('psFroggyToolbar');

		// If not set yet, set the start point
		if (Configuration::get('FC_TLB_NOT_OR_'.(int)$cookie_fc->id_employee) == '')
			foreach ($this->types as $type)
			{
				$id_last_element = Db::getInstance(_PS_USE_SQL_SLAVE_)->getValue('SELECT IFNULL(MAX(`id_'.$type.'`), 0) FROM `'._DB_PREFIX_.(($type == 'order') ? 'orders' : $type).'`');
				Configuration::updateValue('FC_TLB_NOT_'.$this->types_key[$type].'_'.(int)$cookie_fc->id_employee, (int)$id_last_element);
			}

		// Load notifications
		$notifications = array();
		$notifications['order'] = $this->getNotificationsByType('order', Configuration::get('FC_TLB_NOT_OR_'.(int)$cookie_fc->id_employee));
		$notifications['customer_message'] = $this->getNotificationsByType('customer_message', Configuration::get('FC_TLB_NOT_CM_'.(int)$cookie_fc->id_employee));
		$notifications['customer'] = $this->getNotificationsByType('customer', Configuration::get('FC_TLB_NOT_CU_'.(int)$cookie_fc->id_employee));

		// Display notifications
		echo Tools::jsonEncode($notifications);
	}

	public function getNotificationsByType($type, $id_last_element)
	{
		// Security check
		if (!in_array($type, $this->types))
			return '';

		switch ($type)
		{
			case 'order':
				$sql = '
					SELECT o.`id_order`, o.`id_customer`, o.`total_paid`, o.`id_currency`, c.`firstname`, c.`lastname`
					FROM `'._DB_PREFIX_.'orders` as o
					LEFT JOIN `'._DB_PREFIX_.'customer` as c ON (c.`id_customer` = o.`id_customer`)
					WHERE `id_order` > '.(int)$id_last_element.'
					ORDER BY `id_order` DESC
				';
				break;

			case 'customer_message':
				$sql = '
					SELECT c.`id_customer_message`, ct.`id_customer`, ct.`id_customer_thread`, ct.`email`
					FROM `'._DB_PREFIX_.'customer_message` as c
					LEFT JOIN `'._DB_PREFIX_.'customer_thread` as ct ON (c.`id_customer_thread` = ct.`id_customer_thread`)
					WHERE c.`id_customer_message` > '.(int)$id_last_element.'
						AND c.`id_employee` = 0
					ORDER BY c.`id_customer_message` DESC
				';
				break;
			default:
				$sql = '
					SELECT t.`id_'.($type).'`, t.*
					FROM `'._DB_PREFIX_.($type).'` t
					WHERE t.`deleted` = 0 AND t.`id_'.($type).'` > '.(int)$id_last_element.'
					ORDER BY t.`id_'.($type).'` DESC
				';
				break;
		}

		$json = array();
		$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);

		foreach ($result as $value)
		{
			$customer_name = '';
			if (isset($value['firstname']) && isset($value['lastname']))
				$customer_name = Tools::safeOutput($value['firstname'].' '.$value['lastname']);
			else if (isset($value['email']))
				$customer_name = Tools::safeOutput($value['email']);

			$json[] = array(
				'id_order' => ((!empty($value['id_order'])) ? (int)$value['id_order'] : 0),
				'id_customer' => ((!empty($value['id_customer'])) ? (int)$value['id_customer'] : 0),
				'id_customer_message' => ((!empty($value['id_customer_message'])) ? (int)$value['id_customer_message'] : 0),
				'id_customer_thread' => ((!empty($value['id_customer_thread'])) ? (int)$value['id_customer_thread'] : 0),
				'total_paid' => ((!empty($value['total_paid'])) ? Tools::displayPrice((float)$value['total_paid'], (int)$value['id_currency'], false) : 0),
				'customer_name' => $customer_name
			);
		}

		return $json;
	}

	public function setNotificationsAsViewed()
	{
		// Security check
		$type = Tools::getValue('updateElementEmployeeType');
		if (!in_array($type, $this->types))
			return false;

		// Load fc cookie (using our own cookie for compatibility 1.4 / 1.5 / 1.6)
		$cookie_fc = new Cookie('psFroggyToolbar');

		// Get last element id
		$id_last_element = Db::getInstance(_PS_USE_SQL_SLAVE_)->getValue('SELECT IFNULL(MAX(`id_'.$type.'`), 0) FROM `'._DB_PREFIX_.(($type == 'order') ? 'orders' : $type).'`');

		// Set notifications as viewed
		if (isset($this->types_key[$type]))
			Configuration::updateValue('FC_TLB_NOT_'.$this->types_key[$type].'_'.(int)$cookie_fc->id_employee, (int)$id_last_element);
	}
}
<?php
/**
 * 2013-2014 Froggy Commerce
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
 * @copyright 2013-2014 Froggy Commerce
 * @license   Unauthorized copying of this file, via any medium is strictly prohibited
 */

/*
 * Security
 */
defined('_PS_VERSION_') || require dirname(__FILE__).'/index.php';

/*
 * Include Froggy Library
 */
if (!class_exists('FroggyModule', false)) require_once _PS_MODULE_DIR_.'/froggytoolbarv2/froggy/FroggyModule.php';
require_once _PS_MODULE_DIR_.'/froggytoolbarv2/classes/FroggyToolbarCustomMenu.php';

class FroggyToolbarV2 extends FroggyModule
{
	/**
	 * Constructor
	 */
	public function __construct()
	{
		$this->name = 'froggytoolbarv2';
		$this->author = 'Froggy Commerce';
		$this->version = '1.0.3';
		$this->tab = 'administration';

		parent::__construct();

		$this->displayName = $this->l('Froggy Advanced Toolbar');
		$this->description = $this->l('Display an admin advanced toolbar on front office');
		$this->module_key = '81bc27c56c438058704732c086d0f7a6';
	}

	/**
	 * Install method
	 * @return bool
	 */
	public function install()
	{
		// Parent install
		$return = parent::install();

		// Retrieve admin directory
		$admin_dir = explode('/', dirname($_SERVER['PHP_SELF']));
		$admin_dir = array_pop($admin_dir).'/';

		// Save it in configuration table
		Configuration::updateValue('FC_TLB_ADMIN_DIR', $admin_dir);
		Configuration::updateValue('FC_TLB_TIMER', 30);

		return $return;
	}

	/**
	 * @return bool
	 */
	public function uninstall()
	{
		// Parent install
		$return = parent::uninstall();

		// Delete all config value which begin with FC_TLB_
		Db::getInstance()->execute('DELETE FROM `'._DB_PREFIX_.'configuration` WHERE `name` LIKE \'%FC_TLB_%\'');

		return $return;
	}

	/*
	 *  Retrocompat 1.4
	 */
	public function getContent()
	{
		return $this->hookGetContent(array());
	}
	public function hookHeader($params)
	{
		return $this->hookDisplayHeader($params);
	}
	public function hookFooter($params)
	{
		return $this->hookDisplayFooter($params);
	}
	public function hookBackOfficeHeader($params)
	{
		return $this->hookDisplayBackOfficeHeader($params);
	}
}
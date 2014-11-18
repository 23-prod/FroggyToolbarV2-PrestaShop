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

class FroggyToolbarCustomMenu extends ObjectModel
{
	public $id;
	public $label;
	public $link;
	public $position;
	public $id_employee;
	public $date_add;

	/**
	 * @see ObjectModel::$definition
	 */
	public static $definition = array(
		'table' => 'ftv2_custom_menu',
		'primary' => 'id_ftv2_custom_menu',
		'multilang' => false,
		'fields' => array(
			'label' => array('type' => 3, 'required' => true),
			'link' => array('type' => 3, 'validate' => 'isUrl', 'required' => true),
			'position' => array('type' => 1),
			'id_employee' =>  array('type' => 1, 'validate' => 'isUnsignedId'),
			'date_add' => array('type' => 5, 'validate' => 'isDateFormat', 'copy_post' => false),
		),
	);
	/*	Can't use constant if we want to be compliant with PS 1.4
	 * 	const TYPE_INT = 1;
	 * 	const TYPE_BOOL = 2;
	 * 	const TYPE_STRING = 3;
	 * 	const TYPE_FLOAT = 4;
	 * 	const TYPE_DATE = 5;
	 * 	const TYPE_HTML = 6;
	 * 	const TYPE_NOTHING = 7;
	 */

	/*** Retrocompatibility 1.4 ***/

	protected 	$fieldsRequired = array('label', 'link');
	protected 	$fieldsSize = array('label' => 255, 'link' => 255);
	protected 	$fieldsValidate = array('label' => 'isUrl', 'link' => 'isUrl');

	protected 	$table = 'ftv2_custom_menu';
	protected 	$identifier = 'id_ftv2_custom_menu';

	public function getFields()
	{
		if (version_compare(_PS_VERSION_, '1.5') >= 0)
			return parent::getFields();

		parent::validateFields();

		$fields['label'] = pSQL($this->label);
		$fields['link'] = pSQL($this->link);
		$fields['position'] = (int)self::getNewPosition((int)$this->id_employee);
		$fields['id_employee'] = (int)$this->id_employee;
		$fields['date_add'] = pSQL($this->date_add);

		return $fields;
	}

	/*** End of Retrocompatibility 1.4 ***/

	public static function getEmployeeCustomMenu($id_employee)
	{
		return Db::getInstance()->ExecuteS('
		SELECT * FROM `'._DB_PREFIX_.'ftv2_custom_menu`
		WHERE `id_employee` = '.(int)$id_employee);
	}

	public static function getNewPosition($id_employee)
	{
		$pos_max = (int)Db::getInstance()->getValue('
		SELECT COUNT(`id_ftv2_custom_menu`)
		FROM `'._DB_PREFIX_.'ftv2_custom_menu`
		WHERE `id_employee` = '.(int)$id_employee);
		return $pos_max + 1;
	}
}
<?php
/*
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
*  @author Froggy Commerce <contact@froggy-commerce.com>
*  @copyright  2013-2014 Froggy Commerce
*/

// Security
defined('_PS_VERSION_') || require dirname(__FILE__).'/index.php';

// Include Froggy Library
if (!class_exists('FroggyModule', false)) require_once _PS_MODULE_DIR_.'/froggytoolbarv2/froggy/FroggyModule.php';


class FroggyToolbarV2 extends FroggyModule
{
	/**
	 * Constructor
	 */
	public function __construct()
	{
		parent::__construct();

		$this->displayName = $this->l('Froggy Advanced Toolbar');
		$this->description = $this->l('Display an admin advanced toolbar on front office');
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
		Configuration::updateValue('FC_TLB_TIMER', 30000);

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


	/**
	 * Configuration method
	 * @return string $html
	 */
	public function getContent()
	{
		$result = '';
		if (Tools::getValue('FC_TLB_TIMER') != '')
		{
			Configuration::updateValue('FC_TLB_TARGET_LINK', Tools::getValue('FC_TLB_TARGET_LINK'));
			Configuration::updateValue('FC_TLB_TIMER', 15000);
			$timer = (int)((int)Tools::getValue('FC_TLB_TIMER') * 1000);
			if ($timer > 15000)
				Configuration::updateValue('FC_TLB_TIMER', (int)$timer);

			$result = 'OK';
		}

		$assign = array(
			'module_dir' => $this->_path,
			'target_link' => Configuration::get('FC_TLB_TARGET_LINK'),
			'timer' => Configuration::get('FC_TLB_TIMER'),
			'result' => $result,
		);

		$this->smarty->assign($this->name, $assign);
		return $this->fcdisplay(__FILE__, 'getContent.tpl');
	}


	// Retrocompat 1.4
	public function hookHeader($params) { return $this->hookDisplayHeader($params); }
	public function hookFooter($params) { return $this->hookDisplayFooter($params); }
	public function hookBackOfficeHeader($params) { return $this->hookDisplayBackOfficeHeader($params); }
}
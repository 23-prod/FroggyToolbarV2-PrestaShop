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

class FroggyToolbarV2HookDisplayFooterProcessor extends FroggyHookProcessor
{
	public function run()
	{
		// Load fc cookie (using our own cookie for compatibility 1.4 / 1.5 / 1.6)
		$cookie_fc = new Cookie('psFroggyToolbar');
		if ((int)$cookie_fc->id_employee < 1)
			return '';

		// Load employee and set it in context
		$employee = new Employee((int)$cookie_fc->id_employee);
		$this->context->employee = $employee;

		// Init target link
		$target_link = '';
		if (Configuration::get('FC_TLB_TARGET_LINK') == '_blank')
			$target_link = 'target="_blank" ';

		// Load admin link
		$token_search = Tools::getAdminToken('AdminSearch'.(int)Tab::getIdFromClassName('AdminSearch').(int)$cookie_fc->id_employee);
		$token_translation = Tools::getAdminToken('AdminTranslations'.(int)Tab::getIdFromClassName('AdminTranslations').(int)$cookie_fc->id_employee);
		$token_configuration = Tools::getAdminToken('AdminModules'.(int)Tab::getIdFromClassName('AdminModules').(int)$cookie_fc->id_employee);
		$search_link = Configuration::get('FC_TLB_ADMIN_DIR').'index.php?tab=AdminSearch&controller=AdminSearch&token='.$token_search;
		$translation_link = Configuration::get('FC_TLB_ADMIN_DIR').'index.php?tab=AdminTranslations&controller=AdminTranslations&token='.$token_translation.'&type=front&lang='.Language::getIsoById((int)$this->context->language->id).'&theme='.basename(_PS_THEME_DIR_);
		$configuration_link = Configuration::get('FC_TLB_ADMIN_DIR').'index.php?tab=AdminModules&controller=AdminModules&token='.$token_configuration;

		// Assign
		$assign = array(
			'module_dir' => $this->path,
			'module_img_dir' => $this->path.'img/',
			'target_link' => $target_link,
			'id_employee' => $employee->id,
			'firstname_employee' => $employee->firstname,
			'admin_dir' => Configuration::get('FC_TLB_ADMIN_DIR'),
			'timer' => Configuration::get('FC_TLB_TIMER'),
			'ps_version' => Tools::substr(_PS_VERSION_, 0, 3),
			'modules_displayed' => (isset(Module::$modules_displayed) ? Module::$modules_displayed : array()),
			'translation_link' => _PS_BASE_URL_.__PS_BASE_URI__.$translation_link,
			'search_link' => _PS_BASE_URL_.__PS_BASE_URI__.$search_link,
			'general_configuration_link' => _PS_BASE_URL_.__PS_BASE_URI__.$configuration_link,
			'configuration_link' => _PS_BASE_URL_.__PS_BASE_URI__.$configuration_link.'&configure=froggytoolbarv2&module_name=froggytoolbarv2',
			'custom_menu' => FroggyToolbarCustomMenu::getEmployeeCustomMenu((int)$this->context->employee->id),
		);

		$this->smarty->assign($this->module->name, $assign);

		return $this->module->fcdisplay(__FILE__, 'displayFooter.tpl');
	}
}
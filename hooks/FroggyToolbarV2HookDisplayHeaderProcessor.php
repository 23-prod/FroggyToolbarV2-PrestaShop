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

class FroggyToolbarV2HookDisplayHeaderProcessor extends FroggyHookProcessor
{
	public function run()
	{
		// Load fc cookie (using our own cookie for compatibility 1.4 / 1.5 / 1.6)
		$cookie_fc = new Cookie('psFroggyToolbar');

		// Check if deconnection is asked
		if (Tools::getIsset('logout'))
			$cookie_fc->id_employee = 0;

		// Check cookie employee
		if ((int)$cookie_fc->id_employee < 1)
			return '';

		// Set media (different file CSS depending on PrestaShop version)
		$ps_version = Tools::substr(_PS_VERSION_, 0, 3);
		$this->context->controller->addCSS($this->path.'css/font-awesome.min.css', 'all');
		$this->context->controller->addCSS($this->path.'css/froggytoolbar-debug.css', 'all');
		$this->context->controller->addCSS($this->path.'css/froggytoolbar-'.$ps_version.'.css', 'all');
		$this->context->controller->addCSS($this->path.'css/froggytoolbar-'.$ps_version.'-'.$cookie_fc->bo_theme_employee.'.css', 'all');
		$this->context->controller->addJS($this->path.'js/froggytoolbar-jscolor.js');
		$this->context->controller->addJS($this->path.'js/froggytoolbar-debug.js');
		$this->context->controller->addJS($this->path.'js/froggytoolbar.js');
	}
}
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

class Module extends ModuleCore
{
	public static $modules_displayed = array();

	public function display($file, $template, $cacheId = null, $compileId = null)
	{
		$result = parent::display($file, $template, $cacheId, $compileId);

		if (Module::isInstalled('froggytoolbarv2'))
		{
			// Load fc cookie (using our own cookie for compatibility 1.4 / 1.5 / 1.6)
			$cookie_fc = new Cookie('psFroggyToolbar');

			// Check cookie employee
			if ((int)$cookie_fc->id_employee > 0)
			{
				$configuration_link = '';
				if (method_exists($this, 'getContent'))
				{
					$token = Tools::getAdminToken('AdminModules'.(int)Tab::getIdFromClassName('AdminModules').(int)$cookie_fc->id_employee);
					$configuration_link = Configuration::get('FC_TLB_ADMIN_DIR').'index.php?controller=AdminModules&token='.$token.'&configure='.$this->name.'&module_name='.$this->name;
					Module::$modules_displayed[$this->name] = array('name' => $this->name, 'display_name' => $this->displayName, 'configuration_link' => $configuration_link);
				}
				$result = '<section class="froggytoolbar-debug-module-block"><span class="froggytoolbar-debug-module-name">'.$this->name.' / '.$template.($configuration_link != '' ? ' <a target="_blank" href="'._PS_BASE_URL_.__PS_BASE_URI__.$configuration_link.'">Configuration</a>' : '').'</span>'.$result.'</section>';
			}
		}

		return $result;
	}
}
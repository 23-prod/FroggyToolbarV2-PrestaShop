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

		if (Module::isInstalled('froggytoolbarv2') && Module::isEnabled('froggytoolbarv2') && strpos($_SERVER['REQUEST_URI'], Configuration::get('FC_TLB_ADMIN_DIR')) === false)
		{
			// Load fc cookie (using our own cookie for compatibility 1.4 / 1.5 / 1.6)
			$cookie_fc = new Cookie('psFroggyToolbar');

			// Check cookie employee
			if ((int)$cookie_fc->id_employee > 0 && strpos($_SERVER['REQUEST_URI'], 'ajax') === false)
			{
				// Check if template is not JS
				$template_type = explode('.', $template);
				$template_type = $template_type[count($template_type) - 1];
				if ($template_type != 'js')
				{
					$configuration_link = '';
					$token = Tools::getAdminToken('AdminTranslations'.(int)Tab::getIdFromClassName('AdminTranslations').(int)$cookie_fc->id_employee);
					$translation_link = Configuration::get('FC_TLB_ADMIN_DIR').'index.php?controller=AdminTranslations&token='.$token.'&type=modules&lang='.Language::getIsoById((int)Context::getContext()->language->id).'#'.$this->name;
					if (method_exists($this, 'getContent'))
					{
						$token = Tools::getAdminToken('AdminModules'.(int)Tab::getIdFromClassName('AdminModules').(int)$cookie_fc->id_employee);
						$configuration_link = Configuration::get('FC_TLB_ADMIN_DIR').'index.php?controller=AdminModules&token='.$token.'&configure='.$this->name.'&module_name='.$this->name;
						Module::$modules_displayed[$this->name] = array('name' => $this->name, 'display_name' => $this->displayName, 'configuration_link' => $configuration_link, 'translation_link' => $translation_link);
					}
					$result = '<section class="froggytoolbar-debug-module-block">
					<span class="froggytoolbar-debug-module-name">
						<strong>'.(empty($this->displayName) ? $this->name : $this->displayName).'</strong>: Template
						<span title="'.dirname($file).'/'.$template.'">'.$template.'</span>
						'.($configuration_link != '' ? ' <a target="_blank" href="'._PS_BASE_URL_.__PS_BASE_URI__.$configuration_link.'"><span class="fa fa-cog" title="Configure"></span></a>' : '').'
						<a target="_blank" href="'._PS_BASE_URL_.__PS_BASE_URI__.$translation_link.'"><span class="fa fa-globe" title="Translate"></span></a>
					</span>
					'.$result.
						'</section>';
				}
			}
		}

		return $result;
	}
}
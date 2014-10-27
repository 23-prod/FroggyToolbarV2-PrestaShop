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
	public function display($file, $template, $cacheId = null, $compileId = null)
	{
		$result = parent::display($file, $template, $cacheId, $compileId);

		if (Module::isInstalled('froggytoolbarv2'))
		{
			// Load fc cookie (using our own cookie for compatibility 1.4 / 1.5 / 1.6)
			$cookie_fc = new Cookie('psFroggyToolbar');

			// Check cookie employee
			if ((int)$cookie_fc->id_employee > 0)
				$result = '<section class="froggytoolbar-debug"><span class="froggytoolbar-tplname">'.$this->name.' / '.$template.'</span>'.$result.'</section>';
		}

		return $result;
	}
}
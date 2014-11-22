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
 * Construct path
 */
$config_path = dirname(__FILE__).'/../../config/config.inc.php';
$module_path = dirname(__FILE__).'/froggytoolbarv2.php';

/*
 *  Keep going if config script is found
 */
if (file_exists($config_path))
{
	include($config_path);
	$controller = new FrontController();
	$controller->init();

	include($module_path);
	$froggytoolbar = new FroggyToolbarV2();
	$froggytoolbar->notificationsHandler();
}
else
	die('ERROR');

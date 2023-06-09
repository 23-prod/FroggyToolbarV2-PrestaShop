{**
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
 *}

<div id="froggy-toolbar" class="toolbar-top">
	<ul class="fc-toolbar-list-link">
		<li class="froggy-link-toolbar first-floor toolbar-link">
			<a><span class="froggy-toolbar-link"></span></a>
			<ul class="fc-toolbar-submenu">
				<li><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="http://addons.prestashop.com/">{l s='PrestaShop Addons' mod='froggytoolbarv2'}</a></li>
				<li><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="http://www.prestashop.com/forums/">{l s='PrestaShop Forum' mod='froggytoolbarv2'}</a></li>
			</ul>
		</li>
		<li class="backoffice-link-toolbar first-floor toolbar-link"><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminHome' e=$froggytoolbarv2.id_employee}"><span class="fa fa-tachometer"></span><span>{l s='Back-Office' mod='froggytoolbarv2'}</span></a>
			<ul class="fc-toolbar-submenu">
				<li><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminOrders' e=$froggytoolbarv2.id_employee}">{l s='Orders' mod='froggytoolbarv2'}</a></li>
				<li><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminProducts' e=$froggytoolbarv2.id_employee}">{l s='Products' mod='froggytoolbarv2'}</a></li>
				<li><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminCategories' e=$froggytoolbarv2.id_employee}">{l s='Categories' mod='froggytoolbarv2'}</a></li>
				<li><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminModules' e=$froggytoolbarv2.id_employee}">{l s='Modules' mod='froggytoolbarv2'}</a></li>
			</ul>
		</li>
		<li class="news-toolbar first-floor toolbar-link"><a href="#"><span class="fa fa-plus-circle"></span><span>{l s='New' mod='froggytoolbarv2'}</span></a>
			<ul class="fc-toolbar-submenu">
				<li><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminProducts' e=$froggytoolbarv2.id_employee}&addproduct">{l s='New product' mod='froggytoolbarv2'}</a></li>
				<li><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminCategories' e=$froggytoolbarv2.id_employee}&addcategory">{l s='New category' mod='froggytoolbarv2'}</a></li>
				<li><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminCmsContent' e=$froggytoolbarv2.id_employee}&addcms">{l s='New page CMS' mod='froggytoolbarv2'}</a></li>
			</ul>
		</li>
        {if isset($smarty.get.id_product) || isset($smarty.get.id_category) || isset($smarty.get.id_cms)}
		    <li class="edit-page toolbar-link">
                {if isset($smarty.get.id_product) && $smarty.get.id_product gt 0}
                    <a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminProducts' e=$froggytoolbarv2.id_employee}&updateproduct&id_product={$smarty.get.id_product}">
                {elseif isset($smarty.get.id_category) && $smarty.get.id_category gt 0}
                    <a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminCategories' e=$froggytoolbarv2.id_employee}&updatecategory&id_category={$smarty.get.id_category}">
                {elseif isset($smarty.get.id_cms) && $smarty.get.id_cms gt 0}
                    <a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminCmsContent' e=$froggytoolbarv2.id_employee}&updatecms&id_cms={$smarty.get.id_cms}">
                {else}
                    <a href="#">
                {/if}
                    <span class="fa fa-pencil"></span><span>{l s='Edit' mod='froggytoolbarv2'}</span>
                </a>
            </li>
        {/if}
        {if isset($froggytoolbarv2.modules_displayed) && $froggytoolbarv2.modules_displayed|@count gt 0}
			<li class="modules-configuration first-floor toolbar-link"><a href="{$froggytoolbarv2.general_configuration_link|escape:'html':'UTF-8'}"><span class="fa fa-cog"></span><span>{l s='Modules configuration' mod='froggytoolbarv2'}</span></a>
				<ul class="fc-toolbar-submenu">
                    {foreach from=$froggytoolbarv2.modules_displayed item=module}
					    <li><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$module.configuration_link}">{if !empty($module.display_name)}{$module.display_name}{else}{$module.name}{/if}</a></li>
                    {/foreach}
				</ul>
			</li>
        {/if}
		<li class="first-floor toolbar-link"><a href="#" id="froggytoolbar-debug-option"><span class="fa fa-toggle-off"></span><span id="froggytoolbar-debug-button-label">{l s='Enable debug option' mod='froggytoolbarv2'}</span></a></li>
		<li class="first-floor toolbar-link"><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$froggytoolbarv2.translation_link}" id="fc-toolbar-traduction-link"><span class="fa fa-globe"></span><span>{l s='Translation' mod='froggytoolbarv2'}</span></a></li>
		<li class="backoffice-link-toolbar first-floor toolbar-link"><a href="#"><span class="fa fa-link"></span><span>{l s='Shortcuts' mod='froggytoolbarv2'}</span></a>
			<ul class="fc-toolbar-submenu">
            {if $froggytoolbarv2.custom_menu|@count gt 0}
                {foreach from=$froggytoolbarv2.custom_menu item=menu}
                    <li><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$menu.link}">{$menu.label}</a></li>
                {/foreach}
            {else}
				<li><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$froggytoolbarv2.configuration_link}">{l s='Create your own shorcuts' mod='froggytoolbarv2'}</a></li>
            {/if}
			</ul>
		</li>
	</ul>
	<ul class="fc-toolbar-box">
		<li id="fc-toolbar-form-search"><form action="{$froggytoolbarv2.search_link|escape:'html':'UTF-8'}" method="post"><input type="search" name="bo_query" /><button type="submit" value="Search"><span class="fa fa-search"></span></button></form></li>
		<li class="display-box giant fc-toolbar-notification fc-toolbar-new-order" id="fc-toolbar-orders-notification-box">
			<a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminOrders' e=$froggytoolbarv2.id_employee}"><span class="fa fa-shopping-cart"><span class="fc-toolbar-notification-number" id="fc-toolbar-orders-notification-number"></span></span></a>
			<div class="fc-box-content">
				<div><span class="fc-toolbar-title-info">{l s='Last orders' mod='froggytoolbarv2'}</span></div>
				<p id="fc-toolbar-orders-notification-label-new" class="fc-toolbar-noti-label">{l s='New orders have been passed on your shop:' mod='froggytoolbarv2'}</p>
				<p id="fc-toolbar-orders-notification-label-no-new" class="fc-toolbar-noti-label">{l s='No new order on your shop.' mod='froggytoolbarv2'}</p>
				<ul id="fc-toolbar-orders-notification"></ul>
				<p class="footer-toolbar-box"><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminOrders' e=$froggytoolbarv2.id_employee}" class="fc-toolbar-seeall-link">{l s='See all orders' mod='froggytoolbarv2'}</a></p>
			</div>
		</li>
		<li class="display-box giant fc-toolbar-notification fc-toolbar-new-clients" id="fc-toolbar-customers-notification-box">
			<a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminCustomers' e=$froggytoolbarv2.id_employee}"><span class="fa fa-users"><span class="fc-toolbar-notification-number" id="fc-toolbar-customers-notification-number"></span></span></a>
			<div class="fc-box-content">
				<div><span class="fc-toolbar-title-info">{l s='Last customers' mod='froggytoolbarv2'}</span></div>
                <p id="fc-toolbar-customers-notification-label-new" class="fc-toolbar-noti-label">{l s='New customers have subscribed to your shop:' mod='froggytoolbarv2'}</p>
                <p id="fc-toolbar-customers-notification-label-no-new" class="fc-toolbar-noti-label">{l s='No new customer on your shop.' mod='froggytoolbarv2'}</p>
                <ul id="fc-toolbar-customers-notification"></ul>
                <p class="footer-toolbar-box"><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminCustomers' e=$froggytoolbarv2.id_employee}" class="fc-toolbar-seeall-link">{l s='See all customers' mod='froggytoolbarv2'}</a></p>
			</div>
		</li>
		<li class="display-box giant fc-toolbar-notification fc-toolbar-new-messages" id="fc-toolbar-messages-notification-box">
			<a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminCustomerThreads' e=$froggytoolbarv2.id_employee}"><span class="fa fa-comments"><span class="fc-toolbar-notification-number" id="fc-toolbar-messages-notification-number"></span></span></a>
			<div class="fc-box-content">
				<div><span class="fc-toolbar-title-info">{l s='Last messages' mod='froggytoolbarv2'}</span></div>
                <p id="fc-toolbar-messages-notification-label-new" class="fc-toolbar-noti-label">{l s='New messages in your box:' mod='froggytoolbarv2'}</p>
                <p id="fc-toolbar-messages-notification-label-no-new" class="fc-toolbar-noti-label">{l s='No new message in your box.' mod='froggytoolbarv2'}</p>
                <ul id="fc-toolbar-messages-notification"></ul>
                <p class="footer-toolbar-box"><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminCustomerThreads' e=$froggytoolbarv2.id_employee}" class="fc-toolbar-seeall-link">{l s='See all messages' mod='froggytoolbarv2'}</a></p>
			</div>
		</li>
		<li class="display-box" id="fc-toolbar-account-link">
			<a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminHome' e=$froggytoolbarv2.id_employee}">{l s='Hi' mod='froggytoolbarv2'}, {$froggytoolbarv2.firstname_employee}</a>
			<div class="fc-box-content">
				<ul>
					<li><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminHome' e=$froggytoolbarv2.id_employee}">{l s='Dashboard' mod='froggytoolbarv2'}</a></li>
					<li><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminEmployees' e=$froggytoolbarv2.id_employee}&id_employee={$froggytoolbarv2.id_employee}&updateemployee">{l s='Edit my profile' mod='froggytoolbarv2'}</a></li>
					<li id="fc-toolbar-logout"><a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminHome' e=$froggytoolbarv2.id_employee}&logout">{l s='Log out' mod='froggytoolbarv2'}</a></li>
				</ul>
			</div>
		</li>
	</ul>
</div>

{capture name='froggytoolbar_debug' assign=froggytoolbar_debug_output}
<div class="froggytoolbar-debug-container" id="froggytoolbar-debug-container">
	<h1>{l s='Froggy Toolbar Debug Mode' mod='froggytoolbarv2'}<span><img src="{$base_dir|escape:'html':'UTF-8'}modules/froggytoolbarv2/img/drag-arrow.png" class="froggytoolbar-debug-arrow-drag" id="froggytoolbar-debug-drag" /></span></h1>
	<fieldset>
		<legend>{l s='Border color' mod='froggytoolbarv2'}</legend>
		<label><input type="text" class="color" value="FF0000" id="froggytoolbar-debug-border-color" /></label>
	</fieldset>
	<fieldset>
		<legend>{l s='Border style' mod='froggytoolbarv2'}</legend>
		<label>
			<select id="froggytoolbar-debug-border-style">
				<option>solid</option>
				<option>none</option>
				<option>dotted</option>
				<option>dashed</option>
				<option>double</option>
				<option>groove</option>
				<option>ridge</option>
				<option>inset</option>
				<option>outset</option>
			</select>
		</label>
	</fieldset>
    {if isset($smarty.get.id_product)}
    <fieldset>
        <legend>{l s='Product ID' mod='froggytoolbarv2'}</legend>
		<label>{$smarty.get.id_product|intval}</label>
    </fieldset>
    {/if}
    {if isset($smarty.get.id_category)}
		<fieldset>
			<legend>{l s='Category ID' mod='froggytoolbarv2'}</legend>
			<label>{$smarty.get.id_category|intval}</label>
		</fieldset>
    {/if}
    {if isset($smarty.get.id_cms)}
		<fieldset>
			<legend>{l s='CMS ID' mod='froggytoolbarv2'}</legend>
			<label>{$smarty.get.id_cms|intval}</label>
		</fieldset>
    {/if}
	<fieldset>
		<legend>{l s='Active modules' mod='froggytoolbarv2'}</legend>
		<label>{$froggytoolbarv2.modules_displayed|@count}</label>
	</fieldset>
	<fieldset>
		<button class="froggytoolbar-debug-button" id="froggytoolbar-debug-valid">{l s='Valid' mod='froggytoolbarv2'}</button>
	</fieldset>
</div>
{/capture}


<script>
    var froggytoolbar_ps_version = '{$froggytoolbarv2.ps_version|escape:'html':'UTF-8'}';
    var froggytoolbar_notification_timer = ({$froggytoolbarv2.timer|intval} * 1000);
    {if $froggytoolbarv2.ps_version eq '1.4'}
        var froggytoolbar_notification_url = '{$base_dir|escape:'html':'UTF-8'}/modules/froggytoolbarv2/ajax.php';
	    var froggytoolbar_test_authentification_url = '{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir|escape:'html':'UTF-8'}ajax.php';
    {else}
        var froggytoolbar_notification_url = '{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir|escape:'html':'UTF-8'}ajax.php';
    {/if}
    var froggytoolbar_notification_template = '<li class="fc-toolbar-client-info">'+
            '<span class="fc-toolbar-client-name"><!--DATA--></span>'+
            '<a {$froggytoolbarv2.target_link|escape:'html':'UTF-8'}href="<!--LINK-->" title="{l s='See message' mod='froggytoolbarv2'}" class="fc-toolbar-client-link">'+"{l s='More info' mod='froggytoolbarv2'}"+'</a>'+
            '</li>';
    var froggytoolbar_orders_url = '{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminOrders' e=$froggytoolbarv2.id_employee}';
    var froggytoolbar_customers_url = '{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminCustomers' e=$froggytoolbarv2.id_employee}';
    var froggytoolbar_messages_url = '{$base_dir|escape:'html':'UTF-8'}{$froggytoolbarv2.admin_dir}{FroggyGetAdminLink a='AdminCustomerThreads' e=$froggytoolbarv2.id_employee}';

	var froggytoolbar_debug_box = '{$froggytoolbar_debug_output|escape:'javascript' nofilter}';
	var froggytoolbar_debug_enable_label = '{l s='Enable debug option' mod='froggytoolbarv2'}';
	var froggytoolbar_debug_disable_label = '{l s='Disable debug option' mod='froggytoolbarv2'}';
    var froggytoolbar_pictures_directory = ' {$base_dir|escape:'html':'UTF-8'}modules/froggytoolbarv2/img/';
</script>
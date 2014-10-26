{**
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
 *}

<div id="froggy-toolbar" class="toolbar-top">
	<ul class="fc-toolbar-list-link">
		<li class="froggy-link-toolbar first-floor toolbar-link">
			<a><span class="froggy-toolbar-link"></span></a>
			<ul class="fc-toolbar-submenu">
				<li><a {$froggytoolbar.target_link}href="http://www.froggy-commerce.com/">{l s='Froggy Commerce' mod='froggytoolbar'}</a></li>
				<li><a {$froggytoolbar.target_link}href="http://addons.prestashop.com/">{l s='PrestaShop Addons' mod='froggytoolbar'}</a></li>
				<li><a {$froggytoolbar.target_link}href="http://www.prestashop.com/forums/">{l s='PrestaShop Forum' mod='froggytoolbar'}</a></li>
			</ul>
		</li>
		<li class="backoffice-link-toolbar first-floor toolbar-link"><a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminHome' e=$froggytoolbar.id_employee}"><span class="fc-toolbar-backoffice"></span><span>{l s='Back-Office' mod='froggytoolbar'}</span></a>
			<ul class="fc-toolbar-submenu">
				<li><a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminOrders' e=$froggytoolbar.id_employee}">{l s='Orders' mod='froggytoolbar'}</a></li>
				<li><a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminProducts' e=$froggytoolbar.id_employee}">{l s='Products' mod='froggytoolbar'}</a></li>
				<li><a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminCategories' e=$froggytoolbar.id_employee}">{l s='Categories' mod='froggytoolbar'}</a></li>
				<li><a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminModules' e=$froggytoolbar.id_employee}">{l s='Modules' mod='froggytoolbar'}</a></li>
			</ul>
		</li>
		<li class="news-toolbar first-floor toolbar-link"><a href="#"><span class="fc-toolbar-icon-plus"></span><span>{l s='New' mod='froggytoolbar'}</span></a>
			<ul class="fc-toolbar-submenu">
				<li><a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminProducts' e=$froggytoolbar.id_employee}&addproduct">{l s='New product' mod='froggytoolbar'}</a></li>
				<li><a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminCategories' e=$froggytoolbar.id_employee}&addcategory">{l s='New category' mod='froggytoolbar'}</a></li>
				<li><a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminCmsContent' e=$froggytoolbar.id_employee}&addcms">{l s='New page CMS' mod='froggytoolbar'}</a></li>
			</ul>
		</li>
        {if isset($smarty.get.id_product) || isset($smarty.get.id_category) || isset($smarty.get.id_cms)}
		    <li class="edit-page toolbar-link">
                {if isset($smarty.get.id_product) && $smarty.get.id_product gt 0}
                    <a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminProducts' e=$froggytoolbar.id_employee}&updateproduct&id_product={$smarty.get.id_product}">
                {elseif isset($smarty.get.id_category) && $smarty.get.id_category gt 0}
                    <a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminCategories' e=$froggytoolbar.id_employee}&updatecategory&id_category={$smarty.get.id_category}">
                {elseif isset($smarty.get.id_cms) && $smarty.get.id_cms gt 0}
                    <a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminCmsContent' e=$froggytoolbar.id_employee}&updatecms&id_cms={$smarty.get.id_cms}">
                {else}
                    <a href="#">
                {/if}
                    <span class="fc-toolbar-edit-page"></span><span>{l s='Edit' mod='froggytoolbar'}</span>
                </a>
            </li>
        {/if}
	</ul>
	<ul class="fc-toolbar-box">
		<li class="display-box giant fc-toolbar-notification fc-toolbar-new-order" id="fc-toolbar-orders-notification-box">
			<a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminOrders' e=$froggytoolbar.id_employee}"><span class="fc-toolbar-icon-order"><span class="fc-toolbar-notification-number" id="fc-toolbar-orders-notification-number"></span></span></a>
			<div class="fc-box-content">
				<div><span class="fc-toolbar-title-info">{l s='Last orders' mod='froggytoolbar'}</span></div>
				<p id="fc-toolbar-orders-notification-label-new" class="fc-toolbar-noti-label">{l s='New orders have been passed on your shop:' mod='froggytoolbar'}</p>
				<p id="fc-toolbar-orders-notification-label-no-new" class="fc-toolbar-noti-label">{l s='No new order on your shop.' mod='froggytoolbar'}</p>
				<ul id="fc-toolbar-orders-notification"></ul>
				<p class="footer-toolbar-box"><a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminOrders' e=$froggytoolbar.id_employee}" class="fc-toolbar-seeall-link">{l s='See all orders' mod='froggytoolbar'}</a></p>
			</div>
		</li>
		<li class="display-box giant fc-toolbar-notification fc-toolbar-new-clients" id="fc-toolbar-customers-notification-box">
			<a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminCustomers' e=$froggytoolbar.id_employee}"><span class="fc-toolbar-icon-clients"><span class="fc-toolbar-notification-number" id="fc-toolbar-customers-notification-number"></span></span></a>
			<div class="fc-box-content">
				<div><span class="fc-toolbar-title-info">{l s='Last customers' mod='froggytoolbar'}</span></div>
                <p id="fc-toolbar-customers-notification-label-new" class="fc-toolbar-noti-label">{l s='New customers have subscribed to your shop:' mod='froggytoolbar'}</p>
                <p id="fc-toolbar-customers-notification-label-no-new" class="fc-toolbar-noti-label">{l s='No new customer on your shop.' mod='froggytoolbar'}</p>
                <ul id="fc-toolbar-customers-notification"></ul>
                <p class="footer-toolbar-box"><a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminCustomers' e=$froggytoolbar.id_employee}" class="fc-toolbar-seeall-link">{l s='See all customers' mod='froggytoolbar'}</a></p>
			</div>
		</li>
		<li class="display-box giant fc-toolbar-notification fc-toolbar-new-messages" id="fc-toolbar-messages-notification-box">
			<a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminCustomerThreads' e=$froggytoolbar.id_employee}"><span class="fc-toolbar-icon-message"><span class="fc-toolbar-notification-number" id="fc-toolbar-messages-notification-number"></span></span></a>
			<div class="fc-box-content">
				<div><span class="fc-toolbar-title-info">{l s='Last messages' mod='froggytoolbar'}</span></div>
                <p id="fc-toolbar-messages-notification-label-new" class="fc-toolbar-noti-label">{l s='New messages in your box:' mod='froggytoolbar'}</p>
                <p id="fc-toolbar-messages-notification-label-no-new" class="fc-toolbar-noti-label">{l s='No new message in your box.' mod='froggytoolbar'}</p>
                <ul id="fc-toolbar-messages-notification"></ul>
                <p class="footer-toolbar-box"><a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminCustomerThreads' e=$froggytoolbar.id_employee}" class="fc-toolbar-seeall-link">{l s='See all messages' mod='froggytoolbar'}</a></p>
			</div>
		</li>
		<li class="display-box" id="fc-toolbar-account-link">
			<a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminHome' e=$froggytoolbar.id_employee}">{l s='Hi' mod='froggytoolbar'}, {$froggytoolbar.firstname_employee}</a>
			<div class="fc-box-content">
				<ul>
					<li><a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminHome' e=$froggytoolbar.id_employee}">{l s='Dashboard' mod='froggytoolbar'}</a></li>
					<li><a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminEmployees' e=$froggytoolbar.id_employee}&id_employee={$froggytoolbar.id_employee}&updateemployee">{l s='Edit my profile' mod='froggytoolbar'}</a></li>
					<li id="fc-toolbar-logout"><a {$froggytoolbar.target_link}href="{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminHome' e=$froggytoolbar.id_employee}&logout">{l s='Log out' mod='froggytoolbar'}</a></li>
				</ul>
			</div>
		</li>
	</ul>
</div>
<script>
    var froggytoolbar_ps_version = '{$froggytoolbar.ps_version}';
    var froggytoolbar_notification_timer = {$froggytoolbar.timer};
    {if $froggytoolbar.ps_version eq '1.4'}
        var froggytoolbar_notification_url = '{$base_dir}/modules/froggytoolbar/ajax.php';
    {else}
        var froggytoolbar_notification_url = '{$base_dir}{$froggytoolbar.admin_dir}ajax.php';
    {/if}
    var froggytoolbar_notification_template = '<li class="fc-toolbar-client-info">'+
            '<span class="fc-toolbar-client-name"><!--DATA--></span>'+
            '<a {$froggytoolbar.target_link}href="<!--LINK-->" title="{l s='See message' mod='froggytoolbar'}" class="fc-toolbar-client-link">'+"{l s='More info' mod='froggytoolbar'}"+'</a>'+
            '</li>';
    var froggytoolbar_orders_url = '{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminOrders' e=$froggytoolbar.id_employee}';
    var froggytoolbar_customers_url = '{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminCustomers' e=$froggytoolbar.id_employee}';
    var froggytoolbar_messages_url = '{$base_dir}{$froggytoolbar.admin_dir}{FroggyGetAdminLink a='AdminCustomerThreads' e=$froggytoolbar.id_employee}';
</script>
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

$(document).ready(function() {
    froggyToolbarRefresh(1);
    $('#fc-toolbar-logout').click(function() {
        froggyToolbarRefresh(0);
    });
});


function froggyToolbarRefresh(recursive)
{
    if (froggytoolbar_ps_version == '1.4')
        froggyToolbarCheckLogoutOnPS14(recursive);
    froggyToolbarRefreshNotification(recursive);
    froggyToolbarViewNotification();
}


function froggyToolbarRefreshNotification(recursive)
{
    // Make ajax request
    $.ajax({
        url: froggytoolbar_notification_url,
        type: 'POST',
        data: { getNotifications: '1' },
        complete: function(jqXHR, textStatus) {
            try
            {
                // Parse JSON
                var json = $.parseJSON(jqXHR.responseText);

                // Build notification
                froggyToolbarBuildNotification('orders', json.order);
                froggyToolbarBuildNotification('customers', json.customer);
                froggyToolbarBuildNotification('messages', json.customer_message);
            }
            catch(e)
            {
                // If not Json, we log out
                $.ajax({
                    url: window.location.href, type: 'POST',
                    data: { logout: 'true' },
                    complete: function() { window.location.href = window.location.href }
                });
            }
        }
    });

    if (recursive == 1)
    {
        setTimeout(function() {
            froggyToolbarRefreshNotification();
        }, froggytoolbar_notification_timer);
    }
}


function froggyToolbarBuildNotification(notification_type, data)
{
    // Show label No new notification
    $('#fc-toolbar-' + notification_type + '-notification-label-new').hide();
    $('#fc-toolbar-' + notification_type + '-notification-label-no-new').show();

    // Remove notification color
    $('#fc-toolbar-' + notification_type + '-notification-box').removeClass('fc-toolbar-notification');

    // Make toolbar compliant 1.6
    if ("results" in data)
        data = data.results;

    // Build html
    var html = '';
    var count = 0;
    $.each(data, function(property, value) {
        var tmp = froggytoolbar_notification_template;

        if (notification_type == 'orders')
        {
            tmp = tmp.replace('<!--DATA-->', '#' + parseInt(value.id_order) + ' - ' + value.customer_name + ' - ' + value.total_paid);
            tmp = tmp.replace('<!--LINK-->', froggytoolbar_orders_url + '&vieworder&id_order=' + parseInt(value.id_order));
        }
        else if (notification_type == 'customers')
        {
            tmp = tmp.replace('<!--DATA-->', value.customer_name);
            tmp = tmp.replace('<!--LINK-->', froggytoolbar_customers_url + '&viewcustomer&id_customer=' + parseInt(value.id_customer));
        }
        else if (notification_type == 'messages')
        {
            tmp = tmp.replace('<!--DATA-->', value.customer_name);
            tmp = tmp.replace('<!--LINK-->', froggytoolbar_messages_url + '&viewcustomer_thread&id_customer_thread=' + parseInt(value.id_customer_thread));
        }

        html += tmp;
        count++;
    });

    // Fill list
    $('#fc-toolbar-' + notification_type + '-notification').html(html);
    if (count > 0)
    {
        // Display notification number
		if (froggytoolbar_ps_version == '1.6')
	        $('#fc-toolbar-' + notification_type + '-notification-number').html('+' + count);
		else
			$('#fc-toolbar-' + notification_type + '-notification-number').html('&nbsp; +' + count);

        // Show label New notification
        $('#fc-toolbar-' + notification_type + '-notification-label-new').show();
        $('#fc-toolbar-' + notification_type + '-notification-label-no-new').hide();

        // Add notification color
        $('#fc-toolbar-' + notification_type + '-notification-box').addClass('fc-toolbar-notification');
    }
}


function froggyToolbarViewNotification()
{
    $('#fc-toolbar-orders-notification-box').click(function() {
        $.ajax({
            url: froggytoolbar_notification_url, type: 'POST',
            data: { updateElementEmployee: '1', updateElementEmployeeType: 'order' },
            complete: function() { froggyToolbarRefreshNotification(0); }
        });
    });
    $('#fc-toolbar-customers-notification-box').click(function() {
        $.ajax({
            url: froggytoolbar_notification_url, type: 'POST',
            data: { updateElementEmployee: '1', updateElementEmployeeType: 'customer' },
            complete: function() { froggyToolbarRefreshNotification(0); }
        });
    });
    $('#fc-toolbar-messages-notification-box').click(function() {
        $.ajax({
            url: froggytoolbar_notification_url, type: 'POST',
            data: { updateElementEmployee: '1', updateElementEmployeeType: 'customer_message' },
            complete: function() { froggyToolbarRefreshNotification(0); }
        });
    });
}


function froggyToolbarCheckLogoutOnPS14(recursive)
{
    // Make ajax request compliant with jquery 1.4
    $.ajax({
        url: froggytoolbar_notification_url,
        data: { ajaxProductManufacturers: '1' },
        complete: function(jqXHR, textStatus) {
            try { var json = $.parseJSON(jqXHR.responseText); }
            catch(e)
            {
                // If not Json, we log out
                $.ajax({
                    url: window.location.href, type: 'POST',
                    data: { logout: 'true' },
                    complete: function() { window.location.href = window.location.href }
                });
            }
        }
    });

    if (recursive == 1)
    {
        setTimeout(function() {
            froggyToolbarCheckLogoutOnPS14(1);
        }, froggytoolbar_notification_timer);

    }
}

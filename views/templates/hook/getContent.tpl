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

<fieldset id="froggytoolbar_fieldset">
	<legend><img src="{$froggytoolbar.module_dir}logo.png" alt="" width="16" />{l s='Froggy Toolbar' mod='froggytoolbar'}</legend>

    {if $froggytoolbar.result eq 'OK'}
        <div class="conf confirm">{l s='The new configuration has been saved!' mod='froggytoolbar'}</div>
    {/if}

	<h3>{l s='Options' mod='froggytoolbar'}</h3>
	<div id="froggytoolbar_options">
        <form method="POST" action="">
            <label>{l s='Open link:' mod='froggytoolbar'}</label>
            <div class="margin-form">
                <select name="FC_TLB_TARGET_LINK">
                    <option value="" {if $froggytoolbar.target_link eq ''}selected="selected"{/if}>{l s='In the same page' mod='froggytoolbar'}</option>
                    <option value="_blank" {if $froggytoolbar.target_link eq '_blank'}selected="selected"{/if}>{l s='In a new page' mod='froggytoolbar'}</option>
                </select>
            </div>
            <label>{l s='Notifications refresh each:' mod='froggytoolbar'}</label>
            <div class="margin-form"><input type="text" name="FC_TLB_TIMER" value="{$froggytoolbar.timer / 1000}" /> s</div>
            <p>{l s='Refresh timer must be upper than 15s' mod='froggytoolbar'}</p>
            <label><input type="submit" value="{l s='Save' mod='froggytoolbar'}" name="froggytoolbar_ft_form" class="button" /></label>
        </form>
	</div>
</fieldset>

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

<h2 align="center">{l s='Froggy Advanced Toolbar' mod='froggytoolbar'}</h2>

<fieldset id="froggytoolbar_fieldset">
	<legend><img src="{$froggytoolbarv2.module_dir}logo.png" alt="" width="16" />{l s='Froggy Advanced Toolbar' mod='froggytoolbar'}</legend>
    <div class="panel">
        {if $froggytoolbarv2.result eq 'OK'}
            <div class="module_confirmation conf confirm alert alert-success">{l s='The new configuration has been saved!' mod='froggytoolbar'}</div>
        {/if}

    	<h3>{l s='Options' mod='froggytoolbar'}</h3>
    	<div id="froggytoolbar_options">
            <form method="POST" action="" class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-lg-3">{l s='Open link:' mod='froggytoolbar'}</label>
                    <div class="col-lg-9">
                        <select name="FC_TLB_TARGET_LINK">
                            <option value="" {if $froggytoolbarv2.target_link eq ''}selected="selected"{/if}>{l s='In the same page' mod='froggytoolbar'}</option>
                            <option value="_blank" {if $froggytoolbarv2.target_link eq '_blank'}selected="selected"{/if}>{l s='In a new page' mod='froggytoolbar'}</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3">{l s='Notifications refresh each (in seconds):' mod='froggytoolbar'}</label>
                    <div class="col-lg-9"><input type="text" name="FC_TLB_TIMER" value="{$froggytoolbarv2.timer / 1000}" />
                        <p class="help-block">{l s='Refresh timer must be upper than 15s' mod='froggytoolbar'}</p>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-9 col-lg-offset-3"><input type="submit" value="{l s='Save' mod='froggytoolbar'}" name="froggytoolbar_ft_form" class="btn btn-default" /></div>
                </div>
            </form>
    	</div>
    </div>
</fieldset>

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

{if $froggytoolbarv2.form_result === true}
    <div class="conf confirm">{l s='The new configuration has been saved!' mod='froggytoolbarv2'}</div>
{elseif $froggytoolbarv2.form_result != ''}
    <p class="error"><strong>{$froggytoolbarv2.form_result|escape:'html':'UTF-8'}</strong></p>
{/if}

{FroggyDisplaySafeHtml s=$froggytoolbarv2.helper_display}


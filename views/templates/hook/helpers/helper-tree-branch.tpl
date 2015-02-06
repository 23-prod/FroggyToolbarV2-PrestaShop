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

<ul class="froggy-categories-tree">
{foreach from=$categories_tree_branches item=branch}
	<li><input type="checkbox" class="categories-tree-checkbox-{$categories_tree_id}" name="{$categories_tree_attribute_name}[]" value="{$branch.id_category}"{if $branch.checked} checked{/if} /> {$branch.name}{$branch.children}</li>
{/foreach}
</ul>
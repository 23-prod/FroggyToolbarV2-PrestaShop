<?php
/**
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
 */

class FroggyToolbarV2HookGetContentProcessor extends FroggyHookProcessor
{
	/**
	 * Init Helper
	 * @return string HTML
	 */
	public function initHelper()
	{
		$select_values = array(
			$this->module->l('In the same page') => '',
			$this->module->l('In a new page') => '_blank',
		);

		$configuration = array();

		$configuration['configuration'] = array(
			'key' => 'configuration',
			'label' => $this->module->l('Configuration'),
			'form' => array(
				'Options' => array(
					'label' => $this->module->l('Options'),
					'fields' => array(
						array('type' => 'select', 'label' => $this->module->l('Open link:'), 'name' => 'FC_TLB_TARGET_LINK', 'default_value' => Configuration::get('FC_TLB_TARGET_LINK'), 'values' => $select_values),
						array('type' => 'text', 'label' => $this->module->l('Notifications refresh each (in seconds):'), 'name' => 'FC_TLB_TIMER', 'default_value' =>  Configuration::get('FC_TLB_TIMER'), 'desc' => $this->module->l('Refresh timer must be upper than 15s')),
					)
				),
			)
		);

		$configuration['shortcut'] = array(
			'key' => 'shortcut',
			'label' => $this->module->l('My shortcuts'),
			'list' => array(
				'labels' => array(
					'id_ftv2_custom_menu' => $this->module->l('ID'),
					'label' => $this->module->l('Label'),
					'link' => $this->module->l('Link'),
					'date_add' => $this->module->l('Date add'),
				),
				'data_request' => 'SELECT *, `id_ftv2_custom_menu` as id FROM `'._DB_PREFIX_.'ftv2_custom_menu` WHERE `id_employee` = '.(int)$this->context->employee->id,
			),
			'form' => array(
				'Shortcuts' => array(
					'label' => $this->module->l('Shortcuts'),
					'fields' => array(
						array('type' => 'text', 'label' => $this->module->l('Label:'), 'name' => 'label', 'desc' => $this->module->l('The label of your shortcut.'), 'prefill' => false),
						array('type' => 'text', 'label' => $this->module->l('Link:'), 'name' => 'link', 'desc' => $this->module->l('The link of your shortcut.'), 'prefill' => false),
					)
				)
			)
		);

		$helper = new FroggyHelperFormList();
		$helper->setFormUrl($this->module->configuration_url);
		$helper->setContext($this->context);
		$helper->setModule($this->module);

		$helper->setConfiguration($configuration['configuration']);
		$helper->prefillFormFields();
		$result = $helper->render();

		$helper->setConfiguration($configuration['shortcut']);
		$helper->prefillFormFields();
		$result .= $helper->render();

		return $result;
	}

	public function processOptions()
	{
		Configuration::updateValue('FC_TLB_TARGET_LINK', Tools::getValue('FC_TLB_TARGET_LINK'));
		Configuration::updateValue('FC_TLB_TIMER', 15);
		$timer = (int)((int)Tools::getValue('FC_TLB_TIMER'));
		if ($timer > 15000)
			$timer = $timer / 1000;
		if ($timer > 15)
			Configuration::updateValue('FC_TLB_TIMER', (int)$timer);
		return true;
	}

	public function processShortcuts()
	{
		$menu = new FroggyToolbarCustomMenu();
		$menu->label = Tools::getValue('label');
		$menu->link = Tools::getValue('link');
		$menu->id_employee = $this->context->employee->id;
		$menu->date_add = date('Y-m-d H:i:s');
		try {
			if (Tools::substr(_PS_VERSION_, 0, 3) == '1.4')
			{
				$return = $menu->validateFields(false, true);
				if ($return !== true)
					throw new Exception($return);
			}
			$menu->add();
			return true;
		} catch (Exception $e) {
			return $e->getMessage();
		}
		return false;
	}

	/**
	 * Configuration method
	 * @return string $html
	 */
	public function run()
	{
		$form_result = false;
		if (Tools::isSubmit('froggytoolbarv2-configuration-submit'))
			$form_result = $this->processOptions();
		if (Tools::isSubmit('froggytoolbarv2-shortcut-submit'))
			$form_result = $this->processShortcuts();
		if (Tools::isSubmit('delete-shortcut'))
		{
			$menu = new FroggyToolbarCustomMenu((int)Tools::getValue('delete-shortcut'));
			if ($menu->id > 0)
				$menu->delete();
		}

		$assign = array(
			'module_dir' => $this->path,
			'helper_display' => $this->initHelper(),
			'form_result' => $form_result,
		);

		$this->smarty->assign($this->module->name, $assign);
		return $this->module->fcdisplay(__FILE__, 'getContent.tpl');
	}
}
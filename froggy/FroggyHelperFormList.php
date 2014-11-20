<?php
/*
* 2010 - 2014 Sellermania / Froggy Commerce / 23Prod SARL
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to team@froggy-commerce.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade your module to newer
* versions in the future.
*
*  @author Fabien Serny - Froggy Commerce <team@froggy-commerce.com>
*  @copyright	2010-2014 Sellermania / Froggy Commerce / 23Prod SARL
*  @version		1.0
*  @license		http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*/

// Security
if (!defined('_PS_VERSION_'))
	exit;

class FroggyHelperFormList
{
	private $configuration;
	private $form_url;
	private $module;
	private $context;

	public function setConfiguration($configuration)
	{
		$this->configuration = $configuration;
	}

	public function setFormUrl($form_url)
	{
		$this->form_url = $form_url;
	}

	public function setModule($module)
	{
		$this->module = $module;
	}

	public function setContext($context)
	{
		$this->context = $context;
	}

	public function prefillFormFields()
	{
		if (isset($this->configuration['form']))
			foreach ($this->configuration['form'] as $key_section => $sections)
				foreach ($sections['fields'] as $key_field => $field)
					if (!isset($field['prefill']))
						$this->configuration['form'][$key_section]['fields'][$key_field]['value'] = Tools::getValue($field['name'], (isset($field['default_value']) ? $field['default_value'] : ''));

		if (isset($this->configuration['list']['data_request']))
			$this->configuration['list']['data'] = Db::getInstance()->executeS($this->configuration['list']['data_request']);
	}

	public function render()
	{
		$assign = array(
			'module_name' => $this->module->name,
			'configuration' => $this->configuration,
			'form_url' => $this->form_url,
			'templates_dir' => dirname(__FILE__).'/../../'.$this->module->name.'/views/templates/hook/helpers',
		);

		$this->context->smarty->assign('froggyhelper', $assign);
		return $this->module->fcdisplay(dirname(__FILE__).'/../../'.$this->module->name, 'helpers/helper.tpl');
	}
}
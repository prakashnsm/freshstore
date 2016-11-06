<?php
/*
 * 2007-2013 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 *  @author PrestaShop SA <contact@prestashop.com>
 *  @copyright  2007-2013 PrestaShop SA
 *  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 */

if (!defined('_PS_VERSION_'))
	exit;


require_once(_PS_MODULE_DIR_ . 'blockleoblogs/classes/blockleoblogsModel.php');
require_once(_PS_MODULE_DIR_ . 'blockleoblogs/classes/blockleoblogsTools.php');

class blockleoblogs extends Module
{
	private $_html = '';
	private $_postErrors = array();
	public $isInstalled = false;
	public $fields_form = array();

	public function __construct()
	{
		$this->name = 'blockleoblogs';
		$this->tab = 'front_office_features';
		$this->version = 0.9;
		$this->author = 'PrestaShop';
		$this->need_instance = 0;

		$this->bootstrap = true;
		parent::__construct();

		$this->displayName = $this->l('Leo Blogs Latest Modules');
		$this->description = $this->l('This modules works with leoblog module.');
	}

	public function install()
	{
		$data = array();
		$encode_parram = BlockleoblogsTools::encode($data); // W10=

		if (parent::install() && $this->registerHook('displayHome') && $this->registerHook('header') && $this->registerHook('displayBottom') && Configuration::updateValue('BLEOBLOGS_NBR', 6) && Configuration::updateValue('BLEOBLOGS_PAGE', 3) && Configuration::updateValue('BLEOBLOGS_COL', 3) && Configuration::updateValue('BLEOBLOGS_INTV', 8000) && Configuration::updateValue('BLEOBLOGS_SHOW', 1) && Configuration::updateValue('BLEOBLOGS_WIDTH', 690) && Configuration::updateValue('BLEOBLOGS_HEIGHT', 300) && Configuration::updateValue('BLEOBLOGS_SCATE', 1) && Configuration::updateValue('BLEOBLOGS_SIMA', 1) && Configuration::updateValue('BLEOBLOGS_SAUT', 1) && Configuration::updateValue('BLEOBLOGS_SCAT', 1) && Configuration::updateValue('BLEOBLOGS_SCRE', 1) && Configuration::updateValue('BLEOBLOGS_STITLE', 1) && Configuration::updateValue('BLEOBLOGS_SCOUN', 1) && Configuration::updateValue('BLEOBLOGS_SHITS', 1) && Configuration::updateValue('BLEOBLOGS_PARAM', $encode_parram)) {
			$res = true;
			$res = $this->_installDataSample();
			return (bool) $res;
		}
		return false;
	}

	private function _installDataSample()
	{
		if (!file_exists(_PS_MODULE_DIR_ . 'leotempcp/libs/DataSample.php'))
			return true;
		require_once( _PS_MODULE_DIR_ . 'leotempcp/libs/DataSample.php' );

		$sample = new Datasample(1);
		return $sample->processImport($this->name);
	}

	public function getContent()
	{
		$output = '';
		if (Tools::isSubmit('submitBlockLeoBlogs')) {
			if (!($productNbr = Tools::getValue('BLEOBLOGS_NBR')) || empty($productNbr))
				$output .= $this->displayError($this->l('You must fill in the \'Products displayed\' field.'));
			elseif ((int) ($productNbr) == 0)
				$output .= $this->displayError($this->l('Invalid number.'));
			else {
				Configuration::updateValue('BLEOBLOGS_NBR', (int) $productNbr);
				Configuration::updateValue('BLEOBLOGS_WIDTH', (int) Tools::getValue('BLEOBLOGS_WIDTH'));
				Configuration::updateValue('BLEOBLOGS_HEIGHT', (int) Tools::getValue('BLEOBLOGS_HEIGHT'));
				Configuration::updateValue('BLEOBLOGS_PAGE', (int) Tools::getValue('BLEOBLOGS_PAGE'));
				Configuration::updateValue('BLEOBLOGS_COL', (int) Tools::getValue('BLEOBLOGS_COL'));
				Configuration::updateValue('BLEOBLOGS_INTV', (int) Tools::getValue('BLEOBLOGS_INTV'));
				Configuration::updateValue('BLEOBLOGS_SHOW', (int) Tools::getValue('BLEOBLOGS_SHOW'));
				Configuration::updateValue('BLEOBLOGS_SDES', (int) Tools::getValue('BLEOBLOGS_SDES'));
				Configuration::updateValue('BLEOBLOGS_SIMA', (int) Tools::getValue('BLEOBLOGS_SIMA'));
				Configuration::updateValue('BLEOBLOGS_SAUT', (int) Tools::getValue('BLEOBLOGS_SAUT'));
				Configuration::updateValue('BLEOBLOGS_SCAT', (int) Tools::getValue('BLEOBLOGS_SCAT'));
				Configuration::updateValue('BLEOBLOGS_SCRE', (int) Tools::getValue('BLEOBLOGS_SCRE'));
				Configuration::updateValue('BLEOBLOGS_STITLE', (int) Tools::getValue('BLEOBLOGS_STITLE'));
				Configuration::updateValue('BLEOBLOGS_SCOUN', (int) Tools::getValue('BLEOBLOGS_SCOUN'));
				Configuration::updateValue('BLEOBLOGS_SHITS', (int) Tools::getValue('BLEOBLOGS_SHITS'));


				$tmp = array();
				foreach ($_POST as $key => $value)
				{
					$tmp[$key] = str_replace(array("\'", '\"'), array("'", '"'), $value);
				}

				$data = BlockleoblogsTools::encode($tmp);
				Configuration::updateValue('BLEOBLOGS_PARAM', $data);


				$output .= $this->displayConfirmation($this->l('Settings updated'));
			}
		}
		return $output . $this->renderForm();
	}

	public function hookDisplayHome($params)
	{

		return $this->hookRightColumn($params);
	}

	public function hookDisplayLeftColumn($params)
	{
		return $this->hookRightColumn($params);
	}

	public function hookDisplayFooter($params)
	{
		return $this->hookRightColumn($params);
	}

	public function hookDisplayPromoteTop($params)
	{
		return $this->hookRightColumn($params);
	}

	public function hookDisplayContentBottom($params)
	{
		return $this->hookRightColumn($params);
	}

	public function hookDisplayBottom($params)
	{
		return $this->hookRightColumn($params);
	}

	public function hookDisplayFooterTop($params)
	{
		return $this->hookRightColumn($params);
	}

	public function hookDisplayFooterBottom($params)
	{
		return $this->hookRightColumn($params);
	}

	public function hookRightColumn($params)
	{


		if (file_exists(_PS_MODULE_DIR_ . 'leoblog/classes/config.php')) {
			$this->isInstalled = true;
			require_once( _PS_MODULE_DIR_ . 'leoblog/loader.php' );


			$authors = array();
			$config = LeoBlogConfig::getInstance();

			$config->setVar('blockleo_blogs_height', Configuration::get('BLEOBLOGS_HEIGHT'));
			$config->setVar('blockleo_blogs_width', Configuration::get('BLEOBLOGS_WIDTH'));
			$config->setVar('blockleo_blogs_limit', Configuration::get('BLEOBLOGS_NBR'));
			$config->setVar('blockleo_blogs_page', Configuration::get('BLEOBLOGS_PAGE'));
			$config->setVar('blockleo_blogs_col', Configuration::get('BLEOBLOGS_COL'));
			$config->setVar('blockleo_blogs_intv', Configuration::get('BLEOBLOGS_INTV'));
			$config->setVar('blockleo_blogs_show', Configuration::get('BLEOBLOGS_SHOW'));
			$config->setVar('blockleo_blogs_des', Configuration::get('BLEOBLOGS_SDES'));
			$config->setVar('blockleo_blogs_img', Configuration::get('BLEOBLOGS_SIMA'));
			$config->setVar('blockleo_blogs_aut', Configuration::get('BLEOBLOGS_SAUT'));
			$config->setVar('blockleo_blogs_cat', Configuration::get('BLEOBLOGS_SCAT'));
			$config->setVar('blockleo_blogs_cre', Configuration::get('BLEOBLOGS_SCRE'));
			$config->setVar('blockleo_blogs_cout', Configuration::get('BLEOBLOGS_SCOUN'));
			$config->setVar('blockleo_blogs_title', Configuration::get('BLEOBLOGS_STITLE'));
			$config->setVar('blockleo_blogs_hits', Configuration::get('BLEOBLOGS_SHITS'));
			$limit = (int) $config->get('blockleo_blogs_limit', 6);


			$blogs = LeoBlogBlog::getListBlogs(null, $this->context->language->id, 0, $limit, 'date_add', 'DESC', array(), true);
			$helper = LeoBlogHelper::getInstance();



			$image_w = (int) $config->get('blockleo_blogs_width', 690);
			$image_h = (int) $config->get('blockleo_blogs_height', 300);
			$link = LeoBlogHelper::getInstance()->getFontBlogLink();

			foreach ($blogs as $key => $blog)
			{
				$blog = LeoBlogHelper::buildBlog($helper, $blog, $image_w, $image_h, $config);
				if ($blog['id_employee']) {
					if (!isset($authors[$blog['id_employee']])) {
						$authors[$blog['id_employee']] = new Employee($blog['id_employee']);
					}

					$blog['author'] = $authors[$blog['id_employee']]->firstname . " " . $authors[$blog['id_employee']]->lastname;
					$blog['author_link'] = $helper->getBlogAuthorLink($authors[$blog['id_employee']]->id);
				} else {
					$blog['author'] = '';
					$blog['author_link'] = '';
				}

				$blogs[$key] = $blog;
			}

			$itemsperpage = (int) $config->get('blockleo_blogs_page', 3);
			$columnspage = (int) $config->get('blockleo_blogs_col', 3);

			$param = Configuration::get('BLEOBLOGS_PARAM');
			$data = BlockleoblogsTools::decode($param);



//			$interval = (int)$config->get( 'blockleo_blogs_inteval', 8000 );
			$interval = (int) Configuration::get('BLEOBLOGS_INTV');
			$this->smarty->assign('view_all_link', $link);
			$this->smarty->assign('blogs', $blogs);
			$this->smarty->assign('config', $config);
			$mytab = 'blockleoblogs' . rand(20, rand());
			$this->smarty->assign('mytab', $mytab);
			$this->smarty->assign(array(
				'itemsperpage' => $itemsperpage,
				'columnspage' => $columnspage,
				'scolumn' => 12 / $columnspage,
				'interval' => $interval
			));

			$this->context->controller->addCSS(($this->_path) . 'blogcarousel.css', 'all');
			$this->loadOwlCarouselLib();


			$file_name = 'blockleoblogs.tpl';
			if (isset($data['carousel_type']) && $data['carousel_type'] == LeoblogOwlCarousel::CAROUSEL_OWL) {
				$this->smarty->assign($data);
				$file_name = 'blockleoblogs_owl.tpl';
			}

			return $this->display(__FILE__, $file_name);
		} else {

			return;
		}
	}

	public function hookLeftColumn($params)
	{
		return $this->hookRightColumn($params);
	}

	public function hookHeader($params)
	{
		$this->context->controller->addCSS(($this->_path) . 'blockleoblogs.css', 'all');
	}

	public function renderForm()
	{
		$this->context->controller->addJS(__PS_BASE_URI__ . 'modules/blockleoblogs/assets/admin/jquery-validation-1.9.0/jquery.validate.js');
		$this->context->controller->addCSS(__PS_BASE_URI__ . 'modules/blockleoblogs/assets/admin/jquery-validation-1.9.0/screen.css');

		$this->context->controller->addJS(__PS_BASE_URI__ . 'modules/blockleoblogs/assets/admin/show.js');
		$fields_form = array(
			'form' => array(
				'legend' => array(
					'title' => $this->l('Settings'),
					'icon' => 'icon-cogs'
				),
				'input' => array(
					array(
						'type' => 'text',
						'label' => $this->l('Image Blog Width'),
						'name' => 'BLEOBLOGS_WIDTH',
						'class' => 'fixed-width-xs',
						'desc' => $this->l('Define the width of images displayed in this block.')
					),
					array(
						'type' => 'text',
						'label' => $this->l('Image Blog Height.'),
						'name' => 'BLEOBLOGS_HEIGHT',
						'class' => 'fixed-width-xs',
						'desc' => $this->l('Define the height of images displayed in this block.')
					),
					array(
						'type' => 'switch',
						'label' => $this->l('Show View All'),
						'name' => 'BLEOBLOGS_SHOW',
						'values' => array(
							array(
								'id' => 'active_on',
								'value' => 1,
								'label' => $this->l('Enabled')
							),
							array(
								'id' => 'active_off',
								'value' => 0,
								'label' => $this->l('Disabled')
							)
						),
					),
					array(
						'type' => 'switch',
						'label' => $this->l('Show Title:'),
						'name' => 'BLEOBLOGS_STITLE',
						'values' => array(
							array(
								'id' => 'active_on',
								'value' => 1,
								'label' => $this->l('Enabled')
							),
							array(
								'id' => 'active_off',
								'value' => 0,
								'label' => $this->l('Disabled')
							)
						),
					),
					array(
						'type' => 'switch',
						'label' => $this->l('Show Description:'),
						'name' => 'BLEOBLOGS_SDES',
						'values' => array(
							array(
								'id' => 'active_on',
								'value' => 1,
								'label' => $this->l('Enabled')
							),
							array(
								'id' => 'active_off',
								'value' => 0,
								'label' => $this->l('Disabled')
							)
						),
					),
					array(
						'type' => 'switch',
						'label' => $this->l('Show Image:'),
						'name' => 'BLEOBLOGS_SIMA',
						'values' => array(
							array(
								'id' => 'active_on',
								'value' => 1,
								'label' => $this->l('Enabled')
							),
							array(
								'id' => 'active_off',
								'value' => 0,
								'label' => $this->l('Disabled')
							)
						),
					),
					array(
						'type' => 'switch',
						'label' => $this->l('Show Author:'),
						'name' => 'BLEOBLOGS_SAUT',
						'values' => array(
							array(
								'id' => 'active_on',
								'value' => 1,
								'label' => $this->l('Enabled')
							),
							array(
								'id' => 'active_off',
								'value' => 0,
								'label' => $this->l('Disabled')
							)
						),
					),
					array(
						'type' => 'switch',
						'label' => $this->l('Show Category:'),
						'name' => 'BLEOBLOGS_SCAT',
						'values' => array(
							array(
								'id' => 'active_on',
								'value' => 1,
								'label' => $this->l('Enabled')
							),
							array(
								'id' => 'active_off',
								'value' => 0,
								'label' => $this->l('Disabled')
							)
						),
					),
					array(
						'type' => 'switch',
						'label' => $this->l('Show Created Date:'),
						'name' => 'BLEOBLOGS_SCRE',
						'values' => array(
							array(
								'id' => 'active_on',
								'value' => 1,
								'label' => $this->l('Enabled')
							),
							array(
								'id' => 'active_off',
								'value' => 0,
								'label' => $this->l('Disabled')
							)
						),
					),
					array(
						'type' => 'switch',
						'label' => $this->l('Show Counter:'),
						'name' => 'BLEOBLOGS_SCOUN',
						'values' => array(
							array(
								'id' => 'active_on',
								'value' => 1,
								'label' => $this->l('Enabled')
							),
							array(
								'id' => 'active_off',
								'value' => 0,
								'label' => $this->l('Disabled')
							)
						),
					),
					array(
						'type' => 'switch',
						'label' => $this->l('Show Hits:'),
						'name' => 'BLEOBLOGS_SHITS',
						'values' => array(
							array(
								'id' => 'active_on',
								'value' => 1,
								'label' => $this->l('Enabled')
							),
							array(
								'id' => 'active_off',
								'value' => 0,
								'label' => $this->l('Disabled')
							)
						),
					),
					array(
						'type' => 'text',
						'label' => $this->l('Limit:'),
						'name' => 'BLEOBLOGS_NBR',
						'class' => 'fixed-width-xs',
						'desc' => $this->l('Define the number of blogs displayed in this block.')
					),
					array(
						'type' => 'select',
						'label' => $this->l('Carousel type'),
						'name' => 'carousel_type',
						'default' => LeoblogOwlCarousel::CAROUSEL_BOOTSTRAP,
						'class' => 'form-action',
						'options' => array(
							'query' => LeoblogOwlCarousel::getCaroulseOptions(),
							'id' => 'value',
							'name' => 'name'
						)
					),
					# config for Bootstrap Carousel - BEGIN
					array(
						'type' => 'text',
						'label' => $this->l('Items Per Page:'),
						'name' => 'BLEOBLOGS_PAGE',
						'class' => 'fixed-width-xs',
						'form_group_class' => 'carousel_type_sub carousel_type-' . LeoblogOwlCarousel::CAROUSEL_BOOTSTRAP,
						'desc' => $this->l('The maximum number of items displayed in this block.')
					),
					array(
						'type' => 'text',
						'label' => $this->l('Colums In Tab:'),
						'name' => 'BLEOBLOGS_COL',
						'class' => 'fixed-width-xs',
						'form_group_class' => 'carousel_type_sub carousel_type-' . LeoblogOwlCarousel::CAROUSEL_BOOTSTRAP,
						'desc' => $this->l('The maximum column items  in tab.')
					),
					array(
						'type' => 'text',
						'label' => $this->l('Intval:'),
						'name' => 'BLEOBLOGS_INTV',
						'form_group_class' => 'carousel_type_sub carousel_type-' . LeoblogOwlCarousel::CAROUSEL_BOOTSTRAP,
						'class' => 'fixed-width-xs',
					),
				),
				'submit' => array(
					'title' => $this->l('Save'),
					'class' => 'btn btn-default')
			),
		);



		// Add library owl carousel
		$owl_carousel = new LeoblogOwlCarousel();
		$arrays = $owl_carousel->getOwlCarouselAdminFormOptions();

		foreach ($arrays as $key => $array)
		{
			$fields_form['form']['input'][] = $array;
		}
		$this->fields_form = $fields_form;

		$helper = new HelperForm();
		$helper->show_toolbar = false;
		$helper->table = $this->table;
		$lang = new Language((int) Configuration::get('PS_LANG_DEFAULT'));
		$helper->default_form_language = $lang->id;
		$helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') ? Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') : 0;
		$helper->identifier = $this->identifier;
		$helper->submit_action = 'submitBlockLeoBlogs';
		$helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false) . '&configure=' . $this->name . '&tab_module=' . $this->tab . '&module_name=' . $this->name;
		$helper->token = Tools::getAdminTokenLite('AdminModules');
		$helper->tpl_vars = array(
			'fields_value' => $this->getConfigFieldsValues(),
			'languages' => $this->context->controller->getLanguages(),
			'id_language' => $this->context->language->id
		);

		return $helper->generateForm(array($this->fields_form));
	}

	public function getConfigFieldsValues()
	{
		$config = array(
			'BLEOBLOGS_NBR' => Tools::getValue('BLEOBLOGS_NBR', Configuration::get('BLEOBLOGS_NBR')),
			'BLEOBLOGS_WIDTH' => Tools::getValue('BLEOBLOGS_WIDTH', Configuration::get('BLEOBLOGS_WIDTH')),
			'BLEOBLOGS_HEIGHT' => Tools::getValue('BLEOBLOGS_HEIGHT', Configuration::get('BLEOBLOGS_HEIGHT')),
			'BLEOBLOGS_PAGE' => Tools::getValue('BLEOBLOGS_PAGE', Configuration::get('BLEOBLOGS_PAGE')),
			'BLEOBLOGS_COL' => Tools::getValue('BLEOBLOGS_COL', Configuration::get('BLEOBLOGS_COL')),
			'BLEOBLOGS_INTV' => Tools::getValue('BLEOBLOGS_INTV', Configuration::get('BLEOBLOGS_INTV')),
			'BLEOBLOGS_SHOW' => Tools::getValue('BLEOBLOGS_SHOW', Configuration::get('BLEOBLOGS_SHOW')),
			'BLEOBLOGS_SDES' => Tools::getValue('BLEOBLOGS_SDES', Configuration::get('BLEOBLOGS_SDES')),
			'BLEOBLOGS_SIMA' => Tools::getValue('BLEOBLOGS_SIMA', Configuration::get('BLEOBLOGS_SIMA')),
			'BLEOBLOGS_SAUT' => Tools::getValue('BLEOBLOGS_SAUT', Configuration::get('BLEOBLOGS_SAUT')),
			'BLEOBLOGS_SCAT' => Tools::getValue('BLEOBLOGS_SCAT', Configuration::get('BLEOBLOGS_SCAT')),
			'BLEOBLOGS_SCRE' => Tools::getValue('BLEOBLOGS_SCRE', Configuration::get('BLEOBLOGS_SCRE')),
			'BLEOBLOGS_SCOUN' => Tools::getValue('BLEOBLOGS_SCOUN', Configuration::get('BLEOBLOGS_SCOUN')),
			'BLEOBLOGS_SHITS' => Tools::getValue('BLEOBLOGS_SHITS', Configuration::get('BLEOBLOGS_SHITS')),
			'BLEOBLOGS_STITLE' => Tools::getValue('BLEOBLOGS_STITLE', Configuration::get('BLEOBLOGS_STITLE')),
		);

		$owl_config = BlockleoblogsModel::getParamOwlCarousel();
		$configs = array_merge($config, $owl_config);

		$obj = isset($configs) ? $configs : array();
		$fields_values = array();
		foreach ($this->fields_form['form']['input'] as $j => $input)
		{
			if (isset($input['lang'])) {
				foreach ($languages as $lang)
				{
					$fields_values[$input['name']][$lang['id_lang']] = isset($obj[$input['name'] . "_" . $lang['id_lang']]) ? $obj[$input['name'] . "_" . $lang['id_lang']] : $input['default'];
				}
			} else {
				if (isset($obj[trim($input['name'])])) {
					$value = $obj[trim($input['name'])];

					if ($input['name'] == 'image' && $value) {
						$thumb = __PS_BASE_URI__ . 'modules/' . $this->name . '/img/' . $value;
						$this->fields_form[$k]['form']['input'][$j]['thumb'] = $thumb;
					}
					$fields_values[$input['name']] = $value;
				} else {
					$v = Tools::getValue($input['name'], Configuration::get($input['name']));
					$fields_values[$input['name']] = $v ? $v : $input['default'];
				}
			}
		}

		return $fields_values;
	}

	/**
	 * If widget and blog load owl carousel twice -> error
	 * 
	 */
	public function loadOwlCarouselLib()
	{
		if (file_exists(_PS_MODULE_DIR_ . 'leomanagewidgets/assets/owl-carousel/owl.carousel.js')) {
			$this->context->controller->addJS($this->_path . '../assets/assets/owl-carousel/owl.carousel.js');
		} else {
			$this->context->controller->addJS($this->_path . 'assets/owl-carousel/owl.carousel.js');
		}
		if (file_exists(_PS_MODULE_DIR_ . 'leomanagewidgets/assets/owl-carousel/owl.carousel.css')) {
			$this->context->controller->addCSS($this->_path . '../assets/owl-carousel/owl.carousel.css');
		} else {
			$this->context->controller->addCSS($this->_path . 'assets/owl-carousel/owl.carousel.css', 'all');
		}
		if (file_exists(_PS_MODULE_DIR_ . 'leomanagewidgets/assets/owl-carousel/owl.theme.css')) {
			$this->context->controller->addCSS($this->_path . '../assets/owl-carousel/owl.theme.css');
		} else {
			$this->context->controller->addCSS($this->_path . 'assets/owl-carousel/owl.theme.css', 'all');
		}
//			$this->context->controller->addJS($this->_path . 'assets/owl-carousel/owl.carousel.js');
//			$this->context->controller->addCSS($this->_path . 'assets/owl-carousel/owl.carousel.css', 'all');
//			$this->context->controller->addCSS($this->_path . 'assets/owl-carousel/owl.theme.css', 'all');
	}

}
<?php 

	class LeobootstrapmenuWidgetModuleFrontController extends ModuleFrontController
	{
		public $php_self ;
		public function init() {
			parent::init();

			  require_once( $this->module->getLocalPath().'leomenusidebar.php' );
		}

		public function initContent()
		{
			$this->php_self = 'widget';
			parent::initContent();

	 			$module = new leomenusidebar();

				echo $module->renderwidget();
			  die;
	 
		}
	}
?>
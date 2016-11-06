<?php 

	class LeobootstrapmenuWidgetModuleFrontController extends ModuleFrontController
	{
		public $php_self ;
		public function init() {
			parent::init();

			  require_once( $this->module->getLocalPath().'leobootstrapmenu.php' );
		}

		public function initContent()
		{
			$this->php_self = 'widget';
			parent::initContent();

	 			$module = new leobootstrapmenu();

				echo $module->renderwidget();
			  die;
	 
		}
	}
?>
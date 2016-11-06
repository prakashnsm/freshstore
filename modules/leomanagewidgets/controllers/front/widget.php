<?php
/**
* Leo Prestashop Theme Framework for Prestashop 1.5.x
*
*  @package   leotempcp
*  @version   3.0
*  @author    http://www.leotheme.com
*  @copyright Copyright (C) October 2013 LeoThemes.com <@emai:leotheme@gmail.com>,<info@leotheme.com>.All rights reserved.
*  @license   GNU General Public License version 2
*/

	class leomanagewidgetswidgetModuleFrontController extends ModuleFrontController
	{
		public function init() {
			parent::init();

			  require_once( $this->module->getLocalPath().'leomanagewidgets/leotempcp.php' );
		}

		public function initContent()
		{
			parent::initContent();
	 		$module = new Leotempcp();
	 		echo $module->renderwidget();
			die;
		}
	}
?>
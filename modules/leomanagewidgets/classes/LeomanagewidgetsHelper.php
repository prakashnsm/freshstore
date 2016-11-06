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
if (!class_exists("LeomanagewidgetsHelper")) {

    class LeomanagewidgetsHelper
    {

        /**
         * Check file tpl for new library : Owl_carousel
         */
        public static function processWidgetType($hook_name, $key_widget, $type, $data)
        {
            if(!isset($data['carousel_type'])){
				return $type;	// version doesnt has owl carousel
			}
			
			if ($data['carousel_type'] == LeomanagewidgetsOwlCarousel::CAROUSEL_OWL) {
                // widget_carousel_owl.tpl
                $type .= '_owl';
            }
            
            return $type;
        }
        
        public static function enableLoadOwlCarouselLib($data){
            
            if(!isset($data['carousel_type'])){
				return false;	// version doesnt has owl carousel
			}
            
            if($data['carousel_type'] == LeomanagewidgetsOwlCarousel::CAROUSEL_OWL){
                return true;
            }
            return false;
        }
        
        

    }
}	

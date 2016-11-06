{**
 *  Leo Prestashop Theme Framework for Prestashop 1.5.x
 *
 * @package   leotempcp
 * @version   3.0
 * @author    http://www.leotheme.com
 * @copyright Copyright (C) October 2013 LeoThemes.com <@emai:leotheme@gmail.com>
 *               <info@leotheme.com>.All rights reserved.
 * @license   GNU General Public License version 2
 *
 **}


<div id="{$myTab}" class="block products_block">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<h4 class="widget-heading title_block">
		{$widget_heading}
	</h4>
	{/if}
	<div class="block_content">	
		{if $tabs}	
			<ul  class="nav nav-tabs">
				{foreach $tabs as $tab}
					<li><a href="#{$myTab}{$tab.id_tab}" data-toggle="tab">
						{if $tab.icon && $tab.icon != 'none'}
							<img alt="" src="{$path}{$tab.icon}" />{$tab.title}
						{else}
							{$tab.title}
						{/if}	
					</a></li>
				{/foreach}	
            </ul>
			<div id="product_tab_content"><div class="product_tab_content tab-content">
				{foreach $tabs as $tab}
					<div class="tab-pane" id="{$myTab}{$tab.id_tab}">
					{$products=$tab.products}{$tabname="{$myTab}-{$tab.id_tab}"}
					{include file='./products.tpl'}
	              </div>
				{/foreach}	
			</div></div>
		{/if}	
        
		
	</div>
</div>

<script>
$(document).ready(function() {
    $('#{$myTab} .carousel').each(function(){
        $(this).carousel({
            pause: 'hover',
            interval: {$interval}
        });
    });
 
	$("#{$myTab} .nav-tabs li", this).first().addClass("active");
	$("#{$myTab} .tab-content .tab-pane", this).first().addClass("active");
 
});
</script>
 
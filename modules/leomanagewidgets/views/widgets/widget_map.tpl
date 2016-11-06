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
 
<div id="google-maps" class="block">
{if isset($widget_heading)&&!empty($widget_heading)}
<h4 class="title_block">
	{$widget_heading}
</h4>
{/if}
{if $page_name !='stores' && $page_name !='sitemap'}
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=true&amp;amp;region={$iso_code}">var add_code_to_enable_cache_not_show_error_4435345345klcerkldfmkl=""</script>
<div id="map-canvas" style="width:{$width}; height:{$height};"></div>
<script type="text/javascript">
$(document).ready(function(){
{literal} 
	var latitude = {/literal}{$latitude}{literal};
	var longitude = {/literal}{$longitude}{literal};
	var zoom = {/literal}{$zoom}{literal}
	map = new google.maps.Map(document.getElementById('map-canvas'), {
		center: new google.maps.LatLng(latitude,longitude),
		zoom: zoom,
		mapTypeId: 'roadmap'
	});
	{/literal}{if isset($show_market) && $show_market == 1}{literal}
	var myLatlng = new google.maps.LatLng(latitude,longitude);
				var marker = new google.maps.Marker({
				            position: myLatlng,
      map: map,
				           });
	{/literal}{/if}{literal}
});
{/literal} 
</script>
			    {/if}

</div>

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
 
{if $slides}	
{assign var="t_image" value="image_`$iso_code`"}
{assign var="t_thumb" value="thum_`$iso_code`"}
{assign var="t_title" value="title_`$iso_code`"}
{assign var="t_description" value="description_`$iso_code`"}
<div class="container">
    <!-- main slider carousel -->
    <div class="row">
        <div class="col-md-12" id="slider">
                <div class="col-md-12" id="carousel-bounding-box">
                    <div id="myCarousel" class="carousel slide">
                        <!-- main slider carousel items -->
                        <div class="carousel-inner">
							{foreach $slides as $slide name=slides}
								<div class="item {if $smarty.foreach.slides.first}active{/if} " data-slide-number="{$smarty.foreach.slides.index}">
									{if  isset($slide[$t_image]) && $slide[$t_image]}
										<img src="{$pathimg}{$slide[$t_image]}" alt="" style="width:{$img_width}px;height:{$img_height}px" class="img-responsive">
									{/if}	
									  <div class="carousel-caption">
										{if  isset($slide[$t_title]) && $slide[$t_title]}<h3>{$slide[$t_title]}</h3>{/if}
										{if  isset($slide[$t_description]) && $slide[$t_description]}<p>{$slide[$t_description]}</p>{/if}		
									  </div>
								</div>
							{/foreach}
                        </div>
                        <!-- main slider carousel nav controls --> <a class="carousel-control left" href="#myCarousel" data-slide="prev">‹</a>

                        <a class="carousel-control right" href="#myCarousel" data-slide="next">›</a>
                    </div>
                </div>
        </div>
    </div>
    <!--/main slider carousel-->

   	<!-- thumb navigation carousel -->
    <div class="col-md-12 hidden-sm hidden-xs" id="slider-thumbs">
        <!-- thumb navigation carousel items -->
        <ul class="list-inline">
			{foreach $slides as $slide name=item}
				<li> <a id="carousel-selector-{$smarty.foreach.item.index}" {if $smarty.foreach.item.first}class="selected"{/if}>
					<img src="{$paththum}{$slide[$t_thumb]}" alt="" style="width:{$thumb_width}px;height:{$thumb_height}px" class="img-responsive"></a>
				</li>
			{/foreach}	
        </ul>
    </div>
</div>

{/if}  
<script type="text/javascript">
{literal}
$('#myCarousel').carousel({
    interval: {/literal}4000{literal}
});

// handles the carousel thumbnails
$('[id^=carousel-selector-]').click( function(){
  var id_selector = $(this).attr("id");
  var id = id_selector.substr(id_selector.length -1);
  id = parseInt(id);
  $('#myCarousel').carousel(id);
  $('[id^=carousel-selector-]').removeClass('selected');
  $(this).addClass('selected');
});

// when the carousel slides, auto update
$('#myCarousel').on('slid', function (e) {
  var id = $('.item.active').data('slide-number');
  id = parseInt(id);
  $('[id^=carousel-selector-]').removeClass('selected');
  $('[id^=carousel-selector-'+id+']').addClass('selected');
});
{/literal}
</script>
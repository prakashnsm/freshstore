{if $slides}	
{assign var="t_image" value="image_`$iso_code`"}
{assign var="t_thumb" value="thum_`$iso_code`"}
{assign var="t_title" value="title_`$iso_code`"}
{assign var="t_description" value="description_`$iso_code`"}
<div class="container">
    <!-- main slider carousel -->
    <div class="row">
        <div class="col-md-12">
		<div style="clear:both"></div>
		<div class="lof-fullslider-wrapper" style="height:{$moduleHeight}px;width:{$moduleWidth}px;">
			<div class="fullslider-hero-holder" style="height:{$thumbmainHeight}px;"></div>
			<div class="arrow-button">
				<a onclick="return false" id="btn_rt" class="lof-nextButton">{l s='Next' mod='loffullslider'}</a>
				<a onclick="return false" id="btn_lt" class="lof-prevButton">{l s='Prev' mod='loffullslider'}</a>
			</div>
			<div class="lof-carousel-holder">
				<div id="lof-fullslider-inner" class="lof-fullslider-inner">
					
					<ul>
						{foreach $slides as $slide name=item}  
							<li style="width:{$thumbmainWidth}px;height:{$thumbmainHeight}px;">
								{if  isset($slide[$t_image]) && $slide[$t_image]}
									<img src="{$pathimg}{$slide[$t_image]}" alt="" style="width:{$img_width}px;height:{$img_height}px" class="img-responsive">
								{/if}	
								<div>
									  <div class="carousel-caption">
										{if  isset($slide[$t_title]) && $slide[$t_title]}<h3>{$slide[$t_title]}</h3>{/if}
										{if  isset($slide[$t_description]) && $slide[$t_description]}<p>{$slide[$t_description]}</p>{/if}		
									  </div>
								</div>
							</li>
						{/foreach}
					</ul>
					
				</div>
			</div>
		</div>
		<div style="clear:both"></div>
		</div>
	</div>
</div>
<script type="text/javascript">
   jQuery(function(){
		jQuery('#lof-fullslider-inner').fullSliderCarousel({
		});
	});
</script>
{/if}  


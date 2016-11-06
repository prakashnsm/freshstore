{if isset($images)}
<div class="widget-images block">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<div class="widget-heading title_block">
		{$widget_heading}
	</div>
	{/if}
	<div class="widget-inner block_content clearfix">
		<div class="images-list clearfix">	
			<div class="row">
				{foreach from=$images item=image name=images}
				<div class="image-item col-md-{$columns} col-xs-12">
					<img class="replace-2x img-responsive" src="{$image}" alt=""/>
				</div>
				{/foreach}
			</div>
		</div>
	</div>
</div>
{/if} 
 {if isset($video_code)}
<div class="widget-video">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<div class="menu-title">
		{$widget_heading}
	</div>
	{/if}
	<div class="widget-inner">
		{$video_code}
	</div>
</div>
{/if}
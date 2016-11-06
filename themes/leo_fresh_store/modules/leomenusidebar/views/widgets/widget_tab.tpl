{if isset($tabs)}
<div class="widget-tab block">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<div class="widget-heading title_block">
		{$widget_heading}
	</div>
	{/if}
	<div class="widget-inner block_content">	
		<div id="tabs{$id}" class="panel-group">
			

			<ul class="nav nav-tabs">
			  {foreach $tabs as $key => $ac}  
			  <li class="{if $key==0}active{/if}"><a href="#tab{$id}{$key}" >{$ac.header}</a></li>
			  {/foreach}
			</ul>

			<div class="tab-content">
			 	{foreach $tabs as $key => $ac}
				  <div class="tab-pane{if $key==0} active{/if} " id="tab{$id}{$key}">{$ac.content}</div>
			 	{/foreach}
	 		</div>

	</div></div>
</div>
{/if}



{if $product}	
<span class="title_deal">{l s='Today Deal' mod='leocustomajax'}</span>
<ul class="deal-clock lof-clock-{$product.id_product}-detail list-inline">
	{if isset($product.js) && $product.js == 'unlimited'}{/if}
</ul>
{if isset($product.js) && $product.js != 'unlimited'}	
	<script type="text/javascript">
		{literal}
		jQuery(document).ready(function($){{/literal}
			var text_d = '{l s='D' mod='leocustomajax'}';
			var text_h = '{l s='H' mod='leocustomajax'}';
			var text_m = '{l s='M' mod='leocustomajax'}';
			var text_s = '{l s='S' mod='leocustomajax'}';
			$(".lof-clock-{$product.id_product}-detail").lofCountDown({literal}{{/literal}
				TargetDate:"{$product.js.month}/{$product.js.day}/{$product.js.year} {$product.js.hour}:{$product.js.minute}:{$product.js.seconds}",
				DisplayFormat:'<li>%%D%%<span>'+text_d+'</span></li><li>%%H%%<span>'+text_h+'</span></li><li>%%M%%<span>'+text_m+'</span></li><li>%%S%%<span>'+text_s+'</span></li>',
				FinishMessage: "{$product.finish}"
			{literal}
			});
		});
		{/literal}
	</script>
{/if}
{/if}
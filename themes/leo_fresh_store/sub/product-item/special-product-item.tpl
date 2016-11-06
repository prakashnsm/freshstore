	<div class="product-container" itemscope itemtype="http://schema.org/Product">		
		<div class="left-block">			
			<div class="product-image-container image">
				{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
					{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
						{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction}
							{if $product.specific_prices.reduction_type == 'percentage'}
								<span class="label-sale label label-danger">{l s='Save'}<br /><b>-{$product.specific_prices.reduction * 100} % </b></span>
							{/if}
						{/if}
					{/if}
				{/if}
				<a class="product_img_link"	href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
					<img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" itemprop="image" />
				</a>	
				
			</div>	
		</div>
		<div class="right-block">
			<div class="product-meta">
				<div class="leo-more-cdown" data-idproduct="{$product.id_product}"></div>	
				<h5 itemprop="name" class="name">
					{if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
					<a class="product-name" href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url" >
						{$product.name|truncate:45:'...'|escape:'html':'UTF-8'}
					</a>
				</h5>  	 
			</div>	
		</div>	
		
	</div><!-- .product-container> -->


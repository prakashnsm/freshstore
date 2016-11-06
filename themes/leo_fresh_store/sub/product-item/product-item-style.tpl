{*
	************************
		Creat by leo themes
	*************************
*}
{if !isset($callFromModule) || $callFromModule==0}
{include file="$tpl_dir./layout/setting.tpl"}
{/if}
<div class="product-container product-block-style" itemscope itemtype="http://schema.org/Product">
	<div class="left-block">
		<div class="product-image-container image">
		   <div class="leo-more-info" data-idproduct="{$product.id_product}"></div>
			<a class="product_img_link"	href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
				<img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" itemprop="image" />			</a>		
			{if isset($product.new) && $product.new == 1}				
				<span class="label-new label-info label">{l s='New'}</span>				
			{/if}
			{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
				<span class="label-sale label-warning label">{l s='Sale!'}</span>
			{/if}
		</div>
		{hook h="displayProductDeliveryTime" product=$product}
		{hook h="displayProductPriceBlock" product=$product type="weight"}

		<div class="functional-buttons clearfix">
			{if $page_name !='product'}	
				<div class="cart">
					{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
						{if (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > 0)}
							{if isset($static_token)}
								<a class="button ajax_add_to_cart_button btn" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}">
									<span>{l s='Add to cart'}</span>
								</a>
							{else}
								<a class="button ajax_add_to_cart_button btn" href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}">
									<span>{l s='Add to cart'}</span>
								</a>
							{/if}
						{else}
							<div class="btn btn-default disabled" title="{l s='Out of stock'}">
								<span>{l s='Out of stock'}</span>
							</div>
						{/if}
					{/if}
				</div>  
			{/if} 
		</div>	
	</div>
	<div class="right-block">
		<div class="product-meta">
			<h5 itemprop="name" class="name">
				{if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
				<a class="product-name" href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url" >
					{$product.name|truncate:45:'...'|escape:'html':'UTF-8'}
				</a>
			</h5> 
			{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
				<div itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="content_price">
					{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
						<meta itemprop="priceCurrency" content="{$currency->iso_code}" />
						{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
							{hook h="displayProductPriceBlock" product=$product type="old_price"}
							<span class="old-price product-price">
								{displayWtPrice p=$product.price_without_reduction}
							</span> 
						{/if}
						<span itemprop="price" class="price product-price">
							{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
						</span>
						{hook h="displayProductPriceBlock" product=$product type="price"}
						{hook h="displayProductPriceBlock" product=$product type="unit_price"}
					{/if}
				</div>
			{/if}
			{if !isset($moduleCalling) || $moduleCalling != "productcategory"}
			{hook h='displayProductListReviews' product=$product}
			{/if}  
		</div> <!-- end product meta -->
	</div>
	
</div>
<!-- .product-container> -->


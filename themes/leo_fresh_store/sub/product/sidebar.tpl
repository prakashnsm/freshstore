<ul class="products products-block">
    {foreach from=$products item=product name=myLoop}
        <li class="clearfix media">
            
            <div class="product-block">

            <div class="product-container media" itemscope itemtype="http://schema.org/Product">
                 <a class="products-block-image img " href="{$product.link|escape:'html'}" title="{$product.legend|escape:html:'UTF-8'}"><img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'small_default')|escape:'html'}" alt="{$product.name|escape:html:'UTF-8'}" />
                 </a>

                <div class="media-body">
                      <div class="product-content">
                        <h5 class="name media-heading">
                            <a class="product-name" href="{$product.link|escape:'html'}" title="{$product.name|escape:html:'UTF-8'}">
                            {$product.name|strip_tags|escape:html:'UTF-8'|truncate:25:'...'}</a>
                        </h5>
                        {if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
                            <div class="content_price price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                {if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
                                    {if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
                                        <span class="old-price product-price">
                                            {displayWtPrice p=$product.price_without_reduction}
                                        </span>
                                    {/if}
                                    <span itemprop="price" class="product-price">
                                        {if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
                                    </span>
                                    <meta itemprop="priceCurrency" content="{$priceDisplay}" />
                                {/if}
                            </div>
                        {/if}
						{hook h='displayProductListReviews' product=$product}
						{if $page_name !=''}	
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
                        
                        {*<p class="product-description description">{$product.description_short|strip_tags:'UTF-8'|truncate:75:'...'}</p>*}
                    </div>
                </div>
            </div>

              
            </div>    
        </li>
    {/foreach}
</ul>
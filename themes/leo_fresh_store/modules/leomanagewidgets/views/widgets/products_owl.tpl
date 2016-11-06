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

 
 {if !empty($products)}
		{$mproducts=array_chunk($products,$owl_rows)}
		{foreach from=$mproducts item=products name=mypLoop}
                    <div class="item">
					{foreach from=$products item=product name=products}
						<div class="ajax_block_product p-item">
							{include file="$tpl_dir./sub/product-item/product-item-owl.tpl"}
						</div>
					{/foreach}
                </div>
		{/foreach} 

{addJsDefL name=min_item}{l s='Please select at least one product' mod='leomanagewidgets' js=1}{/addJsDefL}
{addJsDefL name=max_item}{l s='You cannot add more than %d product(s) to the product comparison' mod='leomanagewidgets' sprintf=$comparator_max_item js=1}{/addJsDefL}
{addJsDef comparator_max_item=$comparator_max_item}
{addJsDef comparedProductsIds=$compared_products}
{/if}
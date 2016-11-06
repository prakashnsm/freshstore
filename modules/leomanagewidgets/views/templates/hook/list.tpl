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
 
<div class="panel">
	<h3>
		<i class="icon-list-ul"></i>
		{l s='Slides list' mod='leomanagewidgets'}
        <span class="panel-heading-action">
			<a id="desc-product-new" class="list-toolbar-btn" href="{$link->getAdminLink('AdminModules')}&configure=homeslider&addSlide=1">
				<label>
					<span title="" data-toggle="tooltip" class="label-tooltip" data-original-title="Add new" data-html="true">
						<i class="process-icon-new "></i>
					</span>
				</label>
			</a>
		</span>
    </h3>
    <div id="slidesContent" style="width: 400px; margin-top: 30px;">
        <ul id="slides">
            {foreach from=$slides item=slide}
                <li id="slides_{$slide.id_slide}">
                    <strong>#{$slide.id_slide}</strong>
					{$slide.title}
                    <p style="float: right">
                        {$slide.status}
                        <a class="btn btn-primary" href="{$link->getAdminLink('AdminModules')}&configure=homeslider&id_slide={$slide.id_slide}">
							{l s='Edit' mod='leomanagewidgets'}
						</a>
                        <a class="btn btn-danger" href="{$link->getAdminLink('AdminModules')}&configure=homeslider&delete_id_slide={$slide.id_slide}">
							{l s='Delete' mod='leomanagewidgets'}
						</a>
                    </p>
                </li>
            {/foreach}
        </ul>
    </div>
</div>
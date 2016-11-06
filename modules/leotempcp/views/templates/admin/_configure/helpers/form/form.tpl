{*
* 2007-2013 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2013 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{extends file="helpers/form/form.tpl"}
{block name="field"}
        {if $input.type == 'setting_list'}
            <ol class="breadcrumb leo-redirect">
                <li class="active">{l s='Setting List'}</li>
                <li><a href="#" data-element="fieldset_0">{l s='GENERAL SETTING'}</a></li>
                <li><a href="#" data-element="fieldset_1_1">{l s='PAGES SETTING'}</a></li>
                <li><a href="#" data-element="fieldset_2_2">{l s='CUSTOMIZATION SETTING'}</a></li>
                <li><a href="#" data-element="fieldset_3_3">{l s='FONT SETTING'}</a></li>
                <li><a href="#" data-element="fieldset_4_4">{l s='DATA SAMPLE'}</a></li>
            </ol>
        {/if}

        {if $input.type == 'img_cat'}
                {assign var=tree value=$input.tree}
  				{assign var=imageList value=$input.imageList}
  				{assign var=selected_images value=$input.selected_images}
                <div class="form-group form-select-icon">
                                <label class="control-label col-lg-3 " for="categories"> {l s='Categories'} </label>
                                <div class="col-lg-9">
                                {$tree}
                                </div>
                                <input type="hidden" name="category_img" id="category_img" value='{$selected_images}'/>
                                <div id="list_image_wrapper" style="display:none">
                                    <div class="list-image btn-group">
                                        <button style="background-color:#00aff0; padding:0 8px;" type="button" class="btn dropdown-toggle" data-toggle="dropdown" value="imageicon">icons
                                          <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" role="menu">
                                        	<li><a href="#">none</a></li>
                                        	{foreach from=$imageList item=image}
                        					<li><a href="#"><img height = '10px' src='{$image["path"]}'> {$image["name"]}</a></li>
                   							 {/foreach}
                                        </ul>
                                      </div>
                                </div>
                </div>
        {/if}
		
		{if $input.type == 'slide'}
			<style type="text/css">
				#list-imgs li {
				border: 1px solid #ddd;
				float: left;
				font-size: 12px;
				height: 115px;
				line-height: 1.4;
				margin: 0 -1px -1px 0;
				padding: 10px 5px;
				text-align: center;
				width: 20%;
				list-style: none outside none;
			}
			</style>
			<script type="text/javascript">
			{literal}
			jQuery(document).ready(function(){
				$(".addslide").click( function(){
					var html = getSlide();
					$("#contentSlides").append(html);
					deleteSlide();
				});
				
                                $(".choose-img").click(function(e){
                                    chooseIMG = $(this);
                                    e.preventDefault();
                                    $.fancybox.open([
                                            {
                                                type: 'iframe', 
                                                href : $(this).attr("href"),
                                                afterLoad:function(){
                                                    hideSomeElement(chooseIMG);
                                                    //$('.fancybox-iframe').load( $this.hideSomeElement );
                                                },
                                                afterClose: function (event, ui) {
                                                    //location.reload();
                                                    //refressImage();
                                                }
                                            }
                                        ], {
                                            padding: 10
                                        });

                                });
                                var hideSomeElement = function(chooseIMG){
                                    
                                    $('.select-img', $('.fancybox-iframe').contents()).click(function(){
                                        if($(chooseIMG).data('type') == 'main'){
                                            selectImage('image', $(this).data('name') , '#main_image', $(this).attr('src'));
                                        }else{
                                            selectImage('thum', $(this).data('name') , '#main_thum', $(this).attr('src'));
                                        }
                                        $.fancybox.close();
                                    });
                                    $('body',$('.fancybox-iframe').contents()).find("#header").hide();
                                    $('body',$('.fancybox-iframe').contents()).find("#footer").hide();
                                    $('body',$('.fancybox-iframe').contents()).find(".page-head, #nav-sidebar ").hide();
                                    //$('body',$('.fancybox-iframe').contents()).find("#content.bootstrap").css( 'padding',0).css('margin',0);
                                };
				{/literal}{if $slide_edit && $slide_edit.id_slide}{literal}
				$(".updateslide").click( function(){
					var id_slide = {/literal}{$slide_edit.id_slide}{literal};
					var html = getSlide(true);
					$("#contentSlides_"+id_slide).html(html);
					deleteSlide();
				});	
				{/literal}{/if}{literal}
				
				$(function() {
				var $myTabs = $("#contentSlides");
				$myTabs.sortable({
					opacity: 0.6,
					cursor: "move"
				});
				$myTabs.hover(function() {
					$(this).css("cursor","move");
					},
					function() {
					$(this).css("cursor","auto");   
					});
				});
				deleteSlide();
			});	
			function selectImage(name,url,id,path){
					if(url != ''){
						var iso_code = '';
						$.each(languages, function(key, language) {
							if(language['id_lang'] == id_language)
								iso_code = language['iso_code'];
						});
						
						var html = 	"<img class='select-img' height='100px' src='"+path+"' data-image='"+url+"' title=''>";
							html += "<input type='hidden' name='"+name+'_'+iso_code+"' value='"+url+"'>";
						$(id+'_'+iso_code).html(html);
					}
					return false;
			}
				
			function getSlide(edit)
			 {
				var result = new Array();
				var string_tab = new Array();
				$(".leo-slide").each(function(x) {
					var res = $(this).attr("id");
					if(res)
						result[x] =  res.replace("contentSlides_",""); 
				});
				var max = Math.max.apply(Math, result);
				if(max != '-Infinity')
					maxid = max+1;
				else
					maxid = 1;	
				$.each(languages, function(key, language) {
						if(language['id_lang'] == id_language)
							iso_code = language['iso_code'];
				});	
				var this_title 	= 	$("#title_"+iso_code).val();
                                var this_link 	= 	$("#link_"+iso_code).val();
				var lang_des 	= 	$("#description_"+iso_code).val();
				var this_image 	= 	$("#main_image_"+iso_code+" img").data("image");
				var this_thum 	= 	$("#main_thum_"+iso_code+" img").data("image");
				var myObject = {
					"id_slide": 	maxid,		
				};
                                $(".slide_link").each(
					function(){
						var iso_code =  $(this).attr("id").replace("link_","");
						myObject["link_"+iso_code] = $(this).val();
					}
				);
				$(".slide_title").each(
					function(){
						var iso_code =  $(this).attr("id").replace("title_","");
						myObject["title_"+iso_code] = $(this).val();
					}
				);
				$(".slide_description").each(
					function(){
						var iso_code =  $(this).attr("id").replace("description_","");
						myObject["description_"+iso_code] = $(this).val();
					}
				);
				$(".main_image img").each(
					function(){
						var iso_code =  $(this).parent().attr("id").replace("main_image_","");
						myObject["image_"+iso_code] = $(this).data("image");
					}
				);
				$(".main_thum img").each(
					function(){
						var iso_code =  $(this).parent().attr("id").replace("main_thum_","");
						myObject["thum_"+iso_code] = $(this).data("image");
					}
				);
                                
				slides = JSON.stringify(myObject);
				var imgUrl = '{/literal}{$pathimg}{literal}';
				var thumUrl ='{/literal}{$paththum}{literal}';
				if(this_image && this_image != 'none')
					var src_img = "<img class='"+this_image+"' src="+imgUrl+this_image+" style='height:50px;width:100px;'/>";
				else
					var src_img = '';
				if(this_thum && this_thum != 'none')
					var src_thum = "<img class='"+this_thum+"' src="+thumUrl+this_thum+" style='height:25px;width:25px;'/>";
				else
					var src_thum = '';	
				if(edit){
					{/literal}{if $slide_edit && $slide_edit.id_slide}{literal}
					var html = "<div class='col-lg-1'>"+{/literal}{$slide_edit.id_slide}{literal}+"</div><div  class='col-lg-2'>"+this_title+"</div><div class='col-lg-5'>"+src_img+"</div><div class='col-lg-2'>"+src_thum+"</div><div class='col-lg-2'><div class='btn-group-action pull-right'><p><input id="+{/literal}{$slide_edit.id_slide}{literal}+" class='btn-delete btn btn-danger' type='button'  value='Delete'></p></div></div><input id='leoslide_"+{/literal}{$slide_edit.id_slide}{literal}+"' name='leoslide[]' value='"+slides+"' type='hidden'/>";
					{/literal}{/if}{literal}
				}
				else{
					var html = "<div class='leo-slide col-lg-12' id='contentSlides_"+maxid+"' style='border: 1px solid #ccc;margin-top: 5px;padding: 5px;'><div  class='col-lg-1'>"+maxid+"</div><div class='col-lg-2'>"+this_title+"</div><div  class='col-lg-5'>"+src_img+"</div><div  class='col-lg-2'>"+src_thum+"</div><div class='col-lg-2'><div class='btn-group-action pull-right'><p><input id="+maxid+" class='btn-delete btn btn-danger' type='button'  value='Delete'></p></div></div><input id='leoslide_"+maxid+"' name='leoslide[]' value='"+slides+"' type='hidden'/></div>";
				}
				return html;
			 }	
			 
			function deleteSlide()
			{
				$(".btn-delete").click( function(){
					$(this).closest(".col-lg-12").remove();
				});
			}
			{/literal}	
			</script>
			<hr>
		<div class="form-group">
			<label class="control-label col-lg-3 " for="title"> {l s='Title'} </label>
			<div class="col-lg-9">
				{foreach from=$languages item=language}
				{assign var="t_title" value="title_`$language['iso_code']`"}
					{if $languages|count > 1}
					<div class="row">
						<div class="translatable-field lang-{$language.id_lang}" {if $language.id_lang != $id_lang_default}style="display:none"{/if}>
							<div class="col-lg-9"> 
					{/if}
						<input class="slide_title" id="title_{$language.iso_code}" type="text"  name="title_{$language.id_lang|intval}" value="{if  $slide_edit && $slide_edit[$t_title]}{$slide_edit[$t_title]}{/if}">
					{if $languages|count > 1}
							</div>
							<div class="col-lg-2">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									{$language.iso_code} 
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									{foreach from=$languages item=language}
									<li><a href="javascript:hideOtherLanguage({$language.id_lang});" tabindex="-1">{$language.name}</a></li>
									{/foreach}
								</ul>
							</div>		
						</div>
					</div>
					{/if}
				{/foreach}
		</div>
	</div>
        <div class="form-group">
			<label class="control-label col-lg-3 " for="link"> {l s='Link'} </label>
			<div class="col-lg-9">
				{foreach from=$languages item=language}
				{assign var="t_link" value="link_`$language['iso_code']`"}
					{if $languages|count > 1}
					<div class="row">
						<div class="translatable-field lang-{$language.id_lang}" {if $language.id_lang != $id_lang_default}style="display:none"{/if}>
							<div class="col-lg-9"> 
					{/if}
						<input class="slide_link" id="link_{$language.iso_code}" type="text"  name="link_{$language.id_lang|intval}" value="{if  $slide_edit && $slide_edit[$t_link]}{$slide_edit[$t_link]}{/if}">
					{if $languages|count > 1}
							</div>
							<div class="col-lg-2">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									{$language.iso_code} 
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									{foreach from=$languages item=language}
									<li><a href="javascript:hideOtherLanguage({$language.id_lang});" tabindex="-1">{$language.name}</a></li>
									{/foreach}
								</ul>
							</div>		
						</div>
					</div>
					{/if}
				{/foreach}
		</div>
	</div>
	<div class="form-group">
				<label class="control-label col-lg-3 " for="description"> {l s='Description'} </label>
				<div class="col-lg-9">
					{foreach from=$languages item=language}
					{assign var="t_description" value="description_`$language['iso_code']`"}
						{if $languages|count > 1}
						<div class="row">
							<div class="translatable-field lang-{$language.id_lang}" {if $language.id_lang != $id_lang_default}style="display:none"{/if}>
								<div class="col-lg-9">
									{/if}
										<textarea id="description_{$language['iso_code']}" class="slide_description textarea-autosize" rows="10" cols="40" style="overflow: hidden; word-wrap: break-word; resize: none; height: 199px;" id="description_{$language.iso_code}" name="description_{$language.iso_code}">{if  $slide_edit && $slide_edit[$t_description]}{$slide_edit[$t_description]}{/if}</textarea>
									{if $languages|count > 1}	
								</div>
								<div class="col-lg-2">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
										{$language.iso_code} 
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										{foreach from=$languages item=language}
										<li><a href="javascript:hideOtherLanguage({$language.id_lang});" tabindex="-1">{$language.name}</a></li>
										{/foreach}
									</ul>
								</div>		
							</div>
						</div>
						{/if}
					{/foreach}
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-lg-3 " for="title"> {l s='Image'} </label>
				<div class="col-lg-9">
						{foreach from=$languages item=language}
						{assign var="t_image" value="image_`$language['iso_code']`"}
							{if $languages|count > 1}
							<div class="row">
								<div class="translatable-field lang-{$language.id_lang}" {if $language.id_lang != $id_lang_default}style="display:none"{/if}>
									<div class="col-lg-9"> 
							{/if}
								<div class="main_image" id="main_image_{$language.iso_code}" type="text">
									{if  $slide_edit && isset($slide_edit[$t_image]) && $slide_edit[$t_image]}
										<img class="select-img" height="100px" src="{$pathimg}{$slide_edit[$t_image]}" data-image="{$slide_edit[$t_image]}" title="">
										<input type='hidden' name="image_{$iso_code}" value="{$slide_edit[$t_image]}">
									{/if}	
								</div>
							{if $languages|count > 1}
									</div>
									<div class="col-lg-2">
										<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
											{$language.iso_code} 
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											{foreach from=$languages item=language}
											<li><a href="javascript:hideOtherLanguage({$language.id_lang});" tabindex="-1">{$language.name}</a></li>
											{/foreach}
										</ul>
									</div>		
								</div>
							</div>
							{/if}
						{/foreach}
					<a href='{$input.selectImg}&imgDir=slideImg' data-type='main' class='choose-img'>
						{l s='Choose Image'}
					</a>	
				</div>
			</div>	
			<div class="form-group">
				<label class="control-label col-lg-3 " for="title"> {l s='Thumb'} </label>
				<div class="col-lg-9">
						{foreach from=$languages item=language}
						{assign var="t_thum" value="thum_`$language['iso_code']`"}
							{if $languages|count > 1}
							<div class="row">
								<div class="translatable-field lang-{$language.id_lang}" {if $language.id_lang != $id_lang_default}style="display:none"{/if}>
									<div class="col-lg-9"> 
							{/if}
								<div class="main_thum" id="main_thum_{$language.iso_code}" type="text">
									{if  $slide_edit && isset($slide_edit[$t_thum]) && $slide_edit[$t_thum]}
										<img class="select-img" height="100px" src="{$paththum}{$slide_edit[$t_thum]}" data-image="{$slide_edit[$t_thum]}" title="">
										<input type='hidden' name="image_{$iso_code}" value="{$slide_edit[$t_thum]}">
									{/if}	
								</div>
							{if $languages|count > 1}
									</div>
									<div class="col-lg-2">
										<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
											{$language.iso_code} 
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											{foreach from=$languages item=language}
											<li><a href="javascript:hideOtherLanguage({$language.id_lang});" tabindex="-1">{$language.name}</a></li>
											{/foreach}
										</ul>
									</div>		
								</div>
							</div>
							{/if}
						{/foreach}
                                                <a href='{$input.selectImg}&imgDir=slideThumb' data-type='thumb' class='choose-img'>
                                                        {l s='Choose Thumbnail'}
                                                </a>
				</div>
			</div>	
			<div class="form-group">
				<div  class="col-lg-9 col-lg-offset-3">
						<button class="btn btn-default addslide" name="addslide" type="button">
							<i class="icon-plus-sign-alt"></i>
							{l s='Add' mod='leotempcp'}
						</button>
						<input class="btn-update btn btn-info updateslide" type="button" name="updateslide" value="{l s='Update' mod='leotempcp'}">
				</div>	
			</div>	
			<hr>
			<div class="form-group">
				<div class="col-lg-offset-3 contentSlides" id="contentSlides">
					{if isset($items) && $items}	
					 {foreach from=$items item=item}
						{assign var="t_title" value="title_`$iso_code`"}
						{assign var="t_description" value="description_`$iso_code`"}
						{assign var="t_image" value="image_`$iso_code`"}
						{assign var="t_thum" value="thum_`$iso_code`"}
						<div id="contentSlides_{$item.id_slide}" class="leo-slide col-lg-12" style="border: 1px solid #ccc;margin-top: 5px;padding: 5px;">
							<div class="col-lg-1">{$item.id_slide}</div>
							<div class="col-lg-2">{if  isset($item[$t_title]) && $item[$t_title]}{$item[$t_title]}{/if}</div>
							<div class="col-lg-5">{if  isset($item[$t_image]) && $item[$t_image]}<img  src="{$pathimg}{$item[$t_image]}" style="width:100px;height:50px" class="{$item[$t_image]}">{/if}</div>
							<div class="col-lg-2">{if  isset($item[$t_thum]) && $item[$t_thum]}<img  src="{$paththum}{$item[$t_thum]}" style="width:25px;height:25px" class="{$item[$t_thum]}">{/if}</div>
							<div class="col-lg-2">
								<div class="btn-group-action pull-right">
								<p>
									<a class="btn-edit btn btn-info" href="{$url}&id_slide={$item.id_slide}" {if $slide_edit && $slide_edit.id_slide && $slide_edit.id_slide == $item.id_slide}style="display:none"{/if}/>{l s='Edit' mod='leotempcp'}</a>
									<input class="btn-delete btn btn-danger" type="button" id="{$item.id_slide}" value="{l s='Delete' mod='leotempcp'}">
								</p>
								</div>
							</div>
							<input id="Tabs_{$item.id_slide}" name="leoslide[]" value='{$item.slide}' type="hidden"/>
						</div>
					 {/foreach}
					{/if}				
				</div>
			</div>		
		{/if}			
		
		{if $input.type == 'setting_tab'}
			{assign var=tree value=$input.tree}	
			<script type="text/javascript">
			{literal}	
				jQuery(document).ready(function(){
				$(".addtabs").click( function(){
					var html = getTabs();
					$("#contentTabs").append(html);
					deleteTabs();
				});
				{/literal}{if $tab_edit && $tab_edit.id_tab}{literal}
				$(".updatetabs").click( function(){
					var id_tab = {/literal}{$tab_edit.id_tab}{literal};
					var html = getTabs(true);
					$("#contentTabs_"+id_tab).html(html);
					deleteTabs();
				});	
				{/literal}{/if}{literal}
				deleteTabs();
				$(function() {
				var $myTabs = $("#contentTabs");
				$myTabs.sortable({
					opacity: 0.6,
					cursor: "move"
				});
				$myTabs.hover(function() {
					$(this).css("cursor","move");
					},
					function() {
					$(this).css("cursor","auto");
					});
				});
				
			var bgCatUrl = "{/literal}{$path}{literal}";

			function deleteTabs()
			{
				$(".btn-delete").click( function(){
					$(this).closest(".col-lg-9").remove();
				});
			}
			
			function getTabs(edit)
			 {
				var result = new Array();
				var string_tab = new Array();
				$(".leo-tab").each(function(x) {
					var res = $(this).attr("id");
					if(res)
						result[x] =  res.replace("contentTabs_",""); 
				});
				var max = Math.max.apply(Math, result);
				if(max != '-Infinity')
					maxid = max+1;
				else
					maxid = 1;	
				var this_lang = "tabtitle_{/literal}{$iso_code}{literal}";
				var this_title = $("#"+this_lang).val();
				var type = $( "select#tabtype option:selected" ).val();
				var icon = $( "select#icon option:selected" ).val();
				var categories = new Array();
				$('.tree input:checked').each(function(y){        
					var values = $(this).val();
					categories[y] = values;
				});
				var myObject = {
					"id_tab": 	maxid,	
					"type": 	type,
					"icon": 	icon,	
					"categories": categories		
				};
				$(".tabtitle").each(
					function(){
						var iso_code =  $(this).attr("id").replace("tabtitle_","");
						myObject["title_"+iso_code] = $(this).val();
					}
				);
				mytab = JSON.stringify(myObject);
				if(icon && icon != 'none')
					var src_img = "<img class='"+icon+"' src="+bgCatUrl+icon+" style='width:30px;'/>";
				else
					var src_img = '';
				if(edit){
					{/literal}{if $tab_edit && $tab_edit.id_tab}{literal}
					var html = "<div class='col-lg-1'>"+{/literal}{$tab_edit.id_tab}{literal}+"</div><div  class='col-lg-2'>"+this_title+"</div><div class='col-lg-3'>"+type+"</div><div class='col-lg-3'>"+categories+"</div><div  class='col-lg-1'>"+src_img+"</div><div class='col-lg-2'><div class='btn-group-action pull-right'><p><input id="+{/literal}{$tab_edit.id_tab}{literal}+" class='btn-delete btn btn-danger' type='button'  value='Delete'></p></div></div><input id='Tabs_"+{/literal}{$tab_edit.id_tab}{literal}+"' name='leotab[]' value='"+mytab+"' type='hidden'/>";
					{/literal}{/if}{literal}
				}
				else{
					var html = "<div class='leo-tab col-lg-9' id='contentTabs_"+maxid+"' style='border: 1px solid #ccc;margin-top: 5px;padding: 5px;'><div  class='col-lg-1'>"+maxid+"</div><div class='col-lg-2'>"+this_title+"</div><div  class='col-lg-3'>"+type+"</div><div class='col-lg-3'>"+categories+"</div><div  class='col-lg-1'>"+src_img+"</div><div class='col-lg-2'><div class='btn-group-action pull-right'><p><input id="+maxid+" class='btn-delete btn btn-danger' type='button'  value='Delete'></p></div></div><input id='Tabs_"+maxid+"' name='leotab[]' value='"+mytab+"' type='hidden'/></div>";
				}
				return html;
			 }
			});
			{/literal}
			</script>
			<hr>	
					<div class="form-group">
									<label class="control-label col-lg-3 " for="tabtitle"> {l s='Title'} </label>
									<div class="col-lg-9">
										{foreach from=$languages item=language}
										{assign var="t_title" value="title_`$language['iso_code']`"}
											{if $languages|count > 1}
											<div class="row">
												<div class="translatable-field lang-{$language.id_lang}" {if $language.id_lang != $id_lang_default}style="display:none"{/if}>
													<div class="col-lg-9"> 
											{/if}
												<input class="tabtitle" id="tabtitle_{$language.iso_code}" type="text"  name="tabtitle_{$language.id_lang|intval}" value="{if  $tab_edit && $tab_edit[$t_title]}{$tab_edit[$t_title]}{/if}">
											{if $languages|count > 1}
													</div>
													<div class="col-lg-2">
														<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
															{$language.iso_code} 
															<span class="caret"></span>
														</button>
														<ul class="dropdown-menu">
															{foreach from=$languages item=language}
															<li><a href="javascript:hideOtherLanguage({$language.id_lang});" tabindex="-1">{$language.name}</a></li>
															{/foreach}
														</ul>
													</div>		
												</div>
											</div>
											{/if}
										{/foreach}
									</div>
							</div>
							<div class="form-group">
									<label class="control-label col-lg-3 " for="categories"> {l s='Categories'} </label>
									<div class="col-lg-9">
									{$tree}
									</div>
							</div>

							<div class="form-group">
									<label class="control-label col-lg-3 " for="tabtype"> {l s='Type'} </label>
									<div class="col-lg-9">
										<div class="col-lg-9 ">
											<select id="tabtype" class=" fixed-width-xl" name="tabtype">
												<option value="all">{l s='--All--'}</option>
												<option value="special" {if  $tab_edit && $tab_edit.type == 'special'} selected="selected" {/if} >{l s='Special '}</option>
												<option value="bestseller" {if  $tab_edit && $tab_edit.type == 'bestseller'} selected="selected" {/if}>{l s='BestSeller '}</option>
												<option value="featured" {if  $tab_edit && $tab_edit.type == 'featured'} selected="selected" {/if}>{l s='Featured '}</option>
												<option value="new" {if  $tab_edit && $tab_edit.type == 'new'}	selected="selected" {/if}>{l s='New Arrials  '}</option>
											</select>
										</div>	
									</div>
							</div>
							<div class="form-group">
									<label class="control-label col-lg-3 " for="icon"> {l s='Icon'} </label>
									<div class="col-lg-9">
										<div class="col-lg-9 ">
											<select id="icon" class=" fixed-width-xl" name="icon">
												<option value="none">{l s='--None--'}</option>
												{if $images}
													{foreach from=$images item=image}
													<option value="{$image}" {if  $tab_edit && $tab_edit.icon == $image} selected="selected" {/if}>{$image}</option>
													{/foreach}
												{/if}
											</select>
										</div>	
									</div>
							</div>
					<div class="form-group">
						<div  class="col-lg-9 col-lg-offset-3">
							<button class="btn btn-default addtabs" name="addtabs" type="button">
								<i class="icon-plus-sign-alt"></i>
								{l s='Add' mod='leotempcp'}
							</button>
							<input class="btn-update btn btn-info updatetabs" type="button" name="updatetabs" value="{l s='Update' mod='leotempcp'}">
						</div>	
					</div>	
					<div class="form-group">
						<div class="col-lg-offset-3">
							<div  class="col-lg-9">
								<div class="col-lg-1">{l s='Id'}</div>
								<div class="col-lg-2">{l s='Title'}</div>
								<div class="col-lg-3">{l s='Type'}</div>
								<div class="col-lg-3" >{l s='Categories'}</div>
								<div class="col-lg-1" >{l s='Icon'}</div>
								<div class="col-lg-2 " style="text-align:right;">{l s='Action'}</div>
							</div>
						</div>	
					</div>
					<div class="form-group">
							<div class="col-lg-offset-3 contentTabs" id="contentTabs">
							{if isset($items) && $items}	
							 {foreach from=$items item=item}
								<div id="contentTabs_{$item.id_tab}" class="leo-tab col-lg-9" style="border: 1px solid #ccc;margin-top: 5px;padding: 5px;">
									<div class="col-lg-1">{$item.id_tab}</div>
									<div class="col-lg-2">{if  isset($item[$text_title]) && $item[$text_title]}{$item[$text_title]}{/if}</div>
									<div class="col-lg-3">{if $item.type}{$item.type}{/if}</div>
									<div class="col-lg-3">{', '|implode:$item.categories}</div>
									<div class="col-lg-1">
										{if $item.icon && $item.icon != 'none'}<img  src="{$path}{$item.icon}" style="width:30px;" class="{$item.icon}">{/if}
									</div>
									<div class="col-lg-2">
										<div class="btn-group-action pull-right">
										<p>
												<a class="btn-edit btn btn-info" href="{$url}&id_tab={$item.id_tab}" {if $tab_edit && $tab_edit.id_tab && $tab_edit.id_tab == $item.id_tab}style="display:none"{/if}/>{l s='Edit' mod='leotempcp'}</a>
											<input class="btn-delete btn btn-danger" type="button" id="{$item.id_tab}" value="{l s='Delete' mod='leotempcp'}">
										</p>
										</div>
									</div>
									<input id="Tabs_{$item.id_tab}" name="leotab[]" value='{$item.tab}' type="hidden"/>
								</div>
							 {/foreach}
							{/if}
							</div>
					</div>	
        {/if}
	{if $input.type == 'modules_block'}
            {assign var=moduleList value=$input.values}
            <div class="col-lg-9 ">
            {if isset($moduleList) && count($moduleList) > 0}
                <p class="help-block">{l s='You can select one or more Module.' mod='leotempcp'}</p>
                <table cellspacing="0" cellpadding="0" class="table" style="min-width:40em;">
                    <tr>
                        <th>
                            <input type="checkbox" name="checkme" id="checkme" class="noborder" onclick="checkDelBoxes(this.form, '{$input.name}[]', this.checked)" />
                        </th>
                        <th>{l s='Name' mod='leotempcp'}</th>
                        <th>{l s='Back-up File' mod='leotempcp'}</th>
                    </tr>

                    {foreach from=$moduleList item=module name=moduleItem}
                        <tr {if $smarty.foreach.moduleItem.index % 2}class="alt_row"{/if}>
                            <td> 
                                <input type="checkbox" class="cmsBox" name="{$input.name}[]" id="chk_{$module.name}" value="{$module.name}"/>
                            </td>
                            <td><label for="chk_{$module.name}" class="t"><strong>{$module.name}</strong></label></td>
                            <td>
                                {if isset($module.files)}
                                <select name="file_{$module.name}">
                                {foreach from=$module.files item=file name=Modulefile}
                                    <option value="{$file}">{$file}</option>
                                {/foreach}
                                </select>
                                {/if}
                            </td>
                        </tr>
                    {/foreach}

                </table>
            {/if}
            </div>
            <div class="form-group button-wrapper">
                    <div class="col-lg-9 col-lg-offset-3">
                        <button class="button btn btn-success" name="submitBackup" id="module_form_submit_btn" type="submit">
                                 {l s="Back-up" mod='leotempcp'}
                        </button>
                        <button class="button btn btn-danger" name="submitRestore" data-confirm="{l s='Are you sure you want to restore back-up file?' mod='leotempcp'}" id="module_form_submit_btn" type="submit">
                                 {l s="Restore Back-up File" mod='leotempcp'}
                        </button>
                        
                        <button class="button btn btn-success" name="submitSample" id="module_form_submit_btn" type="submit">
                                 {l s="Export Sample Data" mod='leotempcp'}
                        </button>
                        <button class="button btn btn-danger" name="submitImport" data-confirm="{l s='Are you sure you want to restore data sample of template. You will lost all data of module' mod='leotempcp'}" id="module_form_submit_btn" type="submit">
                                 {l s="Restore Sample Data" mod='leotempcp'}
                        </button>
                        <p class="help-block">{l s='Data Sample is only for theme developer' mod='leotempcp'}</p>
                    </div>
            </div>
            <div class="form-group">
                <div class="col-lg-9 col-lg-offset-3">
                    <div class="alert alert-info">
                        {l s='With restore function, you will lost all data of module in site for all shop' mod='leotempcp'}
                        <hr>
                        {l s='You should back-up before do any thing' mod='leotempcp'}
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-9 col-lg-offset-3">
                    <button class="button btn btn-success" name="submitExportDBStruct" id="module_form_submit_btn" type="submit">
                            {l s="Export Data Struct" mod='leotempcp'}
                    </button>
                    <p class="help-block">{l s='You can download file in modules/leotemcp/install. This function is only for theme developer' mod='leotempcp'}</p>
                </div>
            </div>
            <script type="text/javascript">
                $(".button-wrapper .button").click(function(){
                    hasCheckedE = 0;
                    $("[name='moduleList[]']").each(function(){
                        if($(this).is(":checked")){
                            hasCheckedE = 1;
                            return false;
                        }
                    });
                    if(!hasCheckedE){
                        alert("You have to select atleast one module");
                        return false;
                    }
                    dataConfirm = $(this).attr("data-confirm");
                    if(dataConfirm){
                        return confirm(dataConfirm);
                    }
                });
            </script>
	{/if}
	{$smarty.block.parent}
{/block}
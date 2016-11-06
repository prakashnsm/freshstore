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
 
{if isset($leoGroup) && $leoGroup}
    {foreach from=$leoGroup item=group}
        <div class="{if isset($group.class) && $group.class}{$group.class}{/if}" 
            {if isset($LEO_BG_STYLE_DATA[$group.id]['background_image_html']) && $LEO_BG_STYLE_DATA[$group.id]['background_image_html'] != ''}
                {$LEO_BG_STYLE_DATA[$group.id]['background_image_html']}
            {/if}
        >
            {if isset($LEO_BG_STYLE_DATA[$group.id]['background_video_html']) && $LEO_BG_STYLE_DATA[$group.id]['background_video_html'] != ''}
                {$LEO_BG_STYLE_DATA[$group.id]['background_video_html']}
            {/if}

            {if isset($group.title) && $group.title}
                <h4 class="title_block">{$group.title}</h4>
            {/if}
            {if isset($group.columns) && $group.columns}
                {foreach from=$group.columns item=column}
                    {if $column.active}
                        <div class="widget{$column.col_value}{if isset($column.class) && $column.class} {$column.class}{/if}"
                            {if isset($column.background) && $column.background}style="background-color: {$column.background}"{/if}>
                            {if isset($column.rows)}
                                {foreach from=$column.rows item=row}
                                    {if isset($row.content)}{$row.content}{/if}
                                {/foreach}
                            {/if}
                        </div>
                    {/if}
                {/foreach}
            {/if}
        </div>
    {/foreach}
{/if}
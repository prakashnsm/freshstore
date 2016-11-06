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

{if isset($haccordions)}
<div id="h-accordion" class="h-accordion">
    {if isset($widget_heading)&&!empty($widget_heading)}
    <h4 class="title_block">
      {$widget_heading}
    </h4>
    {/if}
        <ul id="haccordions{$id}">
            {foreach $haccordions as $key => $hac}
            <li>
              <a class="title-hac" href="#haccordion{$id}{$key}">{$hac.title}</a>
              {$hac.content}
            </li>
            {/foreach}
        </ul>
</div>

<script type="text/javascript">
  $(document).ready(function() {
      activeItem = $("#haccordions{$id} li:first");
      $(activeItem).addClass('active');   
      $("#haccordions{$id} li").hover(function() {
          $(activeItem).css('width', '160px');
          $(this).css('width', '850px');
          activeItem = this;
      }); 
  });
</script>

{/if}






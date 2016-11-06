<div id="leo-verticalmenu" class="leo-verticalmenu highlighted block">
	<h4 class="title_block">{l s='Categories' mod='leomenusidebar'}</h4>
    <div class="box-content block_content">
		<div id="verticalmenu" class="verticalmenu" role="navigation">
				{$boostrapmenu}
		</div>
    </div>
</div>
<script type="text/javascript">
        $(document).ready(function() {
				$('#verticalmenu .dropdown-toggle').removeAttr("disabled");
				$(".dropdown-toggle").click(function() {
					if($(window).width() <= 767){
						if($(this).parent("li").find("div:first").hasClass("level2"))
							return false;
						else
							return true;
					}		
			});
		});
		
</script>

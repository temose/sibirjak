<!--BEGIN #searchform-->
<form class="searchform" method="get" action="<?php bloginfo('url'); ?>">
	<input class="search" name="s" type="text" value="Search"
		onblur="if (!this.value) this.value = 'Search';"
		onfocus="if (this.value == 'Search') this.value = '';"
	/><button class="search-btn" type="submit"><img src="<?php echo SBJ_IMAGES . 'magnifier.png' ?>" alt="search" /></button>
<!--END #searchform-->
</form>
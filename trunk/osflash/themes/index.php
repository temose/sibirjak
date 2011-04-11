<?php

	if (is_404()) {
		header( "HTTP/1.1 404 Not found", true, 404 );
	}

	get_header();
	
//	global $wp_query;
//	echo "<pre>";
//	
//	print_r($_GET);
//	print_r($wp_query);
//	echo "</pre>";
//		
	
	// page
	// blog article
	if (is_singular()) {
		the_post();
		include(TEMPLATEPATH . '/includes/sibirjak_show_article.inc.php');

	// article list
	} else if (is_category() || is_search() || is_home()) {
		include(TEMPLATEPATH . '/includes/sibirjak_show_article_list.inc.php');
				
	// 404
	} else {
		include(TEMPLATEPATH . '/includes/sibirjak_show_404.inc.php');
	}
	
	get_footer();


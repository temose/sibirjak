<?php

	/*
	 * Constants
	 */

	define('SBJ_STYLES', get_stylesheet_directory_uri() . '/css/');
	define('SBJ_JS', get_stylesheet_directory_uri() . '/js/');
	define('SBJ_IMAGES', get_stylesheet_directory_uri() . '/images/');

	/*
	 * Init
	 */

	require_once(TEMPLATEPATH . '/classes/DownloadWidget.php');
	require_once(TEMPLATEPATH . '/classes/ExamplePage.php');
	require_once(TEMPLATEPATH . '/classes/ArticleNavigation.php');
	
	add_action('wp_head', 'sibirjak_init');

	function sibirjak_init() {
		if (is_singular()) {
			global $wp_query;
			$post = $wp_query->post;
			
			// Donate tag before article navigation and example swf shorttag replacer
			sibirjak_replace_donate_tag($post);

			// replace download tags
			
			sibirjak_replace_download_tags($post);
			
			// Example code before article navigation and example swf shorttag replacer
			
			if (get_post_meta($post->ID, 'sibirjak_pagetype', true) == 'example') {
				ExamplePage::createInstance($post);
			}

			// replace example tags in other pages
			
			sibirjak_replace_example_tags($post);
			
			// add the example container to [swfexample] tags
			// do this after example page since examples may add [swfexample]
			
			sibirjak_add_swf_example_container($post);
			
			// article navigation
			
			ArticleNavigation::createInstance($post);
		}
	}
	
	/*
	 * DONATE tag
	 */

	function sibirjak_replace_donate_tag($post) {
		ob_start();
		include(TEMPLATEPATH . '/includes/donate.inc.php');
		$donateHTML = ob_get_contents();
		ob_clean();
		
		$post->post_content = preg_replace(
			"/\[DONATE\]/",
			$donateHTML,
			$post->post_content
		);
	}
	
	/*
	 * intlink2 shortcode
	 */

	add_shortcode('intlink2', 'sibirjak_intlink2');
	
	function sibirjak_intlink2($params, $content) {
		global $wpdb;
		$field = (is_numeric($params['id'])) ? 'ID' : 'post_name';
		$post = $wpdb->get_row("SELECT ID, post_title FROM $wpdb->posts WHERE $field = '" . $params['id'] . "'");
		if (empty($post)) return '#';
		$url = get_permalink($post->ID);
		if ($params["section"]) $url .= $params["section"];
		if ($params["anchor"]) $url .= '#' . $params["anchor"];
		$link = '<a href="' . $url . '">' . $content . '</a>';
		return $link;
	}
	
	/*
	 * Downloads
	 */

	function sibirjak_replace_download_tags($post) {
		new DownloadWidget($post);
	}

	/*
	 * Code examples
	 */

	function sibirjak_replace_example_tags($post) {
		$post->post_content = preg_replace_callback(
			"/  \[Example  .*?  url=\"  (.*?)  \"  .*?  \/\] /sx",
			'sibirjak_replace_example_tags_callback',
			$post->post_content
		);
	}

	function sibirjak_replace_example_tags_callback($result) {
		$fileName = preg_replace('/.+\\//', '', $result[1]);
		$example = '<div class="example_meta">' . $fileName . '</div>';
		$example .= '<pre lang="actionscript3" line="1">';
		$example .= file_get_contents($result[1]);
		$example .= '</pre>';
		return $example;
	}

	/*
	 * Automatically insert the Example.swf container to examples
	 */

	function sibirjak_add_swf_example_container($post) {
		$post->post_content = preg_replace_callback(
			"/  \[SWFExample  \s+  example=\"([^\"]+)\"  /x",
			'sibirjak_add_swf_example_container_callback',
			$post->post_content
		);
	}
	
	function sibirjak_add_swf_example_container_callback($result) {
		$fileName = preg_replace('/.+\\//', '', $result[1]);
		$example = '<div class="example_meta">' . $fileName . '</div>';
		$example .= '[swfobj src="' . content_url() . '/uploads/flash/Example.swf" flashvars="movie=' . $result[1] . '"';
		return $example;
	}
	
	/*
	 * Rewrite rules for example pages
	 */

	add_filter('init', 'sibirjak_flush_rules');
	add_filter('rewrite_rules_array','sibirjak_add_example_rules');
	add_filter('query_vars', 'sibirjak_add_query_vars');
	
	function sibirjak_flush_rules(){
		global $wp_rewrite;
	   	$wp_rewrite->flush_rules();
	}
	
	function sibirjak_add_example_rules($rules) {
		$newrules = array();
		$newrules['(^.*/examples)/category/(.*)$'] = 'index.php?pagename=$matches[1]&example_category=$matches[2]';
		$newrules['(^.*/examples)/(.*)$'] = 'index.php?pagename=$matches[1]&example=$matches[2]';
		return $newrules + $rules;
	}
	
	function sibirjak_add_query_vars($aVars) {
	    $aVars[] = "example";
	    $aVars[] = "example_category";
	    return $aVars;
	}
	
	/*
	 * Remove comments feed from head.
	 * Remove admin bar
	 */
	
	automatic_feed_links(false);

	add_filter('show_admin_bar', 'sibirjak_show_admin_bar');

	function sibirjak_show_admin_bar() {
		return false;
	}

	/*
	 * Add redirect page link
	 */

	add_action('page_link', 'sibirjak_page_link', null, 2);
	add_action('the_title', 'sibirjak_the_title', null, 2);

	function sibirjak_page_link($link, $id) {
		if (get_post_meta($id, 'sibirjak_pagetype', true) == 'redirect') {
			$page = get_post($id);
			return $page->post_content;
			
		} else {
			return $link;
			
		}
	}

	function sibirjak_the_title($title, $id) {
		if (get_post_meta($id, 'sibirjak_pagetype', true) == 'redirect') {
			return $title . '&rarr;';
			
		} else {
			return $title;

		}
	}

	/*
	 * Add page menu classes
	 */

	add_action('page_css_class', 'sibirjak_add_specific_page_css');

	function sibirjak_add_specific_page_css($css_class) {
		if (sizeof($css_class) > 2) {
			$css_class[] = "current_page_tree";
		} else {
			$css_class[] = "not_current_page_tree";
		}
		
		return $css_class;
	}

	/*
	 * Register styles and scripts
	 */

	add_action('wp_print_styles', 'sibirjak_add_my_stylesheet');
	add_action('init', 'sibirjak_add_my_scripts');

	function sibirjak_add_my_stylesheet() {
		wp_enqueue_style( 'sibirjak-base', SBJ_STYLES . 'sibirjak_base.css');
		wp_enqueue_style( 'sibirjak', SBJ_STYLES . 'sibirjak.css');
		wp_enqueue_style( 'sibirjak-main', SBJ_STYLES . 'sibirjak_main.css');
	}

	function sibirjak_add_my_scripts() {
		wp_enqueue_script( 'sibirjak', SBJ_JS . '/sibirjak.js');
	}

	/*
	 * General
	 */
	
	function sibirjak_is_blog() {
		return is_home() || is_category() || is_single();
	}
	
	function sibirjak_link($url, $title) {
		echo '<a href="' . $url . '" title="' . $title . '">' . $title . '</a>';
	}
	
	function sibirjak_get_short_title($title, $size) {
		if (strlen($title) > $size) {
			$title_arr = split(' ', $title);
			$title = '';
			foreach ($title_arr as $word) {
				if ($title != '') {
					$title .= ' ';
					if (strlen($title) + strlen($word) > $size) {
						$title .= '...';
						break;
					}
				}
				$title .= $word;
			}
		}
		return $title;
	}

	/*
	 * Reset wp_syntax tab size
	 */

	add_action('wp_syntax_init_geshi', 'sibirjak_geshi_change_tabs');
	function sibirjak_geshi_change_tabs($geshi) {
		$geshi->set_header_type(GESHI_HEADER_DIV);
		$geshi->set_tab_width(2);
	}

	/*
	 * Set admin post editing font
	 */

	add_action( 'admin_print_styles-post.php', 'sibirjak_my_admin_css' );
	add_action( 'admin_print_styles-post-new.php', 'sibirjak_my_admin_css' );
	function sibirjak_my_admin_css() {
		?>
		<style type="text/css">
		#editorcontainer textarea#content {
			font-family: monospace !important;
			font-size: 11px !important;
		}
		</style>
		<?php
	}

	/*
	 * Callback for comments or pings
	 */
	
	function sibirjak_comment_callback($comment, $args, $depth) {
		$GLOBALS['comment'] = $comment;
		include(TEMPLATEPATH . '/includes/sibirjak_show_comment.inc.php');
	}

	function sibirjak_comment_end_callback($comment, $args, $depth) {
		// prevent wordpress to auto add a closing li tag
	}

	/*
	 * Semantic Title
	 */
	
	function sibirjak_echo_semantic_title() {
		// path for a normal page
		if (is_page()) {
			global $post;
			while (1) {
				echo get_the_title($post);
				if ($post->post_parent) echo ' &lsaquo; ';
				else break;
				$post = get_post($post->post_parent);
			}
		}
		
		// path for a blog page
		else if (sibirjak_is_blog()) {
			if (is_home() || is_category()) {
				if (is_category()) {
					echo 'Category: ' . get_cat_name(get_query_var('cat'));
					echo ' &lsaquo; ';
				}
			}
	
			// path for a blog page
			if (is_single()) {
				echo get_the_title($post);
				echo ' &lsaquo; ';
			}
			
			echo get_the_title(get_post(get_option('page_for_posts')));
			
		} else if (is_search()) {
			global $wp_query;
			echo 'Search "' . $wp_query->get('s') . '"';

		} else if (is_404()) {
			echo '404';
		}
		
		echo ' &lsaquo; ';
		bloginfo('name');
		echo (' ');
		echo bloginfo('description');
	}

	/****************************
	 * NAVIGATION
	 ****************************/

	/*
	 * Path Menu
	 */
	
	function sibirjak_show_path_menu($post = null) {
		if ($post) {
			//$page = get_post($pageID);
			if ($post->post_type == 'page') {
				sibirjak_show_page_path_menu($post);
			} else {
				sibirjak_show_article_path_menu($post);
			}
			
		} else {
			// path for a normal page
			if (is_page()) {
				global $wp_query;
				$page = get_post($wp_query->get_queried_object_id());
				sibirjak_show_page_path_menu($page);
			}
			
			// path for a blog page
			if (is_home() || is_category()) {
				$blogID = get_option('page_for_posts');
				
				if (is_home()) {
					sibirjak_path_menu_link(get_page_link($blogID), get_the_title($blogID), 'current_page_item');
				}

				if (is_category()) {
					sibirjak_path_menu_link(get_page_link($blogID), get_the_title($blogID));

					sibirjak_path_menu_link(
						get_category_link(get_query_var('cat')),
						'Category: ' . get_cat_name(get_query_var('cat')),
						'current_page_item'
					);
				}
			}

			// path for a blog page
			if (is_single()) {
				sibirjak_show_article_path_menu($post);
			}
		}
	}
	
	function sibirjak_show_page_path_menu($page) {
		$parentID = $page->post_parent;
		$path = array();
		while ($parentID) {
			$ancestor = get_post($parentID);
			array_push($path, get_page_link($parentID), get_the_title($parentID));
			$parentID = $ancestor->post_parent;
		}
		
		for ($i = sizeof($path) - 1; $i > -1; $i -= 2) {
			sibirjak_path_menu_link($path[$i - 1], $path[$i]);
		}
		
		sibirjak_path_menu_link(get_page_link($page->ID), get_the_title($page->ID), 'current_page_item');
	}

	function sibirjak_show_article_path_menu($article) {
		$blogID = get_option('page_for_posts');
		sibirjak_path_menu_link(get_page_link($blogID), get_the_title($blogID));
		sibirjak_path_menu_link(get_permalink($article->ID), get_the_title($article->ID), 'current_page_item');
	}

	function sibirjak_path_menu_link($url, $title, $css_class = '') {
		echo '<span class="raquo">&rsaquo;</span>';
		echo '<span class="current_page_tree ' . $css_class . '">';
		sibirjak_link($url, sibirjak_get_short_title($title, 80));
		echo '</span>';
	}

	/*
	 * Sidebar
	 */

	function sibirjak_show_projects_navigation() {
		wp_list_pages(array(
			'include' => array(get_option('page_on_front')),
			'sort_column' => 'menu_order, post_title',
			'title_li' => ''
		));

		wp_list_pages(array(
			'depth' => 1,
			'child_of' => get_option('page_on_front'),
			'sort_column' => 'menu_order, post_title',
			'title_li' => ''
		));
	}
	
	function sibirjak_show_blog_navigation() {
		if (sibirjak_is_blog()) {
			$css_class = ' class="';
			$css_class .= 'current_page_tree';
			if (is_home()) $css_class .= ' current_page_item';
			$css_class .= '"';
		}
		echo '<li' . $css_class . '>';
		$blogID = get_option('page_for_posts');
		sibirjak_link(get_page_link($blogID), get_the_title($blogID));
		echo '</li>';

		
		global $wp_query;
		$current_id = $wp_query->get_queried_object_id();
		
		query_posts('type=postbypost&showposts=10');
		while ( have_posts() ) {
			the_post();
			$css_class = get_the_ID() == $current_id ? ' class="current_page_item"' : '';
			echo '<li' . $css_class . '>';
			sibirjak_link(get_permalink(), get_the_title());
			echo '</li>';
		}

		//Reset Query
		wp_reset_query();
	}
	
	/*
	 * Top Navigation
	 */
	
	function sibirjak_show_top_navigation() {
		$pages = get_pages(array(
			'depth' => 1,
			'parent' => 0,
			'child_of' => 0,
			'sort_column' => 'menu_order, post_title',
			'title_li' => ''
		));
		
		foreach ($pages as $page) {
			if (sibirjak_get_current_top_page_id() == $page->ID) echo '<li class="current_page_tree">';
			else echo '<li>';
			sibirjak_link(get_page_link($page->ID), get_the_title($page->ID));
			echo '</li>';
		}
	}
	
	function sibirjak_get_current_top_page_id() {
		if (sibirjak_is_blog()) {
			return get_option('page_for_posts');
		}
				
		if (is_page()) {
			global $wp_query;
			$current_page = get_post($wp_query->get_queried_object_id());
			$depth = sizeof($current_page->ancestors);
			if ($depth > 0) return $current_page->ancestors[$depth - 1];
			return $current_page->ID;
		}
		
		return -1;
	}
	
	/*
	 * Navigation 2nd and 3rd Level
	 */
	
	function sibirjak_has_navigation_level2() {
		//return true;
		if (is_page()) {
			global $wp_query;
			$page = get_post($wp_query->get_queried_object_id());
			if (sizeof($page->ancestors) > 0) return true;

			return sizeof(get_pages('child_of=' . $page->ID)) > 0;
		}
		
		if (is_home() || is_category()) {
			return true;
		}
		
		return false;
	}

	function sibirjak_show_navigation_level2() {
		if (is_page()) {

			global $wp_query;
			$page = get_post($wp_query->get_queried_object_id());
			$css_class = '';

			if ($page->post_parent) {
				if (sizeof($page->ancestors) == 3) {
					$page = get_post($page->ancestors[1]);
		
				} else if (sizeof($page->ancestors) == 2) {
					$page = get_post($page->ancestors[0]);

				} else if (sizeof($page->ancestors) == 1) {
					$css_class = ' current_page_item';
				}

				echo '<li class="current_page_tree' . $css_class . '">';
				sibirjak_link(get_page_link($page->ID), get_the_title($page->ID));
				echo '</li>';
			}

			$pages = get_pages(array(
				'child_of' => $page->ID,
				'parent' => $page->ID,
				'sort_column' => 'menu_order, post_title',
				'title_li' => ''
			));
			
			$currentPage = get_page($wp_query->get_queried_object_id());
			
			foreach ($pages as $tmpPage) {
				
				if ($tmpPage->post_title == "Downloads") continue;
				
				
				if ($tmpPage->ID == $currentPage->ID) echo '<li class="current_page_item">';
				else if ($tmpPage->ID == $currentPage->post_parent) echo '<li class="current_page_tree">';
				else echo '<li>';
				sibirjak_link(get_page_link($tmpPage->ID), get_the_title($tmpPage->ID));
				echo '</li>';
			}
		
		} else if (sibirjak_is_blog()) {
			$current_category = -1;
			$css_class = '';
					
			if (is_category()) {
				$current_category = get_query_var('cat');

			} else { // is_home() == true
				$css_class = ' class="current_page_item"';
			}
			
			$categories = get_categories();
			
			echo '<li' . $css_class . '>';
			$blog = get_post(get_option('page_for_posts'));
			sibirjak_link(get_page_link($blog->ID), 'All Categories');
			echo "</li>";
			
			foreach ($categories as $category) {
				if ($current_category == $category->cat_ID) echo '<li class="current_page_item">';
				else echo "<li>";
				sibirjak_link(get_category_link($category->cat_ID), get_cat_name($category->cat_ID));
				echo "</li>";
			}
		}
	}

	function sibirjak_has_navigation_level3() {
		if (is_page()) {
			global $wp_query;
			$page = get_post($wp_query->get_queried_object_id());
			if (sizeof($page->ancestors) < 2) return false;

			if (sizeof($page->ancestors) == 3) {
				$page = get_post($page->ancestors[0]);
			}
			
			return sizeof(get_pages('child_of=' . $page->ID)) > 0;
		}
		return false;
	}

	function sibirjak_show_navigation_level3() {
		if (is_page()) {
			global $wp_query;
			$page = get_post($wp_query->get_queried_object_id());
			
			if (sizeof($page->ancestors) == 3) {
				$page = get_post($page->post_parent);
			}

			wp_list_pages(array(
				'depth' => 1,
				'child_of' => $page->ID,
				'sort_column' => 'menu_order, post_title',
				'title_li' => ''
			));
		}
	}
	
	/*
	 * Headline
	 */
	
	function sibirjak_show_headline() {
		
		if (is_page()) {
			global $wp_query;
			$page = get_post($wp_query->get_queried_object_id());
			
			if (sizeof($page->ancestors) > 1) {
				$page = get_post($page->ancestors[sizeof($page->ancestors) - 2]);
			}
			
			sibirjak_link(get_page_link($page->ID), get_the_title($page->ID));
			
		} else if (is_single()) {
			sibirjak_link(get_permalink(), get_the_title());
			
		} else if (is_category() || is_home()) {
			$blogID = get_option('page_for_posts');
			sibirjak_link(get_page_link($blogID), get_the_title($blogID));

		} else if (is_search()) {
			global $wp_query;
			sibirjak_link('', 'Search "' . $wp_query->get('s') . '"');

		} else if (is_404()) {
			sibirjak_link('', '404');
		}
	}

	/*
	 * Article Headline
	 */
	
	function sibirjak_has_article_headline() {
		if (is_page()) {
			global $wp_query;
			$page = get_post($wp_query->get_queried_object_id());
			if (sizeof($page->ancestors) > 1) {
				return true;
			}

		} else if (is_category()) {
			return true;
		}
		
		return false;
	}
	
	function sibirjak_show_article_headline() {
		if (is_page()) {
			sibirjak_link(get_permalink(), get_the_title());

		} else if (is_category()) {
			sibirjak_link(get_category_link(get_query_var('cat')), 'Category: ' . get_cat_name(get_query_var('cat')));
		}
	}
	
	/*
	 * Article Navigation
	 */

	function sibirjak_has_article_navigation() {
		$articleNavigation = ArticleNavigation::getInstance();
		if ($articleNavigation != null) return $articleNavigation->size() > 1;
		return false;
	}

	function sibirjak_show_popup_article_navigation() {
		$articleNavigation = ArticleNavigation::getInstance();
		echo $articleNavigation->getNavigation();
	}

	function sibirjak_show_content_article_navigation() {
		$articleNavigation = ArticleNavigation::getInstance();
		$articleNavigation->includeTopLink = false;
		$articleNavigation->includeBottomLink = false;
		echo $articleNavigation->getNavigation();
	}

	/*
	 * Check for the Jakute project
	 */

	function sibirjak_is_jakute() {
		if (is_page()) {
			global $wp_query;
			$page = get_post($wp_query->get_queried_object_id());
			
			if (sizeof($page->ancestors) > 1) {
				$page = get_post($page->ancestors[sizeof($page->ancestors) - 2]);
			}
			
			return $page->ID == 945;

		} else if (is_single()) {
			$categories = get_the_category();
			return $categories[0]->cat_ID == 6;
			
		} else if (is_category()) {
			$categories = get_the_category();
			return $categories[0]->cat_ID == 6;
		}

		return false;
	}
	
	function sibirjak_jakute_version() {
		echo get_post_meta(945, 'jakute_version', true);
	}
	
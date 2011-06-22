<?php include (TEMPLATEPATH . '/includes/htmlhead.inc.php'); ?>

<!--BEGIN body-->
<body id="top">

	<div id="background">
		<div id="background_left_container">
			<div id="background_left"></div>
		</div>
	</div>

	<!-- BEGIN #container -->
	<div id="container">

		<!-- BEGIN #right -->
		<div id="right">
			<div id="deep_links" class="navigation_list skip_underline_links">
				<ul>
					<?php sibirjak_show_projects_navigation(); ?>
				</ul>
				<ul>
					<?php sibirjak_show_blog_navigation(); ?>
				</ul>
	
				<ul>
					<li><img src="<?php echo SBJ_IMAGES; ?>twitter_sidebar.png" title="Follow me on Twitter" alt="Follow me on Twitter" /></li>
					<li><a href="http://twitter.com/kakenbok">Follow me on Twitter</a></li>
				</ul>
	
				<ul>
					<li><img src="<?php echo SBJ_IMAGES; ?>feed.png" title="RSS" alt="RSS" /> RSS</li>
					<li><a href="<?php bloginfo( 'rss2_url' ); ?>" title="<?php echo wp_specialchars( get_bloginfo( 'name' ), 1 ) ?> Posts RSS feed" rel="alternate" type="application/rss+xml">All posts</a></li>
					<li><a href="<?php bloginfo( 'comments_rss2_url' ); ?>" title="<?php echo wp_specialchars( bloginfo( 'name' ), 1 ) ?> Comments RSS feed" rel="alternate" type="application/rss+xml">All comments</a></li>
				</ul>
	
				<ul>
					<li>Meta</li>
					<?php wp_register(); ?>
					<li><?php wp_loginout(); ?></li>
					<?php wp_meta(); ?>
					<li><a href="http://validator.w3.org/check/referer" title="Validate this page as XHTML 1.0 Transitional">Validate XHTML</a></li>
					<li><a href="http://jigsaw.w3.org/css-validator/check/referer" title="Validate this page as CSS level 2.1">Validate CSS</a></li>
				</ul>
	
			</div>
		
		</div>	
		<!-- END #right -->
	
		<!-- BEGIN #left -->
		<div id="left">
		
			<div id="header">
				<div id="search">
					<?php if (sibirjak_has_article_navigation()) : ?>
						<div id="article_navigation_popup_container">
							<div id="article_navigation_popup_trigger">
								<img src="<?php echo SBJ_IMAGES; ?>top_sharp_black.png" title="Article Navigation" alt="Article Navigation" />
								
								<div id="article_navigation_popup" class="navigation_list article_navigation skip_underline_links highlight_current_page_tree highlight_current_page_item">
									<?php sibirjak_show_popup_article_navigation(); ?>
								</div>
							</div>
						</div>
					<?php endif; ?>
					
					<?php get_search_form(); ?>
	
					<br class="clear" />
	
				</div>
				
				<div id="header_left">
					<h1 id="title">Russischer Bär Open Source Flash</h1>
				
					<div id="tab_navigation" class="navigation_list skip_underline_links highlight_current_page_tree">
						<ul>
							<?php sibirjak_show_top_navigation(); ?>
						</ul>
						<br class="clear" />
					</div>
					
				</div>
	
				<br class="clear" />
			</div>
	
			<?php if (is_singular() || (is_home() && !is_paged())) : ?>
				<div id="addthis">
					<?php echo simple_social_bookmarks(
						'',
						'Currently reading a blog post titled %title% - %url%',
						'',
						'default=off&delicious=on&twitter=on&facebook=on&googlebookmarks=on'
						. '&iconfolder=images/bookmarks'
					); ?>
					<br />

					<a class="FlattrButton" style="display:none;" href="http://sibirjak.com/osflash/"></a>
				</div>
			<?php endif; ?>
	
			<div id="path_navigation" class="path_navigation highlight_current_page_tree highlight_current_page_item">
				<?php sibirjak_show_path_menu(); ?>
			</div>
			
	
			<div id="headline_container">
	
				<?php if (is_singular() && current_user_can('edit_posts')) : ?>
					<div id="edit_post_link" class="edit_link">
						<a href="<?php echo get_edit_post_link( $post->ID ); ?>">
							<img src="<?php echo SBJ_IMAGES; ?>page_white_edit.png" alt="Edit this page" title="Edit this page" />
						</a>
					</div>
				<?php endif; ?>
				
				<div id="headline" class="highlight_current_page_item">
					<h1 class="current_page_item">
						<?php sibirjak_show_headline(); ?>
					</h1>
				</div>
	
				<?php include(TEMPLATEPATH . '/includes/sibirjak_show_next_previous_top_navigation.inc.php'); ?>
	
				<?php if (sibirjak_has_navigation_level2()) : ?>
				<div id="sub_navigation" class="navigation_list highlight_current_page_tree highlight_current_page_item">
					<ul>
						<?php sibirjak_show_navigation_level2(); ?>
					</ul>
					<br class="clear" />
					<?php if (sibirjak_has_navigation_level3()) : ?>
					<div id="sub_navigation2" class="navigation_list">
						<ul>
							<?php sibirjak_show_navigation_level3(); ?>
						</ul>
						<br class="clear" />
					</div>
					<?php endif; ?>
				</div>
				<?php endif; ?>
		
			</div>
	
			<div class="content">
	
				<?php if (sibirjak_has_article_navigation() || sibirjak_has_download_button()) : ?>
				
					<div id="article_navigation_container">
						
						<?php sibirjak_download_button(); ?>

						<?php if (sibirjak_has_article_navigation()) : ?>
							<div id="article_navigation" class="navigation_list article_navigation skip_underline_links highlight_current_page_tree highlight_current_page_item">
								<?php sibirjak_show_content_article_navigation(); ?>
							</div>
						<?php endif; ?>
					</div>
				<?php endif; ?>
	
				<?php if (sibirjak_has_article_headline()) : ?>
				<div id="article_headline" class="highlight_current_page_item">
					<h2 class="current_page_item"><?php sibirjak_show_article_headline(); ?></h2>
				</div>
				<?php endif; ?>
			
				<div id="main">

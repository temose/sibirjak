
	<?php if (have_posts()) : ?>
		<div id="article_list">

		<?php while (have_posts()) : the_post(); ?>
			<!--BEGIN .hentry-->
			<div id="post-<?php the_ID(); ?>" class="<?php echo join(' ', get_post_class()); ?>">

				<div class="navigation path_navigation"><?php global $post; sibirjak_show_path_menu($post); ?></div>
				
				<h2 class="post-title"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>

				<?php if (get_post_type() == 'post') : ?>
					<div class="post_meta">
						Article
						| Published: <?php the_time(get_option('date_format')); ?>
						| Changed: <?php the_modified_date(); ?>
						| Category: <?php echo get_the_category_list(', '); ?>
						<?php if (get_comments_number()) : ?>
							| <a href="<?php the_permalink(); ?>#comments">
								<?php echo get_comments_number() ?> Comment<?php if (get_comments_number() != 1) echo 's'; ?>
							</a>
						<?php endif; // ( have_comments() ) ?>
					</div>
				<?php else: ?>
					<div class="post_meta">
						Page
						| Published: <?php the_time(get_option('date_format')); ?>
						| Changed: <?php the_modified_date(); ?>
						<?php if (get_comments_number()) : ?>
							| <a href="<?php the_permalink(); ?>#comments">
								<?php echo get_comments_number() ?> Comment<?php if (get_comments_number() != 1) echo 's'; ?>
							</a>
						<?php endif; // ( have_comments() ) ?>
					</div>
				<?php endif; ?>

				<!--BEGIN .entry-summary .article-->
				<div class="entry-summary article">
					<?php the_excerpt(); ?>
				</div>
				<!--END .entry-summary .article-->

			</div>
			<!--END .hentry-->
			<?php endwhile; ?>
		</div>
		
	<?php else : include(TEMPLATEPATH . '/includes/sibirjak_show_no_article_found.inc.php'); ?>
	<?php endif; ?>
	
	
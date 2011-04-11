<?php if (is_single()) : ?>
	<div id="post_meta">
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
<?php elseif (is_page()) : ?>
	<div id="post_meta">
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

<?php if (is_single()) :
	$previous = get_previous_post();
	$next = get_next_post();
	if ($previous || $next) :
?>
	<div id="next_previous_top_navigation" class="next_previous_navigation">
		<?php if ($previous) : ?>
			<div class="nav-meta nav-previous"><span class="arr">&larr;</span> Previous post: <?php previous_post_link('%link'); ?></div>
		<?php endif; if ($next) : ?>
			<div class="nav-meta nav-next"><span class="arr">&rarr;</span> Next post: <?php next_post_link('%link'); ?></div>
		<?php endif; ?>
	</div>

<?php endif; endif; ?>


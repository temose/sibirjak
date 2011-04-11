<?php if (is_single()) :
	$previous = get_previous_post();
	$next = get_next_post();
	if ($previous || $next) :
?>
	<div id="next_previous_bottom_navigation" class="next_previous_navigation">
		<?php if ($previous) : ?>
			<div class="nav-meta nav-previous"><span class="arr">&larr;</span> Previous post: <?php previous_post_link('%link'); ?></div>
		<?php endif; if ($next) : ?>
			<div class="nav-meta nav-next"><span class="arr">&rarr;</span> Next post: <?php next_post_link('%link'); ?></div>
		<?php endif; ?>
	</div>

<?php endif; elseif (is_category() || is_home() || is_search()) :
	$next = get_previous_posts_link('Newer Posts');
	$previous = get_next_posts_link('Older Posts');
	if ($previous || $next) :
?>
	<div id="next_previous_bottom_navigation" class="next_previous_navigation">
		<?php if ($previous) : ?>
			<div class="nav-meta nav-previous"><span class="arr">&larr;</span> <?php echo $previous; ?></div>
		<?php endif; if ($next) : ?>
			<div class="nav-meta nav-next"><span class="arr">&rarr;</span> <?php echo $next; ?></div>
		<?php endif; ?>
	</div>
<?php endif; endif; ?>

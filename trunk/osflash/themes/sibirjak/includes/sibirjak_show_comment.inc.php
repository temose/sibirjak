<li id="comment-<?php echo comment_ID(); ?>">

	<?php if (current_user_can('edit_posts')) : ?>
		<div id="edit_comment_link" class="edit_link">
			<a href="<?php echo get_edit_comment_link(''); ?>">
				<img src="<?php echo SBJ_IMAGES; ?>page_white_edit.png" />
			</a>
		</div>
	<?php endif; ?>

	<h3 class="comment_author"><?php echo get_comment_author_link(); ?></h3>

	<div class="comment-meta">
		<span class="comment-date"><?php echo get_comment_date() ?></span>
	</div>

	<div class="comment-content">
		<?php if ($comment->comment_approved == '0') : ?>
			<p class="comment-unapproved moderation alert">Your comment is awaiting moderation (more than 1 link inserted).</p>
		<?php endif; ?>

		<?php echo comment_text(); ?>
	</div>

</li>

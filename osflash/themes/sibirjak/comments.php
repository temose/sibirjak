<?php if (get_comments_number()) : ?>
	<!--BEGIN #comments-->
	<div class="comments_container">
		<div id="comments" class="comments">
		    
			<h2 class="comments_headline"><?php echo get_comments_number() ?> Comment<?php if (get_comments_number() != 1) echo 's'; ?></h2>
	
		    <ol id="comments-list">
				<?php wp_list_comments(array(
					'type' => 'all',
					'callback' => 'sibirjak_comment_callback',
					'end-callback' => 'sibirjak_comment_end_callback'
				)); // see functions.php for the callback ?>
		    </ol>
		
		<!--END #comments-->
		</div>
	</div>
<?php endif; // ( have_comments() ) ?>

<?php if (comments_open()) : // show comment form ?>
	<!--BEGIN #respond-->
	<div class="comments_container">
		<div id="respond" class="comments">
		
		    <h2 class="comments_headline">Leave a Comment</h2> 
		    
		    <div class="comments_forum">You have a question or have experienced an issue? Please post it in the forum: <a href="https://sibirjak.tenderapp.com/discussions/">http://sibirjak.tenderapp.com/</a> in order to make the discussion available at a more central place.</div>
		    
		    <!--BEGIN #comment-form-->
			<form id="comment-form" method="post" action="<?php echo get_option( 'siteurl' ); ?>/wp-comments-post.php">
				<?php if ( is_user_logged_in() ) : global $current_user; // If user is logged-in, then show them their identity ?>
		      		<div id="logged_in">Logged in as <a href="<?php echo get_option( 'siteurl' ); ?>/wp-admin/profile.php"><?php echo $user_identity; ?></a> | <a href="<?php echo wp_logout_url( get_permalink() ); ?>" title="Log out of this account">Log out</a></div>
		        
				<?php else : // If user isn't logged-in, ask them for their details ?>
			        <!--BEGIN #form-section-author-->
			        <div id="form-section-author" class="form-section">
			            <input name="author" id="author" type="text" value="<?php echo $comment_author; ?>" />
			            <label for="author">Name*</label>
			        <!--END #form-section-author-->
			        </div>
			        
			        <!--BEGIN #form-section-email-->
			        <div id="form-section-email" class="form-section">
			            <input name="email" id="email" type="text" value="<?php echo $comment_author_email; ?>" />
			            <label for="email">Email* (not published)</label>
			        <!--END #form-section-email-->
			        </div>
					
			        <!--BEGIN #form-section-url-->
			        <div id="form-section-url" class="form-section">
			            <input name="url" id="url" type="text" value="<?php echo $comment_author_url; ?>" />
			            <label for="url">Website</label>
			        <!--END #form-section-url-->
			        </div>
				<?php endif; // if ( is_user_logged_in() ) ?>
				
				<!--BEGIN #form-section-comment-->
		        <div id="form-section-comment" class="form-section">
		        	<textarea name="comment" id="comment" rows="10" cols="65"></textarea>
		        <!--END #form-section-comment-->
		        </div>
		        
		        <!--BEGIN #form-section-actions-->
		        <div id="form-section-actions" class="form-section">
					<button name="submit" id="submit" type="submit">Submit Comment</button>
					<?php comment_id_fields(); ?>
		        <!--END #form-section-actions-->
		        </div>
		
			<?php do_action('comment_form', $post->ID); // Available action: comment_form ?>
		    <!--END #comment-form-->
		    </form>
		    
		<!--END #respond-->
		</div>
	</div>
<?php endif; // ( comments_open() ) ?>
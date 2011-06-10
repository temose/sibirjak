<div class="example">

	<h<?php echo $headlineSize; ?>><a href="<?php echo $example['_url']; ?>" title="Example <?php echo $example['title']; ?>"><?php echo $example['title']; ?></a></h<?php echo $headlineSize; ?>>

	<?php if ($example['description']) : ?>
		<p class="description"><?php echo $example['description']; ?></p>
	<?php endif; ?>

	<?php if ($example['_related_examples']) : ?>
		<div class="example_meta">Related: <?php echo $example['_related_examples']; ?></div>
	<?php endif; ?>

	<?php if ($example['_categories']) : ?>
		<div class="example_meta">Category: <?php echo $example['_categories']; ?></div>
	<?php endif; ?>

	<?php if ($swf) : ?>
		[SWFExample example="<?php echo $swf[0] ?>" width="<?php echo $swf[1] ?>" height="<?php echo $swf[2] ?>" /]
	<?php endif; ?>

	<?php if (sizeof($listings)) {
		foreach ($listings as $listing) { ?>
			<div class="example_meta"><?php echo $listing[0]; ?>: <a href="<?php echo $svnSrcUrl . $listing[1]; ?>">Source raw</a>, <a href="<?php echo $svnBrowseUrl . $listing[1]; ?>">Source highlighted</a></div>
			<pre lang="actionscript3" line="1"><?php echo $listing[2]; ?></pre>
		<?php }
	} ?>

</div>

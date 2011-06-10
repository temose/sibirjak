<?php

	#$root = 'http://127.0.0.1/com/sibirjak/';
	$root = 'http://sibirjak.com/';

	$relocationMap = array(
		'' => '',

		'/asdpc' => 'projects/as-dataprovider-controls/',
		'/asdpc/actionscript-data-provider-controls' => 'projects/as-dataprovider-controls/documentation/',
		'/asdpc/asdpc-treeview' => 'projects/as-dataprovider-controls/documentation/treeview/',
	
		'/lite-collections' => 'projects/as3commons-collections/',
		'/collections/as3commons-collections' => 'projects/as3commons-collections/documentation',
		'/collections/why-we-need-a-collection-framework-in-actionscript' => 'blog/why-we-need-a-collection-framework-in-actionscript/',
		'/collections/collections-framework-performance-comparision' => 'blog/collections-framework-performance-comparision/',
		'/collections/array-dictionary-collections-performace-functionality-reliability' => 'blog/array-dictionary-collections-performance-functionality-reliability/',
		'/collections/array-dictionary-collections-performance-functionality-reliability' => 'blog/array-dictionary-collections-performance-functionality-reliability/',
	
		'/jakute/announcement-jakute-flash-a-complete-styling-engine' => 'blog/announcement-jakute-flash-a-complete-styling-engine/',
	);
	
	$location = '404' . $_SERVER['REQUEST_URI'];
	
	if (preg_match("/\/blog\/(wp-content\/uploads.*)/", $_SERVER['REQUEST_URI'], $result)) {
		$location = $result[1];

	} else {
		foreach ($relocationMap as $old => $new) {
			$old = preg_replace("/\//", '\/', $old);
			if (preg_match("/\/blog(\/index.php)?$old\/?(#|\?.*)?$/", $_SERVER['REQUEST_URI'])) {
				$location = $new;
			}
		}
	}
		
	#echo $_SERVER['REQUEST_URI'] . '<br />';
	#echo "/\/blog(\/index.php)?\/$old\/?(#|\?.*)?$/" . '<br />';
	#echo $root . 'osflash/' . $location . '<br />';
	#exit;
	
	header ('HTTP/1.1 301 Moved Permanently');
	header ('Location: ' . $root . 'osflash/' . $location);

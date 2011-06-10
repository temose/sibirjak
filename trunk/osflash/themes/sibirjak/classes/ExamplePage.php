<?php

	class ExamplePage {
		
		var $post;
		var $svnSrcUrl = "";
		var $svnBrowseUrl = "";
		var $svnCodeUrl = "";
		var $examples = array();
		var $expandedExamples = array();
		var $categories = array();
		var $categoryList = array();
		
		var $navigationHTML = '';
		var $expandedExamplesHTML = '';
		
		static $instance;

		static function createInstance($post) {
			if (self::$instance == null) {
				self::$instance = new ExamplePage($post);
			}
		}

		static function getInstance() {
			if (!self::$instance) return null;
			return self::$instance;
		}
		
		function ExamplePage($post) {
			
			$this->post = $post;
			
			$this->parseExamples();
			
			$this->createNavigationHTML();
			
			if (sizeof($this->expandedExamples) > 0) $this->createExpandedExamplesHTML();
			
			$this->replaceExampleTags();
			
			$this->post->post_content = $this->navigationHTML . $this->expandedExamplesHTML . $this->post->post_content;
			
			$this->post->post_content = '<div id="examples">' . $this->post->post_content . '</div>';
		}

		private function replaceExampleTags() {
			$this->post->post_content = preg_replace_callback(
				"/  \[Example  .*?  slug=\"  (.*?)  \"  .*?  \/\] /sx",
				array($this, 'replaceExampleTagCallback'),
				$this->post->post_content
			);

			$headlineSize = sizeof($this->expandedExamples) > 0 ? 2 : 1;
			
			$this->post->post_content = preg_replace(
				"/  \[Section  .*?  title=\"  (.*?)  \"  .*?  \/\] /sx",
				'<h' . $headlineSize . '>$1</h' . $headlineSize . '>',
				$this->post->post_content
			);
		}
		
		private function replaceExampleTagCallback($result) {
			ob_start();
			
			$headlineSize = 3;
			$code = '';
			
			$example = $this->examples[$result[1]];
			include('sibirjak_show_example.inc.php');

			$exampleHTML = ob_get_contents();
			
			ob_clean();
			
			return $exampleHTML;
		}

		private function createNavigationHTML() {
			
			// Examples

//			$this->navigationHTML = '<div class="highlight_current_page_tree highlight_current_page_item">';
//			$this->navigationHTML .= '<span>Examples: </span>';
//			$examplesHTML = array();
//			foreach ($this->examples as $example) {
//				$css_class = $example['_css'] ? $example['_css'] : '';
//				$examplesHTML[] =  '<span class="example-link ' . $css_class . '"><a href="' . $example['_url'] . '">' . $example['title'] . '</a></span>';
//			}
//			$this->navigationHTML .= join(', ', $examplesHTML);
//			$this->navigationHTML .= '</div>';
			
			// Categories
			
			$this->navigationHTML .= '<div id="category_navigation" class="highlight_current_page_tree highlight_current_page_item">';
			$this->navigationHTML .= '<span>Categories: </span>';
			$this->navigationHTML .= $category;
			$categoryNavigationContent = array();
			foreach ($this->categories as $category) {
				$categoryCSSClass = get_query_var('example_category') == $category['slug'] ? 'current_page_item' : '';
				$categoryNavigationContent[] = '<span class="example-link ' . $categoryCSSClass . '">' . $category['_link'] . '&nbsp;(' . $category['_count'] . ')' . '</span>';
			}
			$this->navigationHTML .= join(', ', $categoryNavigationContent);
			$this->navigationHTML .= '</div>';
		}

		private function createExpandedExamplesHTML() {
			ob_start();
			
			#echo '<h1>Selected Examples</h1>';
			
			$headlineSize = 1;
			foreach ($this->expandedExamples as $example) {
				
				$svnSrcUrl = $this->svnSrcUrl;
				$svnBrowseUrl = $this->svnBrowseUrl;
				
				// listings

				$listings = array();
				if ($example['url']) {
					$urls = preg_split('/,\s+/', $example['url']);
					foreach ($urls as $url) {
						$fileName = preg_replace('/.+\\//', '', $url);
						$host = $this->svnCodeUrl ? $this->svnCodeUrl : $this->svnSrcUrl;
						$listings[] = array($fileName, $url, file_get_contents($host . $url));
					}
				}
				
				// swf
				
				if ($example['swf']) {
					$swf = preg_split('/\s+/', $example['swf']);
				}
				
				include('sibirjak_show_example.inc.php');
			}
			
			echo '<h1>All Examples</h1>';
						
			$this->expandedExamplesHTML = ob_get_contents();
			
			
			
			ob_clean();
		}

		private function parseExamples() {
			
			// init repository

			$this->post->post_content = preg_replace_callback(
				"/  \[SVN  .*?  src_url=\"  (.*?)  \"  .*?  browse_url=\"  (.*?)  \"  .*? (?:code_url=\"  (.*?)  \"  .*?)?  \/\] /sx",
			array($this, 'replaceSVNTagCallback'),
				$this->post->post_content
			);
			
			// init categories
			
			$this->post->post_content = preg_replace_callback(
				"/  \[Category  .*?  slug=\"  (.*?)  \"  .*?  title=\"  (.*?)  \"  .*?  \/\] /sx",
				array($this, 'replaceCategoryTagCallback'),
				$this->post->post_content
			);
			
			// init examples
			
			preg_match_all(
				"/  \[Example  (.*?)  \/\] /sx",
				$this->post->post_content,
				$exampleBlocks
			);
			
			$numExamples = sizeof($exampleBlocks[0]);

			for ($i = 0; $i < $numExamples; $i++) {
				preg_match_all(
					"/  (\w+)  =   \"   (.*?)  \"  /sx",
					$exampleBlocks[1][$i],
					$exampleBlock 
				);
				
				$currentExample = array(
					'title' => '',
					'slug' => '',
					'description' => '',
					'url' => '',
					'swf' => '',
					'related' => '',
					'categories' => '',
					'_url' => '',
					'_related_examples' => '',
					'_categories' => '',
					'_category_slugs' => '' // store slug to easliy test if they are currently selected
				);

				// read example attributes
			
				$numAttributes = sizeof($exampleBlock[0]);
				for ($j = 0; $j < $numAttributes; $j++) {
					$currentExample[$exampleBlock[1][$j]] = $exampleBlock[2][$j];
				}
				
				// example url and categories
				
				$currentExample['_url'] = get_permalink($this->post->ID) . $currentExample['slug'] . '/';
				
				if ($currentExample['categories']) {
					$categories = split(', ', $currentExample['categories']);
					$categoryContent = array();
					foreach ($categories as $categorySlug) {
						if ($this->categories[$categorySlug]) {
							$categoryHTML = $this->categories[$categorySlug]['_link'];
							$this->categories[$categorySlug]['_count']++;
						} else {
							$categoryHTML = '<span style="color:#CC0000";>' . $categorySlug . '</span>';
						}
						$currentExample['_category_slugs'] .= $categorySlug . ' ';
						$categoryContent[] = $categoryHTML;
					}
					$currentExample['_categories'] = join(', ', $categoryContent);
				}
				
				// store all examples
				
				$this->examples[$currentExample['slug']] = $currentExample;
			}
			
			// parse related examples
			// check if the examples should be expanded
			
			foreach ($this->examples as $slug => &$currentExample) { // use reference to change the array contents and not a copy

				// calculate related examples
				
				if ($currentExample['related']) {
					$relatedExamples = split(', ', $currentExample['related']);
					$relatedExamplesContent = array();
					foreach ($relatedExamples as $relatedExampleSlug) {
						if ($this->examples[$relatedExampleSlug]) {
							$relatedExampleTitle = $this->examples[$relatedExampleSlug]['title'];
							$relatedExampleTitle = preg_replace("/\s*-.*$/", '', $relatedExampleTitle);
							$relatedExampleTitle = trim(preg_replace("/\(.*?\)/", '', $relatedExampleTitle));
							$relatedExampleHTML = '<a href="' . get_permalink($this->post->ID) . $relatedExampleSlug . '" title="' . $this->examples[$relatedExampleSlug]['title'] . '">' . $relatedExampleTitle . '</a>';
						} else {
							$relatedExampleHTML = '<span style="color:#CC0000";>' . $relatedExampleSlug . '</span>';
						}
						$relatedExamplesContent[] = $relatedExampleHTML;
					}
					$currentExample['_related_examples'] = join(', ', $relatedExamplesContent);
				}
				
				// store expanded examples
				
				if (get_query_var('example') == $currentExample['slug']) {
					$currentExample['_css'] = 'current_page_item';
					$this->expandedExamples[] = $currentExample;
	
				} else if (get_query_var('example_category') && preg_match(
					"/\b(" . get_query_var('example_category') . ")\b/",
					$currentExample['_category_slugs'],
					$result
				)) {
					$currentExample['_css'] = 'current_page_item';
					$this->expandedExamples[] = $currentExample;
				}
			
			}
		
		}

		private function replaceCategoryTagCallback($result) {
			$categorySlug = $result[1];
			$categoryTitle = $result[2];
			$categoryLink = '<a href="' . get_permalink($this->post->ID) . 'category/' . $categorySlug . '/" title="Category ' . $categoryTitle . '">' . $categoryTitle . '</a>';
			
			$category = array(
				'title' => $categoryTitle,
				'slug' => $categorySlug,
				'_link' => $categoryLink,
				'_count' => 0
			);
			
			$this->categories[$categorySlug] = $category;
			return '';
		}

		private function replaceSVNTagCallback($result) {
			$this->svnSrcUrl = $result[1];
			$this->svnBrowseUrl = $result[2];
			$this->svnCodeUrl = $result[3];
			return '';
		}

	}

<?php

	class DownloadButton {
		
		var $project_page_id;
		var $category_id;
		
		var $projectKey;
		var $projectConfig;

		static $instance;

		static function getInstance() {
			if (self::$instance == null) {
				self::$instance = new DownloadButton();
			}
			return self::$instance;
		}
		
		function DownloadButton() {
			include('sibirjak_download_button_config.inc.php');
			
			if (is_page()) {
				global $wp_query;
				$page = get_post($wp_query->get_queried_object_id());
				$pageId = $page->ID;
				if (sizeof($page->ancestors) > 1) {
					$page = get_post($page->ancestors[sizeof($page->ancestors) - 2]);
				}
				
				// do not place button on the download page
				if ($project_pages[$page->ID]) {
					$projectConfig = $projects[$project_pages[$page->ID]];
					if ($projectConfig['download_page_id'] == $pageId) return;
				}
				
				$this->project_page_id = $page->ID;
	
			} else if (is_single() || is_category()) {
				$categories = get_the_category();
				$this->category_id = $categories[0]->cat_ID;
			}

			if ($this->project_page_id) {
				$this->projectKey = $project_pages[$this->project_page_id];
				if (!$this->projectKey) return;
				$this->projectConfig = $projects[$this->projectKey];

			} else if ($this->category_id) {
				$this->projectKey = $blog_categories[$this->category_id];
				if (!$this->projectKey) return;
				$this->projectConfig = $projects[$this->projectKey];
			}
			
		}
	
		function hasButton() {
			return $this->projectConfig != null;
		}

		function buttonHTML() {
			if (!$this->hasButton()) return;
			
			ob_start();
		
			?>
			<div id="download_button">
				<a href="<?php echo get_permalink($this->projectConfig['download_page_id']); ?>"><?php echo $this->projectKey; ?> <?php echo $this->projectConfig['version']; ?></a>
			</div>
			<?php
			
			$buttonHTML = ob_get_contents();
			ob_clean();
			return $buttonHTML;
		}
	
	}
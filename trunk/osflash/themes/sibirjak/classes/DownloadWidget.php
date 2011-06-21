<?php

	class DownloadWidget {

		var $post;
		var $downloads;
		var $currentDir;
		
		static $instance;

		static function getInstance() {
			if (self::$instance == null) {
				self::$instance = new DownloadWidget();
			}
			return self::$instance;
		}
	
		function DownloadWidget($post) {
			$this->post = $post;
			$this->downloads = array();

			global $wpdb;
			$sql = "SELECT * FROM wp_sdmon_downloads";
			$results = $wpdb->get_results($sql, ARRAY_N);
			if (is_array($results)) {
				foreach ($results as $row) {
					$this->downloads[$row[1]] = $row[2];
				}
			}
			
			$this->post->post_content = preg_replace_callback(
				"/  \[Downloads  .*?  category=\"(.+?)\"  .*?  \] (.*?)  \[\/Downloads\]  /sx",
				array($this, 'replace_download_tag'),
				$this->post->post_content
			);
		}

		private function replace_download_tag($result) {
			$this->currentDir = $result[1];
			
			$projectHTML = $this->parseCategory($result[2], "Current");
			$projectHTML .= $this->parseCategory($result[2], "Old");
			
			if (!trim($projectHTML)) return "";

			return $projectHTML;
		}
		
		private function parseCategory($result, $category) {
			
			$downloads = preg_match(
				"/  \[$category\]  (.*?)  \[\/$category\]  /sx",
				$result,
				$match
			);
			
			if ($match[0]) {
				$downloadsHTML = $this->parse_downloads($match[1]);
				if (!trim($downloadsHTML) || $downloadsHTML == "") {
					return "";
				}
				
				if ($category == "Old") {
					$categoryHTML = '<a href="javascript:showHide(\'older_' . $this->currentDir . '\');">Older Versions</a>';
					$categoryHTML .= '<div class="download_category_old" id="older_' . $this->currentDir . '">';
				} else {
					$categoryHTML .= '<div class="download_category">';
				}
				
				$categoryHTML .= $downloadsHTML;
				
				if ($category == "Old") {
				}
				$categoryHTML .= '</div>';
			
			}
			
			return $categoryHTML;
		}

		private function parse_downloads($result) {
			$downLoadHTML = preg_replace_callback(
				"/  \[Download  .*?  file=\"(.+?)\"  .*?  date=\"(.+?)\"  .*?  description=\"(.*?)\"  .*?  \/\]  /sx",
				array($this, 'replace_downloads'),
				$result
			);
			
			return $downLoadHTML;
		}

		private function replace_downloads($result) {
			
			$file = 'wp-content/uploads/downloads/' . $this->currentDir . '/' . $result[1];
			
			$download = '';
			
			if (file_exists($file)) {
				
				$size = filesize($file) / 1024;
				if ($size > 1000) $size = round(($size) / 1024, 1) . ' MB';
				else $size = round($size) . ' KB';
				
				$downloads = $this->downloads[$file];
				if (!$downloads) $downloads = 0;
				
				$url = get_bloginfo("url") . '/downloads/' . $this->currentDir . '/' . $result[1];
	
				$download .= '<div class="download"><a href="' . $url . '">' . $result[1] . '</a></div>';
				if ($result[3]) $download .= '<div class="download_description">' . $result[3] . '</div>';
				$download .= '<div class="download_meta">Date: ' . $result[2] . ' | Size: ' . $size . ' | Downloads: ' . $downloads . '</div>';
				
			} else {
				$download .= '<div class="download_error"><a href="' . $url . '">' . $result[1] . '</a></div>';
			}
			
			return $download;
		}
	
	}
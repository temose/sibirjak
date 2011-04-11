<?php
	class ArticleNavigation {
	
		var $list = "";

		var $includeTopLink = true;
		var $includeCommentsLink = true;
		var $includeReplyLink = true;
		var $includeBottomLink = true;
		var $shortTitles = false;
		
		var $itemCounter = 0;
		var $currentLevel = 0;
		var $currentLevelWeight = 0;
		var $levelCounter;
		var $numSections = 0;
		
		var $listTop = array();
		var $listContent = array();
		var $listComments = array();
		var $listReply = array();
		var $listBottom = array();
		
		static $instance;

		static function createInstance($post) {
			if (self::$instance == null) {
				self::$instance = new ArticleNavigation($post);
			}
		}

		static function getInstance() {
			if (!self::$instance) return null;
			
			self::$instance->includeTopLink = true;
			self::$instance->includeCommentsLink = true;
			self::$instance->includeReplyLink = true;
			self::$instance->includeBottomLink = true;
			self::$instance->shortTitles = false;
			
			return self::$instance;
		}

		function ArticleNavigation($post) {
			$this->levelCounter = array();
			$this->levelCounter[0] = 0;

			// TOP

			array_push($this->listTop, 'LI', '', '');
			array_push($this->listTop, 'top', '', 'Top');
			array_push($this->listTop, '/LI', '', '');
			
			// CONTENT
			
			if (is_singular()) {

				// ARTICLE
				
				$post->post_content = preg_replace_callback(
					"/  <h([12])([^>]*?)>   (.*?)   <\/h\d>  /x",
					array($this, 'replaceCallback'),
					$post->post_content
				);
				$this->closeLists(1);
				
				if ($post->comment_count) {
					
					// COMMENTS
					
					array_push($this->listComments, 'LI', '', '');
					array_push($this->listComments, 'comments', '', 'Comments (' . $post->comment_count . ')');
					array_push($this->listComments, '/LI', '', '');
				}
				
				if (comments_open()) {

					// REPLY
					
					array_push($this->listReply, 'LI', '', '');
					array_push($this->listReply, 'respond', '', 'Leave a Comment');
					array_push($this->listReply, '/LI', '', '');
				}
			}
						
			// BOTTOM
			
			array_push($this->listBottom, 'LI', '', '');
			array_push($this->listBottom, 'bottom', '', 'Bottom');
			array_push($this->listBottom, '/LI', '', '');
		
			#echo "<pre>";
			#print_r(htmlentities($this->getNavigation(), ENT_QUOTES, 'UTF-8'));
			#exit;
		
		}
	
		function size() {
			return $this->numSections;
			return sizeof($this->listContent);
		}

		function getNavigation() {
			$navigation = '<ol>' . "\n";

			if ($this->includeTopLink) $navigation .= $this->listToString($this->listTop);
			$navigation .= $this->listToString($this->listContent);
			if ($this->includeCommentsLink) $navigation .= $this->listToString($this->listComments);
			if ($this->includeReplyLink) $navigation .= $this->listToString($this->listReply);
			if ($this->includeBottomLink) $navigation .= $this->listToString($this->listBottom);
			
			$navigation .= '</ol>' . "\n";
			return $navigation;
		}
		
		function listToString($list) {
			$size = sizeof($list);
			$string = '';
			for ($i = 0; $i < $size; $i+=3) {
				if ($list[$i] == 'LI') $string .= "<li>\n";
				else if ($list[$i] == 'OL') $string .= "<ol>\n";
				else if ($list[$i] == '/OL') $string .= "</ol>\n";
				else if ($list[$i] == '/LI') $string .= "</li>\n";
				else $string .= $this->getListItem($list[$i], $list[$i + 1], $list[$i + 2]);
			}
			return $string;
		}
		
		function replaceCallback($result) {
			
			if (!$this->currentLevelWeight) { // first headline
				$this->currentLevel = 0;
				$this->levelCounter[0]++;
				
			} else { // subsequent headline
				if ($result[1] > $this->currentLevelWeight) { // secondary headline
					array_push($this->listContent, 'OL', '', '');
					$this->currentLevel++;
					$this->levelCounter[$this->currentLevel] = 1;

				} else if ($result[1] == $this->currentLevelWeight) { // headline of same level
					array_push($this->listContent, '/LI', '', '');
					$this->levelCounter[$this->currentLevel]++;
					
				} else { // higher level headline
					$this->closeLists($result[1]);
					$this->levelCounter[$this->currentLevel]++;
				}
			}
			
			$this->currentLevelWeight = $result[1];
			
			$plainTitle = strip_tags($result[3]);
			$plainTitle = preg_replace("/\[.*?\]/", '', $plainTitle);
			
			$anchor = $this->titleToAnchor($plainTitle);
			$ord = $this->getOrd();
			
			if ($this->currentLevel < 10) {
				array_push($this->listContent, 'LI', '', '');
				array_push($this->listContent, $anchor, $ord, $plainTitle);
				$this->numSections++;
			}
			
			$hAttributes = preg_replace("/id=\".*?\"/", '', $result[2]);
			return '<h' . $result[1] . ' ' . $hAttributes . ' id="' . $anchor . '">' . $result[3] . '</h' . $result[1] . '>';
		}
		
		function closeLists($toLevelWeight) {
			$diff = $this->currentLevelWeight - $toLevelWeight;
			$size = sizeof($this->levelCounter) - 1;
			while ($size > 0 && $diff > 0) {
				array_push($this->listContent, '/LI', '', '');
				array_push($this->listContent, '/OL', '', '');
				unset($this->levelCounter[$size]);
				$size--;
				$diff--;
				$this->currentLevel--;
			}
			array_push($this->listContent, '/LI', '', '');
		}

		function getOrd() {
			$ord = '';
			$size = sizeof($this->levelCounter) - 1;
			while ($size > -1) {
				$ord = $this->levelCounter[$size] . '.' . $ord;
				$size--;
			}
			return $ord;
		}

		function titleToAnchor($title) {
			$title = mb_strtolower($title);
			
			$title = str_replace('ä', 'ae', $title);
			$title = str_replace('ö', 'oe', $title);
			$title = str_replace('ü', 'ue', $title);
			$title = str_replace('ß', 'ss', $title);

			$title = preg_replace("/[^\w\s]/", "", $title); // remove all special chars
			$title = preg_replace("/\s+/", "-", $title);
			$title = preg_replace("/^-+|-+$/", "", $title); // leading -

			return 'a' . ++$this->itemCounter . '-' . $title;
		}

		function getListItem($anchor, $ord, $title) {
			$class = $ord ? '' : ' class="meta-link"';
			if ($this->shortTitles) $title = sibirjak_get_short_title($title, 30);
//			return '<li' . $class . '><a href="#' . $anchor . '" title="Go to ' . $title . '">' . $ord . ' ' . sibirjak_get_short_title($title, 40) . '</a></li>' . "\n";
//			return '<li' . $class . '><a href="#' . $anchor . '" title="' . $title . '">' . $title . '</a></li>' . "\n";
			return '<a href="#' . $anchor . '" title="' . $title . '"' . $class . '>' . $title . '</a>' . "\n";
		}
		
	}
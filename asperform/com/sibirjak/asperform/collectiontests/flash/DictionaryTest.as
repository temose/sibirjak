package com.sibirjak.asperform.collectiontests.flash {
	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	import flash.utils.Dictionary;

	/**
	 * @author jes 25.03.2010
	 */
	public class DictionaryTest extends CollectionTestCase {

		private var _dictionary : Dictionary;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_dictionary = new Dictionary();
			return _dictionary;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_dictionary[_data[i]] = _data[i];
			}
		}

		override protected function get size() : uint {
			var size : uint = 0;
			for (var key : * in _dictionary) {
				key;
				size++;
			}
			return size;
		}

		/*
		 * Tests
		 */

		public function test_create() : void {
			for (var i : uint = 0; i < iterations; i++) {
				_dictionary = new Dictionary();
			}
		}

		public function test_add() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_dictionary[_data[i]] = _data[i];
			}
		}

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				for each (var item : * in _dictionary) {
					if (item === _data[i]) break;
				}
			}
		}

		public function test_iterate() : void {
			for (var i : uint = 0; i < iterations; i++) {
				for (var key : * in _dictionary) {
					_dictionary[key];
				}
			}
		}

		public function test_remove() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				for (var key : * in _dictionary) {
					if (_dictionary[key] === _data[i]) {
						delete _dictionary[key];
						break;
					}
				}
			}
		}

	}
}

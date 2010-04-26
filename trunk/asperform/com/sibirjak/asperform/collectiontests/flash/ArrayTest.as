package com.sibirjak.asperform.collectiontests.flash {
	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	/**
	 * @author jes 25.03.2010
	 */
	public class ArrayTest extends CollectionTestCase {

		private var _array : Array;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_array = new Array();
			return _array;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_array.push(_data[i]);
			}
		}

		override protected function get size() : uint {
			return _array.length;
		}

		/*
		 * Tests
		 */

		public function test_create() : void {
			for (var i : uint = 0; i < iterations; i++) {
				_array = new Array();
			}
		}

		public function test_add() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_array.push(_data[i]);
			}
		}

		public function test_addFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_array.unshift(_data[i]);
			}
		}

		public function test_addLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_array.push(_data[i]);
			}
		}

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_array.indexOf(_data[i]) > -1;
			}
		}

		public function test_iterate() : void {
			for (var i : uint = 0; i < iterations; i++) {
				for (var j : uint = 0; j < _array.length; j++) {
					_array[j];
				}
			}
		}

		public function test_remove() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				var index : int = _array.indexOf(_data[i]);
				_array.splice(index, 1);
			}
		}

		public function test_removeFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_array.shift();
			}
		}

		public function test_removeLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_array.pop();
			}
		}

		public function test_sorted() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_array.push(_data[i]);
				_array.sort();
			}
		}

	}
}

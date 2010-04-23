package com.sibirjak.asperform.collectiontests.as3collections {
	import as3.collections.Set;
	import as3.collections.iterators.IIterator;

	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	/**
	 * @author jes 25.03.2010
	 */
	public class AS3CollectionsSetTest extends CollectionTestCase {

		private var _set : Set;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_set = new Set();
			return _set;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.addItem(_data[i]);
			}
		}

		override protected function get size() : uint {
			return _set.numItems;
		}

		/*
		 * Tests
		 */

		public function test_create() : void {
			for (var i : uint = 0; i < iterations; i++) {
				_set = new Set();
			}
		}

		public function test_add() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.addItem(_data[i]);
			}
		}

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.hasItem(_data[i]);
			}
		}

		public function test_iterate() : void {
			for (var i : uint = 0; i < iterations; i++) {
				var iterator : IIterator = _set.getIterator();
				while (iterator.hasNext()) {
					iterator.getNext();
				}
			}
		}

		public function test_remove() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.removeItem(_data[i]);
			}
		}

	}
}

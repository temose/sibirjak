package com.sibirjak.asperform.collectiontests.as3collections {
	import as3.collections.ArrayList;
	import as3.collections.iterators.IIterator;

	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	/**
	 * @author jes 25.03.2010
	 */
	public class AS3CollectionsArrayListTest extends CollectionTestCase {

		private var _list : ArrayList;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_list = new ArrayList();
			return _list;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.addItem(_data[i]);
			}
		}

		override protected function get size() : uint {
			return _list.numItems;
		}

		/*
		 * Tests
		 */

		public function test_create() : void {
			for (var i : uint = 0; i < iterations; i++) {
				_list = new ArrayList();
			}
		}

		public function test_add() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.addItem(_data[i]);
			}
		}

		public function test_addFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.addItemAtStart(_data[i]);
			}
		}

		public function test_addLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.addItemAtEnd(_data[i]);
			}
		}

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.hasItem(_data[i]);
			}
		}

		public function test_iterate() : void {
			for (var i : uint = 0; i < iterations; i++) {
				var iterator : IIterator = _list.getIterator();
				while (iterator.hasNext()) {
					iterator.getNext();
				}
			}
		}

		public function test_remove() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.removeItem(_data[i]);
			}
		}

		public function test_removeFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.removeFirstItem();
			}
		}

		public function test_removeLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.removeLastItem();
			}
		}

	}
}

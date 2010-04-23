package com.sibirjak.asperform.collectiontests.as3collections {
	import as3.collections.LinkedMap;
	import as3.collections.iterators.IIterator;

	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	/**
	 * @author jes 25.03.2010
	 */
	public class AS3CollectionsLinkedMapTest extends CollectionTestCase {

		private var _map : LinkedMap;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_map = new LinkedMap();
			return _map;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.addItem(_data[i], _data[i]);
			}
		}

		override protected function get size() : uint {
			return _map.numItems;
		}

		/*
		 * Tests
		 */

		public function test_create() : void {
			for (var i : uint = 0; i < iterations; i++) {
				_map = new LinkedMap();
			}
		}

		public function test_add() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.addItem(_data[i], _data[i]);
			}
		}

		public function test_addFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.addItemAtStart(_data[i], _data[i]);
			}
		}

		public function test_addLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.addItemAtEnd(_data[i], _data[i]);
			}
		}

		public function test_hasKey() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.hasKey(_data[i]);
			}
		}

		public function test_iterate() : void {
			for (var i : uint = 0; i < iterations; i++) {
				var iterator : IIterator = _map.getIterator();
				while (iterator.hasNext()) {
					iterator.getNext();
				}
			}
		}

		public function test_removeFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.removeFirstItem();
			}
		}

		public function test_removeLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.removeLastItem();
			}
		}

		public function test_removeKey() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.removeKey(_data[i]);
			}
		}

	}
}

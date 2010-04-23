package com.sibirjak.asperform.collectiontests.polygonal {
	import de.polygonal.ds.DLinkedList;
	import de.polygonal.ds.Iterator;

	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	/**
	 * @author jes 25.03.2010
	 */
	public class PolygonalLinkedListTest extends CollectionTestCase {

		private var _list : DLinkedList;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_list = new DLinkedList();
			return _list;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.append(_data[i]);
			}
		}

		override protected function get size() : uint {
			return _list.size;
		}
		
		/*
		 * Tests
		 */

		public function test_create() : void {
			for (var i : uint = 0; i < iterations; i++) {
				_list = new DLinkedList();
			}
		}

		public function test_add() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.append(_data[i]);
			}
		}

		public function test_addFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.prepend(_data[i]);
			}
		}

		public function test_addLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.append(_data[i]);
			}
		}

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.contains(_data[i]);
			}
		}

		public function test_iterate() : void {
			for (var i : uint = 0; i < iterations; i++) {
				var iterator : Iterator = _list.getIterator();
				while (iterator.hasNext()) {
					iterator.next();
				}
			}
		}

		public function test_removeFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.removeHead();
			}
		}

		public function test_removeLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.removeTail();
			}
		}

	}
}

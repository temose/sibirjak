package com.sibirjak.asperform.collectiontests.as3commons {
	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	import org.as3commons.collections.SortedList;
	import org.as3commons.collections.framework.IIterator;

	/**
	 * @author jes 25.03.2010
	 */
	public class AS3CommonsSortedListTest2 extends CollectionTestCase {

		private var _list : SortedList;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_list = new SortedList(new TestComparator());
			return _list;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.add(_data[i]);
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
				_list = new SortedList(new TestComparator());
			}
		}

		public function test_add() : void {
			var array : Array = new Array();
			for (var i : uint = 0; i < _numItems; i++) {
				array.push(_data[i]);
			}
			_list.array = array;
		}

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.has(_data[i]);
			}
		}

		public function test_iterate() : void {
			for (var i : uint = 0; i < iterations; i++) {
				var iterator : IIterator = _list.iterator();
				while (iterator.hasNext()) {
					iterator.next();
				}
			}
		}

		public function test_remove() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.remove(_data[i]);
			}
		}

		public function test_removeFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.removeFirst();
			}
		}

		public function test_removeLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.removeLast();
			}
		}

	}
}

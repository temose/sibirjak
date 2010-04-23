package com.sibirjak.asperform.collectiontests.dpdk {
	import nl.dpdk.collections.iteration.IIterator;
	import nl.dpdk.collections.lists.OrderedList;

	import com.sibirjak.asperform.collectiontests.CollectionTestCase;
	import com.sibirjak.asperform.collectiontests.as3commons.TestComparator;

	/**
	 * @author jes 25.03.2010
	 */
	public class DpdkOrderedListTest extends CollectionTestCase {

		private var _list : OrderedList;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_list = new OrderedList((new TestComparator()).compare);
			return _list;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.add(_data[i]);
			}
		}

		override protected function get size() : uint {
			return _list.size();
		}
		
		/*
		 * Tests
		 */

		public function test_create() : void {
			for (var i : uint = 0; i < iterations; i++) {
				_list = new OrderedList((new TestComparator()).compare);
			}
		}

		public function test_add() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.add(_data[i]);
			}
		}

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.contains(_data[i]);
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
				_list.removeAt(0);
			}
		}

		public function test_removeLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.removeMaximum();
			}
		}

	}
}

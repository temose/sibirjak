package com.sibirjak.asperform.collectiontests.dpdk {
	import nl.dpdk.collections.iteration.IIterator;
	import nl.dpdk.collections.lists.Heap;

	import com.sibirjak.asperform.collectiontests.CollectionTestCase;
	import com.sibirjak.asperform.collectiontests.as3commons.TestComparator;

	/**
	 * @author jes 25.03.2010
	 */
	public class DpdkPriorityQueueTest extends CollectionTestCase {

		private var _heap : Heap;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_heap = new Heap((new TestComparator()).compare);
			return _heap;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_heap.add(_data[i]);
			}
		}

		override protected function get size() : uint {
			return _heap.size();
		}
		
		/*
		 * Tests
		 */

		public function test_create() : void {
			for (var i : uint = 0; i < iterations; i++) {
				_heap = new Heap((new TestComparator()).compare);
			}
		}

		public function test_add() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_heap.add(_data[i]);
			}
		}

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_heap.contains(_data[i]);
			}
		}

		public function test_iterate() : void {
			for (var i : uint = 0; i < iterations; i++) {
				var iterator : IIterator = _heap.iterator();
				while (iterator.hasNext()) {
					iterator.next();
				}
			}
		}

		public function test_removeFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_heap.removeMaximum();
			}
		}

	}
}

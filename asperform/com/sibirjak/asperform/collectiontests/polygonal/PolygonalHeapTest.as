package com.sibirjak.asperform.collectiontests.polygonal {
	import de.polygonal.ds.Heap;
	import de.polygonal.ds.Iterator;

	import com.sibirjak.asperform.collectiontests.CollectionTestCase;
	import com.sibirjak.asperform.collectiontests.as3commons.TestComparator;

	/**
	 * @author jes 25.03.2010
	 */
	public class PolygonalHeapTest extends CollectionTestCase {

		private var _heap : Heap;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_heap = new Heap(_numItems, (new TestComparator()).compare);
			return _heap;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_heap.enqueue(_data[i]);
			}
		}

		override protected function get size() : uint {
			return _heap.size;
		}
		
		/*
		 * Tests
		 */

		public function test_create() : void {
			for (var i : uint = 0; i < iterations; i++) {
				_heap = new Heap(_numItems, (new TestComparator()).compare);
			}
		}

		public function test_add() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_heap.enqueue(_data[i]);
			}
		}

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_heap.contains(_data[i]);
			}
		}

		public function test_first() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_heap.front;
			}
		}

		public function test_iterate() : void {
			for (var i : uint = 0; i < iterations; i++) {
				var iterator : Iterator = _heap.getIterator();
				while (iterator.hasNext()) {
					iterator.next();
				}
			}
		}

		public function test_removeFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_heap.dequeue();
			}
		}
	}
}

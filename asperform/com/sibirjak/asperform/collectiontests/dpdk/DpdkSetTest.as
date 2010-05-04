package com.sibirjak.asperform.collectiontests.dpdk {
	import nl.dpdk.collections.iteration.IIterator;
	import nl.dpdk.collections.sets.Set;

	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	/**
	 * @author jes 25.03.2010
	 */
	public class DpdkSetTest extends CollectionTestCase {

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
				_set.add(_data[i]);
			}
		}

		override protected function get size() : uint {
			return _set.size();
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
			_set = new Set();
			for (var i : uint = 0; i < _numItems; i++) {
				_set.add(_data[i]);
			}
		}

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.contains(_data[i]);
			}
		}

		public function test_iterate() : void {
			for (var i : uint = 0; i < iterations; i++) {
				var iterator : IIterator = _set.iterator();
				while (iterator.hasNext()) {
					iterator.next();
				}
			}
		}

		public function test_remove() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.remove(_data[i]);
			}
		}

	}
}

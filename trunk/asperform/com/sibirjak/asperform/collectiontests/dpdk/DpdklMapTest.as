package com.sibirjak.asperform.collectiontests.dpdk {
	import nl.dpdk.collections.dictionary.HashMap;
	import nl.dpdk.collections.iteration.IIterator;

	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	/**
	 * @author jes 25.03.2010
	 */
	public class DpdklMapTest extends CollectionTestCase {

		private var _map : HashMap;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_map = new HashMap(_numItems);
			return _map;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.insert(_data[i], _data[i]);
			}
		}

		override protected function get size() : uint {
			return _map.size();
		}

		/*
		 * Tests
		 */

		public function test_create() : void {
			for (var i : uint = 0; i < iterations; i++) {
				_map = new HashMap();
			}
		}

		public function test_add() : void {
			_map = new HashMap(_numItems);
			for (var i : uint = 0; i < _numItems; i++) {
				_map.insert(_data[i], _data[i]);
			}
		}

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.contains(_data[i]);
			}
		}

		public function test_hasKey() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.search(_data[i]);
			}
		}

		public function test_iterate() : void {
			for (var i : uint = 0; i < iterations; i++) {
				var iterator : IIterator = _map.iterator();
				while (iterator.hasNext()) {
					iterator.next();
				}
			}
		}

		public function test_removeKey() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.remove(_data[i]);
			}
		}

	}
}

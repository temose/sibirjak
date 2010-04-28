package com.sibirjak.asperform.collectiontests.examples.map {
	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	/**
	 * @author Jens Struwe 29.04.2010
	 */
	public class OrderedMapRawTest extends CollectionTestCase {

		private var _map : OrderedMapRaw;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_map = new OrderedMapRaw();
			return _map;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.addLast(_data[i], _data[i]);
			}
		}

		override protected function get size() : uint {
			return _map.size;
		}

		/*
		 * Tests
		 */

		public function test_addFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.addFirst(_data[i], _data[i]);
			}
		}

		public function test_addLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.addLast(_data[i], _data[i]);
			}
		}

		public function test_hasKey() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.hasKey(_data[i]);
			}
		}

		public function test_removeKey() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.removeKey(_data[i]);
			}
		}

		public function test_removeFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.removeFirst();
			}
		}

		public function test_removeLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.removeFirst();
			}
		}

	}
}

package com.sibirjak.asperform.collectiontests.examples.map {
	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	/**
	 * @author Jens Struwe 28.04.2010
	 */
	public class MapRawTest extends CollectionTestCase {

		private var _map : MapRaw;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_map = new MapRaw();
			return _map;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.add(_data[i], _data[i]);
			}
		}

		override protected function get size() : uint {
			return _map.size;
		}

		/*
		 * Tests
		 */

		public function test_add() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.add(_data[i], _data[i]);
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

	}
}

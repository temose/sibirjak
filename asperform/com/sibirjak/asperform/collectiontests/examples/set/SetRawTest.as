package com.sibirjak.asperform.collectiontests.examples.set {
	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	/**
	 * @author Jens Struwe 29.04.2010
	 */
	public class SetRawTest extends CollectionTestCase {

		private var _set : SetRaw;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_set = new SetRaw();
			return _set;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.add(_data[i]);
			}
		}

		override protected function get size() : uint {
			return _set.size;
		}

		/*
		 * Tests
		 */

		public function test_add() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.add(_data[i]);
			}
		}

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.has(_data[i]);
			}
		}

		public function test_remove() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.remove(_data[i]);
			}
		}

	}
}

package com.sibirjak.asperform.collectiontests.examples.set {
	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	/**
	 * @author Jens Struwe 29.04.2010
	 */
	public class OrderedSetRawTest extends CollectionTestCase {

		private var _set : OrderedSetRaw;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_set = new OrderedSetRaw();
			return _set;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.addLast(_data[i]);
			}
		}

		override protected function get size() : uint {
			return _set.size;
		}

		/*
		 * Tests
		 */

		public function test_addFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.addFirst(_data[i]);
			}
		}

		public function test_addLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.addLast(_data[i]);
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

		public function test_removeFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.removeFirst();
			}
		}

		public function test_removeLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.removeFirst();
			}
		}

	}
}

package com.sibirjak.asperform.collectiontests.as3commons {
	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	import org.as3commons.collections.LinkedSet;
	import org.as3commons.collections.framework.IIterator;

	/**
	 * @author jes 25.03.2010
	 */
	public class AS3CommonsLinkedSetTest extends CollectionTestCase {

		protected var _set : LinkedSet;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_set = new LinkedSet();
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

		public function test_create() : void {
			for (var i : uint = 0; i < iterations; i++) {
				_set = new LinkedSet();
			}
		}

		public function test_add() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.add(_data[i]);
			}
		}

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

		public function test_removeFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.removeFirst();
			}
		}

		public function test_removeLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_set.removeLast();
			}
		}

	}
}

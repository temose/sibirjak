package com.sibirjak.asperform.collectiontests.as3commons {
	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	import org.as3commons.collections.SortedSet;
	import org.as3commons.collections.framework.IIterator;

	/**
	 * @author jes 25.03.2010
	 */
	public class AS3CommonsSortedSetTest extends CollectionTestCase {

		private var _set : SortedSet;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_set = new SortedSet(new TestComparator());
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
				_set = new SortedSet(new TestComparator());
			}
		}

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

package com.sibirjak.asperform.collectiontests.as3commons {
	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	import org.as3commons.collections.Treap;
	import org.as3commons.collections.framework.IIterator;

	/**
	 * @author jes 25.03.2010
	 */
	public class AS3CommonsTreapTest extends CollectionTestCase {

		private var _treap : Treap;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_treap = new Treap(new TestComparator());
			return _treap;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_treap.add(_data[i]);
			}
		}

		override protected function get size() : uint {
			return _treap.size;
		}

		/*
		 * Tests
		 */

		public function test_create() : void {
			for (var i : uint = 0; i < iterations; i++) {
				_treap = new Treap(new TestComparator());
			}
		}

		public function test_add() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_treap.add(_data[i]);
			}
		}

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_treap.has(_data[i]);
			}
		}

		public function test_iterate() : void {
			for (var i : uint = 0; i < iterations; i++) {
				var iterator : IIterator = _treap.iterator();
				while (iterator.hasNext()) {
					iterator.next();
				}
			}
		}

		public function test_remove() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_treap.remove(_data[i]);
			}
		}

		public function test_removeFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_treap.removeFirst();
			}
		}

		public function test_removeLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_treap.removeLast();
			}
		}

	}
}

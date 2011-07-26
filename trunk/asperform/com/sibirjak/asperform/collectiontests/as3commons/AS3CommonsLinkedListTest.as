package com.sibirjak.asperform.collectiontests.as3commons {

	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	import org.as3commons.collections.LinkedList;
	import org.as3commons.collections.framework.IIterator;
	import org.as3commons.collections.utils.NumericComparator;

	/**
	 * @author jes 25.03.2010
	 */
	public class AS3CommonsLinkedListTest extends CollectionTestCase {

		private var _list : LinkedList;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_list = new LinkedList();
			return _list;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.add(_data[i]);
			}
		}

		override protected function get size() : uint {
			return _list.size;
		}
		
		/*
		 * Tests
		 */

		public function test_create() : void {
			for (var i : uint = 0; i < iterations; i++) {
				_list = new LinkedList();
			}
		}

		public function test_add() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.add(_data[i]);
			}
		}

		public function test_addFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.addFirst(_data[i]);
			}
		}

		public function test_addLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.addLast(_data[i]);
			}
		}

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.has(_data[i]);
			}
		}

		public function test_iterate() : void {
			for (var i : uint = 0; i < iterations; i++) {
				var iterator : IIterator = _list.iterator();
				while (iterator.hasNext()) {
					iterator.next();
				}
			}
		}

		public function test_remove() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.remove(_data[i]);
			}
		}

		public function test_removeFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.removeFirst();
			}
		}

		public function test_removeLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.removeLast();
			}
		}

		public function test_sort() : void {
			_list.sort(new NumericComparator());
		}

	}
}

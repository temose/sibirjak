package com.sibirjak.asperform.collectiontests.jacksondunstan {

	import org.as3commons.collections.utils.NumericComparator;
	import com.jacksondunstan.LinkedList;
	import com.jacksondunstan.LinkedListNode;
	import com.sibirjak.asperform.collectiontests.CollectionTestCase;


	/**
	 * @author jes 25.03.2010
	 */
	public class JDLinkedListTest extends CollectionTestCase {

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
				_list.push(_data[i]);
			}
		}

		override protected function get size() : uint {
			return _list.length;
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
				_list.push(_data[i]);
			}
		}

		public function test_addFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.unshift(_data[i]);
			}
		}

		public function test_addLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.push(_data[i]);
			}
		}

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.indexOf(_data[i]) != -1;
			}
		}

		public function test_iterate() : void {
			for (var i : uint = 0; i < iterations; i++) {
				for (var curNode : LinkedListNode = _list.head; curNode; curNode = curNode.next) {
                    curNode.data;
                }
			}
		}

//		public function test_remove() : void {
//			for (var i : uint = 0; i < _numItems; i++) {
//				_list.remove(_data[i]);
//			}
//		}

		public function test_removeFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.shift();
			}
		}

		public function test_removeLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.pop();
			}
		}

		public function test_sort() : void {
			_list.sort(new NumericComparator().compare);
		}

	}
}

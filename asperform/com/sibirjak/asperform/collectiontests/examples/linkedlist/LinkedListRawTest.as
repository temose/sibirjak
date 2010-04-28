package com.sibirjak.asperform.collectiontests.examples.linkedlist {
	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	/**
	 * @author Jens Struwe 28.04.2010
	 */
	public class LinkedListRawTest extends CollectionTestCase {

		private var _list : LinkedListRaw;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_list = new LinkedListRaw();
			return _list;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_list.addLast(_data[i]);
			}
		}

		override protected function get size() : uint {
			return _list.size;
		}
		
		/*
		 * Tests
		 */

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

	}
}

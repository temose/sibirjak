package com.sibirjak.asperform.collectiontests.as3commons {
	import com.sibirjak.asperform.collectiontests.CollectionTestCase;

	import org.as3commons.collections.LinkedMap;
	import org.as3commons.collections.framework.IIterator;

	/**
	 * @author jes 25.03.2010
	 */
	public class AS3CommonsLinkedMapTest extends CollectionTestCase {

		private var _map : LinkedMap;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_map = new LinkedMap();
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

		public function test_create() : void {
			for (var i : uint = 0; i < iterations; i++) {
				_map = new LinkedMap();
			}
		}

		public function test_add() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.add(_data[i], _data[i]);
			}
		}

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

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.has(_data[i]);
			}
		}

		public function test_hasKey() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.hasKey(_data[i]);
			}
		}

		public function test_iterate() : void {
			for (var i : uint = 0; i < iterations; i++) {
				var iterator : IIterator = _map.iterator();
				while (iterator.hasNext()) {
					iterator.next();
				}
			}
		}

		public function test_remove() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.remove(_data[i]);
			}
		}

		public function test_removeFirst() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.removeFirst();
			}
		}

		public function test_removeLast() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.removeLast();
			}
		}

		public function test_removeKey() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_map.removeKey(_data[i]);
			}
		}

	}
}

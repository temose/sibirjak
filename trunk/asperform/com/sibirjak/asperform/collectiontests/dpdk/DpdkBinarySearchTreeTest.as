package com.sibirjak.asperform.collectiontests.dpdk {
	import nl.dpdk.collections.iteration.IIterator;
	import nl.dpdk.collections.trees.BinarySearchTree;

	import com.sibirjak.asperform.collectiontests.CollectionTestCase;
	import com.sibirjak.asperform.collectiontests.as3commons.TestComparator;

	/**
	 * @author jes 25.03.2010
	 */
	public class DpdkBinarySearchTreeTest extends CollectionTestCase {

		private var _tree : BinarySearchTree;

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_tree = new BinarySearchTree((new TestComparator()).compare);
			return _tree;
		}

		override protected function fill() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_tree.add(_data[i]);
			}
		}

		override protected function get size() : uint {
			return _tree.size();
		}
		
		/*
		 * Tests
		 */

		public function test_create() : void {
			for (var i : uint = 0; i < iterations; i++) {
				_tree = new BinarySearchTree((new TestComparator()).compare);
			}
		}

		public function test_add() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_tree.add(_data[i]);
			}
		}

		public function test_has() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_tree.contains(_data[i]);
			}
		}

		public function test_iterate() : void {
			for (var i : uint = 0; i < iterations; i++) {
				var iterator : IIterator = _tree.iterator();
				while (iterator.hasNext()) {
					iterator.next();
				}
			}
		}

		public function test_remove() : void {
			for (var i : uint = 0; i < _numItems; i++) {
				_tree.remove(_data[i]);
			}
		}
	}
}

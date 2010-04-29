package com.sibirjak.asperform.collectiontests.examples.set {
	import flash.utils.Dictionary;

	public class OrderedSetRaw {

		public var map : Dictionary;
		public var stringMap : Object;
		public var first : Node;
		public var last : Node;
		public var size : uint;

		public function OrderedSetRaw() {
			map = new Dictionary();
			stringMap = new Object();
		}

		public function addFirst(item : *) : void {
			var node : Node = new Node(item, item);

			if (item is String) {
				if (stringMap[item] !== undefined) remove(item);
				stringMap[item] = node;
			} else {
				if (map[item] !== undefined) remove(item);
				map[item] = node;
			}

			if (first) {
				first.left = node;
				first.left.right = first;
				first = first.left;
			} else {
				first = last = node;
			}

			size++;
		}
		
		public function addLast(item : *) : void {
			var node : Node = new Node(item, item);

			if (item is String) {
				if (stringMap[item] !== undefined) remove(item);
				stringMap[item] = node;
			} else {
				if (map[item] !== undefined) remove(item);
				map[item] = node;
			}

			if (last) {
				last.right = node;
				last.right.left = last;
				last = last.right;
			} else {
				first = last = node;
			}

			size++;
		}
		
		public function has(item : *) : Boolean {
			if (item is String) {
				return stringMap[item] !== undefined;
			} else {
				return map[item] !== undefined;
			}
		}

		public function remove(item : *) : void {
			var node : Node;
			
			if (item is String) {
				if (stringMap[item] === undefined) return;
				node = stringMap[item];
				delete stringMap[item];
			} else {
				if (map[item] === undefined) return;
				node = map[item];
				delete map[item];
			}
			
			if (node.left) {
				node.left.right = node.right;
			} else { // has been the first
				first = node.right;
			}

			if (node.right) {
				node.right.left = node.left;
			} else { // has been the last
				last = node.left;
			}
			
			size--;
		}

		public function removeFirst() : void {
			if (!first) return;
			
			remove(first.data);
		}
	
		public function removeLast() : void {
			if (!last) return;
			
			remove(last.data);
		}

	}
}

internal class Node {
	public var left : Node;
	public var right : Node;
	public var data : *;
	
	public function Node(theKey : *, theData : *) {
		data = theData;
	}
}
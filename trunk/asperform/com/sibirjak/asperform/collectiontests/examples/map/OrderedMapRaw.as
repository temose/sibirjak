package com.sibirjak.asperform.collectiontests.examples.map {
	import flash.utils.Dictionary;

	public class OrderedMapRaw {

		public var map : Dictionary;
		public var stringMap : Object;
		public var first : Node;
		public var last : Node;
		public var size : uint;

		public function OrderedMapRaw() {
			map = new Dictionary();
			stringMap = new Object();
		}

		public function addFirst(key : *, item : *) : void {
			var node : Node = new Node(key, item);

			if (key is String) {
				if (stringMap[key] !== undefined) removeKey(key);
				stringMap[key] = node;
			} else {
				if (map[key] !== undefined) removeKey(key);
				map[key] = node;
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
		
		public function addLast(key : *, item : *) : void {
			var node : Node = new Node(key, item);

			if (key is String) {
				if (stringMap[key] !== undefined) removeKey(key);
				stringMap[key] = node;
			} else {
				if (map[key] !== undefined) removeKey(key);
				map[key] = node;
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
		
		public function hasKey(key : *) : Boolean {
			if (key is String) {
				return stringMap[key] !== undefined;
			} else {
				return map[key] !== undefined;
			}
		}

		public function removeKey(key : *) : void {
			var node : Node;
			
			if (key is String) {
				if (stringMap[key] === undefined) return;
				node = stringMap[key];
				delete stringMap[key];
			} else {
				if (map[key] === undefined) return;
				node = map[key];
				delete map[key];
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
			
			removeKey(first.key);
		}
	
		public function removeLast() : void {
			if (!last) return;
			
			removeKey(last.key);
		}

	}
}

internal class Node {
	public var left : Node;
	public var right : Node;
	public var key : *;
	public var data : *;
	
	public function Node(theKey : *, theData : *) {
		key = theKey;
		data = theData;
	}
}
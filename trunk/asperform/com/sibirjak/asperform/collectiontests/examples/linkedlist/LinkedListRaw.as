package com.sibirjak.asperform.collectiontests.examples.linkedlist {

	public class LinkedListRaw {
		
		public var first : Node;
		public var last : Node;
		public var size : uint;
		
		public function addFirst(data : *) : void {
			if (first) {
				first.left = new Node(data);
				first.left.right = first;
				first = first.left;
			} else {
				first = last = new Node(data);
			}
			size++;
		}
		
		public function addLast(data : *) : void {
			if (last) {
				last.right = new Node(data);
				last.right.left = last;
				last = last.right;
			} else {
				first = last = new Node(data);
			}
			size++;
		}
	
		public function removeFirst() : void {
			if (!first) return;
			
			if (first.right) {
				first = first.right;
				first.left = null;
			} else {
				first = last = null;
			}
			size--;
		}
	
		public function removeLast() : void {
			if (!last) return;
			
			if (last.left) {
				last = last.left;
				last.right = null;
			} else {
				first = last = null;
			}
			size--;
		}
	}
}

internal class Node {
	public var left : Node;
	public var right : Node;
	public var data : *;
	
	public function Node(theData : *) {
		data = theData;
	}
}
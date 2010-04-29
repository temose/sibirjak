package com.sibirjak.asperform.collectiontests.examples.arraylist {

	public class ArrayListRaw {
		
		public var array : Array;
		
		public function ArrayListRaw() {
			array = new Array();
		}
		
		public function addFirst(item : *) : void {
			array.unshift(item);
		}
		
		public function addLast(item : *) : void {
			array.push(item);
		}

		public function addAt(index : uint, item : *) : void {
			if (index <= array.length) {
				array.splice(index, 0, item);
			}
		}

		public function get size() : uint {
			return array.length;
		}

		public function count(item : *) : uint {
			var count : uint = 0;
			var size : uint = array.length;
			for (var i : int = 0; i < size; i++) {
				if (array[i] === item) count++;
			}
			return count;
		}

		public function get first() : * {
			return array[0];
		}
		
		public function get last() : * {
			return array[array.length - 1];
		}

		public function removeFirst() : * {
			return array.shift();
		}

		public function removeLast() : * {
			return array.pop();
		}

		public function removeAt(index : uint) : * {
			return array.splice(index, 1)[0];
		}

		// merge sort algorithm
		public function sort(compareFunction : Function, theArray : Array = null) : void {
			if (!theArray) theArray = array;
			
			if (theArray.length < 2) return;
			
			var firstHalf : uint = Math.floor(theArray.length / 2);
			var secondHalf : uint = theArray.length - firstHalf;
			var arr1 : Array = new Array(firstHalf);
			var arr2 : Array = new Array(secondHalf);

			var i : uint = 0;

			for (i = 0; i < firstHalf; i++) {
				arr1[i] = theArray[i];
			}

			for (i = firstHalf; i < firstHalf + secondHalf; i++) {
				arr2[i - firstHalf] = theArray[i];
			}
			
			sort(compareFunction, arr1);
			sort(compareFunction, arr2);

			i = 0;
			var j : uint = 0;
			var k : uint = 0;

			while (arr1.length != j && arr2.length != k) {
				if (compareFunction(arr1[j], arr2[k]) != 1) {
					theArray[i] = arr1[j];
					i++;
					j++;
				} else {
					theArray[i] = arr2[k];
					i++;
					k++;
				}
			}

			while (arr1.length != j) {
				theArray[i] = arr1[j];
				i++;
				j++;
			}

			while (arr2.length != k) {
				theArray[i] = arr2[k];
				i++;
				k++;
			}

		}

	}
}

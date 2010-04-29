package com.sibirjak.asperform.collectiontests.examples.set {
	import flash.utils.Dictionary;

	public class SetRaw {

		public var map : Dictionary;
		public var stringMap : Object;
		public var size : uint;
		
		public function SetRaw() {
			map = new Dictionary();
			stringMap = new Object();
		}

		public function add(item : *) : void {
			if (item is String) {
				stringMap[item] = true;
			} else {
				map[item] = true;
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
			if (item is String) {
				if (stringMap[item] === undefined) return;
				delete stringMap[item];
			} else {
				if (map[item] === undefined) return;
				delete map[item];
			}
			size--;
		}

	}
}

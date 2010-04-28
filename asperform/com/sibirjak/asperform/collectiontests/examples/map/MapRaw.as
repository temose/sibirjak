package com.sibirjak.asperform.collectiontests.examples.map {
	import flash.utils.Dictionary;

	public class MapRaw {
		
		public var map : Dictionary;
		public var stringMap : Object;
		public var size : uint;
		
		public function MapRaw() {
			map = new Dictionary();
			stringMap = new Object();
		}

		public function add(key : *, item : *) : void {
			if (key is String) {
				stringMap[key] = item;
			} else {
				map[key] = item;
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
			if (key is String) {
				if (stringMap[key] === undefined) return;
				delete stringMap[key];
			} else {
				if (map[key] === undefined) return;
				delete map[key];
			}
			size--;
		}

	}
}
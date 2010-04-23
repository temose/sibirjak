package com.sibirjak.asperform.collectiontests.as3collections {
	import as3.collections.IComparator;
	import as3.collections.core.UnsupportedTypeException;
	import as3.collections.utils.NumericComparator;
	import as3.collections.utils.StringComparator;

	/**
	 * @author jes 22.02.2010
	 */
	public class TestComparator implements IComparator {

		private var types : Array = [
			"string",
			"function",
			"boolean",
			"xml",
			"number",
			"object"
		];

		public function compare(item1 : *, item2 : *) : int {
			
			// equal
			
			if (item1 === item2) return 0;
			
			// allow null
			if (item1 === null) return -1;
			if (item2 === null) return 1;
			
			// type

			var type1 : uint = types.indexOf(typeof item1);
			var type2 : uint = types.indexOf(typeof item2);
			
			if (type1 < type2) return -1;
			else if (type1 > type2) return 1;
			
			// string
			
			if (item1 is String) {
				return new StringComparator().compare(item1, item2);
			}
			
			// number
			
			if (item1 is Number) {
				return new NumericComparator().compare(item1, item2);
			}

			// boolean
			
			if (item1 is Boolean) {
				if (item1) return -1;
				if (item2) return 1;
			}

			// function
			
			if (item1 is Function) {
				return 0;
			}

			// xml
			
			if (item1 is XML) {
				return 0;
			}

			// test item

			// do not allow non objects
			if (!(item1 is Object)) throw new UnsupportedTypeException(Object, item1);
			if (!(item2 is Object)) throw new UnsupportedTypeException(Object, item2);
			
			if (item1["index"] < item2["index"]) return -1;
			else if (item1["index"] > item2["index"]) return 1;
			else return 0;
		}

	}
}

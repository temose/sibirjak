package com.sibirjak.asperform {
	import org.as3commons.collections.utils.ArrayUtils;

	/**
	 * @author jes 07.04.2010
	 */
	public class TestData {
		
		public static const INSERTION_ORDER : String = "insertion_order";
		public static const RANDOM_ORDER : String = "random_order";

		public static const DATA_TYPE_UINT : String = "data_type_uint";
		public static const DATA_TYPE_STRING : String = "data_type_string";
		public static const DATA_TYPE_OBJECT : String = "data_type_object";
		public static const DATA_TYPE_MIXED : String = "data_type_mixed";
		
		private var _maxData : Array;
		private var _cache : Object;
		private var _shuffledCache : Object;
		
		private var _maxNumItems : uint = 0;
		private var _dataType : String;
		private var _order : String;

		public function TestData(dataType : String = DATA_TYPE_UINT, order : String = RANDOM_ORDER) {
			_dataType = dataType ? dataType : DATA_TYPE_UINT;
			_order = order ? order : RANDOM_ORDER;

			_maxData = new Array();
			_cache = new Object();
			_shuffledCache = new Object();
		}

		public function getData(numItems : uint) : Array {
			if (numItems == _maxNumItems) return _maxData;
			
			if (numItems > _maxNumItems) {
				_maxNumItems = numItems;
				createData();
				return _maxData;
			}
			
			if (!_cache[numItems]) _cache[numItems] = _maxData.slice(0, numItems);
			return _cache[numItems];
		}
		
		public function getShuffledData(numItems : uint) : Array {
			if (_shuffledCache[numItems]) return _shuffledCache[numItems];

			var data : Array = getData(numItems).concat();
			ArrayUtils.shuffle(data);
			_shuffledCache[numItems] = data;
			return data;
		}
		
		private function createData() : void {
			_maxData = new Array();
			var i : uint;
			
			if (_dataType == DATA_TYPE_UINT) {
				for (i = 1; i <= _maxNumItems; i++) {
					_maxData.push(i);
				}

			} else if (_dataType == DATA_TYPE_STRING) {
				for (i = 1; i <= _maxNumItems; i++) {
					_maxData.push("item"+i);
				}
				

			} else if (_dataType == DATA_TYPE_OBJECT) {
				for (i = 1; i <= _maxNumItems; i++) {
					_maxData.push(createItem("object", i));
				}
				

			} else if (_dataType == DATA_TYPE_MIXED) {
				var types : Array = [DATA_TYPE_UINT, DATA_TYPE_STRING, DATA_TYPE_OBJECT];
				for (i = 1; i <= _maxNumItems; i++) {
					_maxData.push(createItem(types[Math.round(Math.random() * 2)], i));
				}
			}
			
			if (_order == RANDOM_ORDER) ArrayUtils.shuffle(_maxData);
			
			_cache[_maxNumItems] = _maxData;
		}

		private function createItem(type : String, index : uint) : * {
			if (type == DATA_TYPE_UINT) return uint;
			if (type == DATA_TYPE_STRING) return "item" + index;
			return {
				index: index,
				toString: function() : String {
					return "object" + this["index"];
				}
			};
		}
		
	}
}

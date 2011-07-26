package com.sibirjak.asperform.collectiontests {
	import com.sibirjak.asperform.TestCase;
	import com.sibirjak.asperform.TestData;

	/**
	 * @author jes 07.04.2010
	 */
	public class CollectionTestCase extends TestCase {

		protected var _data : Array;
		protected var _numItems : uint = 2;

		private var _testData : TestData;

		private var _collection : *;
		private var _iterations : uint = 1;
		
		public function set testData(testData : TestData) : void {
			_testData = testData;
		}

		public function set numItems(numItems : uint) : void {
			_numItems = numItems;
		}

		override public function setUp(methodName : String) : void {
			
			_data = _testData.getData(_numItems);

			switch (methodName) {
				case "has":
				case "hasKey":
				case "first":
				case "sort":

				case "remove":
				case "removeFirst":
				case "removeLast":
				case "removeKey":
				case "iterate":
					_collection = createCollection();
					fill();
				
					if (_numItems != size) {
						throw new Error(
							"Collection size is " + size + " but should be " + _numItems
							+ " TestCase:" + name
							+ " Method:" + methodName
						);
					}
					break;

				case "sorted":
				case "add":
				case "addFirst":
				case "addLast":
					_data = _testData.getData(_numItems);
					_collection = createCollection();
					break;

				case "create":
					break;
			}
			
			switch (methodName) {
				case "has":
				case "remove":
				case "removeKey":
					_data = _testData.getShuffledData(_numItems);
					break;
			}

		}

		override public function tearDown(methodName : String) : void {
			switch (methodName) {
				case "add":
				case "addFirst":
				case "addLast":

				case "has":
				case "hasKey":
				case "iterate":

					if (_numItems != size) {
						throw new Error(
							"Collection size after test is " + size + " but should be " + _numItems
							+ " TestCase:" + name
							+ " Method:" + methodName
						);
					}
					break;

				case "create":
				case "remove":
				case "removeFirst":
				case "removeLast":
				case "removeKey":

					if (size != 0) {
						throw new Error(
							"Collection size after test is " + size + " but should be 0"
							+ " TestCase:" + name
							+ " Method:" + methodName
						);
					}
					break;
			}

			_collection = null;
		}

		protected function createCollection() : * {
			return null;
		}

		protected function fill() : void {
		}

		protected function get size() : uint {
			return 2;
		}
		
		protected function get iterations() : uint {
			return _iterations;
		}
		
	}
}

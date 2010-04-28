package com.sibirjak.asperform.collectiontests.examples {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.examples.map.MapRawTest;
	import com.sibirjak.asperform.collectiontests.flash.DictionaryTest;

	/**
	 * @author Jens Struwe 28.04.2010
	 */
	public class MapRawTests extends TestSuite {
		public function MapRawTests() {

			setTestOrder(["add", "hasKey", "removeKey"]);
			selectTestMethods(["add", "hasKey", "removeKey"]);
			
			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);
			
			addTestCase("5000 Items", new EmptyTestCase());
			addTestCase("Map", new MapRawTest());
			addTestCase("Dictionary", new DictionaryTest());
			
			setTestProperty("numItems", 10000);
			
			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("Map", new MapRawTest());
			addTestCase("Dictionary", new DictionaryTest());
			
			setTestProperty("numItems", 50000);
			
			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("Map", new MapRawTest());
			addTestCase("Dictionary", new DictionaryTest());

		}
	}
}

package com.sibirjak.asperform.collectiontests {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.flash.DictionaryTest;

	/**
	 * @author Jens Struwe 23.04.2010
	 */
	public class DictionaryTests extends TestSuite {
		public function DictionaryTests() {

			setTestOrder(["add", "hasKey", "removeKey", "has", "remove"]);
			selectTestMethods(["add", "hasKey", "removeKey", "has", "remove"]);

			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);

			addTestCase("5000 Items", new EmptyTestCase());
			addTestCase("Dictionary", new DictionaryTest());

			setTestProperty("numItems", 10000);

			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("Dictionary", new DictionaryTest());

			//selectTestMethods(["add", "hasKey", "removeKey"]);

			setTestProperty("numItems", 50000);

			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("Dictionary", new DictionaryTest());

		}
	}
}

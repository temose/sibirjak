package com.sibirjak.asperform.collectiontests {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsSortedListTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsTreapTest;

	/**
	 * @author Jens Struwe 28.04.2010
	 */
	public class TreapTests extends TestSuite {
		public function TreapTests() {

			setTestOrder(["add", "has", "remove", "removeFirst", "removeLast"]);
			selectTestMethods(["add", "has", "remove", "removeFirst", "removeLast"]);

			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);

			addTestCase("5000 Items", new EmptyTestCase());
			addTestCase("Treap", new AS3CommonsTreapTest());
			addTestCase("SortedList", new AS3CommonsSortedListTest());

			setTestProperty("numItems", 10000);

			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("Treap", new AS3CommonsTreapTest());
			addTestCase("SortedList", new AS3CommonsSortedListTest());

			setTestProperty("numItems", 50000);

			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("Treap", new AS3CommonsTreapTest());
			addTestCase("SortedList", new AS3CommonsSortedListTest());

		}
	}
}

package com.sibirjak.asperform.collectiontests {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsSortedListTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsSortedSetTest;

	/**
	 * @author jes 08.04.2010
	 */
	public class SortedSetTests2 extends TestSuite {
		public function SortedSetTests2() {

			setTestOrder(["add", "has", "remove", "removeFirst", "removeLast"]);
			selectTestMethods(["add", "has", "remove", "removeFirst", "removeLast"]);

			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);

			addTestCase("5000 Items", new EmptyTestCase());
			addTestCase("SortedSet", new AS3CommonsSortedSetTest());
			addTestCase("SortedArray", new AS3CommonsSortedListTest());

			setTestProperty("numItems", 10000);

			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("SortedSet", new AS3CommonsSortedSetTest());
			addTestCase("SortedArray", new AS3CommonsSortedListTest());

			setTestProperty("numItems", 50000);

			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("SortedSet", new AS3CommonsSortedSetTest());
			addTestCase("SortedArray", new AS3CommonsSortedListTest());

		}
	}
}

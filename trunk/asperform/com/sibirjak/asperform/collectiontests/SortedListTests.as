package com.sibirjak.asperform.collectiontests {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsSortedListTest;
	import com.sibirjak.asperform.collectiontests.dpdk.DpdkOrderedListTest;

	/**
	 * @author jes 08.04.2010
	 */
	public class SortedListTests extends TestSuite {
		public function SortedListTests() {

			setTestOrder(["add", "has", "remove", "removeFirst", "removeLast"]);
			selectTestMethods(["add", "has", "remove", "removeFirst", "removeLast"]);

			setTestProperty("testData", new TestData());

			setTestProperty("numItems", 500);

			addTestCase("500 Items", new EmptyTestCase());
			addTestCase("AS3Commons SortedList", new AS3CommonsSortedListTest());
			addTestCase("Dpdk OrderedList", new DpdkOrderedListTest());

			setTestProperty("numItems", 1000);

			addTestCase("1000 Items", new EmptyTestCase());
			addTestCase("AS3Commons SortedList", new AS3CommonsSortedListTest());
			addTestCase("Dpdk OrderedList", new DpdkOrderedListTest());

			setTestProperty("numItems", 2000);

			addTestCase("2000 Items", new EmptyTestCase());
			addTestCase("AS3Commons SortedList", new AS3CommonsSortedListTest());
			addTestCase("Dpdk OrderedList", new DpdkOrderedListTest());

			setTestProperty("numItems", 10000);

			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("AS3Commons SortedList", new AS3CommonsSortedListTest());

			setTestProperty("numItems", 50000);

			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("AS3Commons SortedList", new AS3CommonsSortedListTest());

		}
	}
}

package com.sibirjak.asperform.collectiontests {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsSetTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsSortedSetTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsTreapTest;

	/**
	 * @author jes 08.04.2010
	 */
	public class SortedSetTests extends TestSuite {
		public function SortedSetTests() {

			setTestOrder(["add", "has", "remove", "removeFirst", "removeLast"]);
			selectTestMethods(["add", "has", "remove", "removeFirst", "removeLast"]);

			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);

			addTestCase("5000 Items", new EmptyTestCase());
			addTestCase("SortedSet", new AS3CommonsSortedSetTest());
			addTestCase("Set", new AS3CommonsSetTest());
			addTestCase("Treap", new AS3CommonsTreapTest());

			setTestProperty("numItems", 10000);

			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("SortedSet", new AS3CommonsSortedSetTest());
			addTestCase("Set", new AS3CommonsSetTest());
			addTestCase("Treap", new AS3CommonsTreapTest());

			setTestProperty("numItems", 50000);

			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("SortedSet", new AS3CommonsSortedSetTest());
			addTestCase("Set", new AS3CommonsSetTest());
			addTestCase("Treap", new AS3CommonsTreapTest());

		}
	}
}

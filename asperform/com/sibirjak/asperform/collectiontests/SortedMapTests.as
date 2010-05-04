package com.sibirjak.asperform.collectiontests {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsMapTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsSortedMapTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsTreapTest;

	/**
	 * @author jes 08.04.2010
	 */
	public class SortedMapTests extends TestSuite {
		public function SortedMapTests() {

			setTestOrder(["add", "has", "remove", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			selectTestMethods(["add", "has", "remove", "removeFirst", "removeLast", "hasKey", "removeKey"]);

			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);

			addTestCase("5000 Items", new EmptyTestCase());
			addTestCase("SortedMap", new AS3CommonsSortedMapTest());
			addTestCase("Map", new AS3CommonsMapTest());
			addTestCase("Treap", new AS3CommonsTreapTest());

			setTestProperty("numItems", 10000);

			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("SortedMap", new AS3CommonsSortedMapTest());

			selectTestMethods(["add", "hasKey", "removeKey"]);
			addTestCase("Map", new AS3CommonsMapTest());

			selectTestMethods(["add", "has", "remove", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			addTestCase("Treap", new AS3CommonsTreapTest());

			setTestProperty("numItems", 50000);

			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("SortedMap", new AS3CommonsSortedMapTest());

			selectTestMethods(["add", "hasKey", "removeKey"]);
			addTestCase("Map", new AS3CommonsMapTest());

			selectTestMethods(["add", "has", "remove", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			addTestCase("Treap", new AS3CommonsTreapTest());

		}
	}
}

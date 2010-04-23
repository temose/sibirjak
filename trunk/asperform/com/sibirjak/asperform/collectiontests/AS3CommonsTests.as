package com.sibirjak.asperform.collectiontests {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsArrayListTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsLinkedListTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsMapTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsLinkedMapTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsLinkedSetTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsSetTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsSortedListTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsSortedMapTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsSortedSetTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsTreapTest;

	/**
	 * @author jes 08.04.2010
	 */
	public class AS3CommonsTests extends TestSuite {
		public function AS3CommonsTests() {

			setTestOrder(["add", "has", "iterate", "remove", "addFirst", "addLast", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			selectTestMethods(["add", "has", "iterate", "remove", "addFirst", "addLast", "removeFirst", "removeLast", "hasKey", "removeKey"]);

			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);

			addTestCase("5000 Items", new EmptyTestCase());

			addTestCase("Commons ArrayList", new AS3CommonsArrayListTest());
			addTestCase("Commons LinkedList", new AS3CommonsLinkedListTest());
			addTestCase("Commons SortedList", new AS3CommonsSortedListTest());

			addTestCase("Commons Set", new AS3CommonsSetTest());
			addTestCase("Commons OrderedSet", new AS3CommonsLinkedSetTest());
			addTestCase("Commons SortedSet", new AS3CommonsSortedSetTest());

			addTestCase("Commons Map", new AS3CommonsMapTest());
			addTestCase("Commons OrderedMap", new AS3CommonsLinkedMapTest());
			addTestCase("Commons SortedMap", new AS3CommonsSortedMapTest());

			addTestCase("Commons Treap", new AS3CommonsTreapTest());

			setTestProperty("numItems", 10000);

			addTestCase("10000 Items", new EmptyTestCase());

			selectTestMethods(["add", "iterate", "addFirst", "addLast", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			addTestCase("Commons ArrayList", new AS3CommonsArrayListTest());
			addTestCase("Commons LinkedList", new AS3CommonsLinkedListTest());

			selectTestMethods(["add", "has", "iterate", "remove", "addFirst", "addLast", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			addTestCase("Commons SortedList", new AS3CommonsSortedListTest());
			addTestCase("Commons Set", new AS3CommonsSetTest());
			addTestCase("Commons OrderedSet", new AS3CommonsLinkedSetTest());
			addTestCase("Commons SortedSet", new AS3CommonsSortedSetTest());

			selectTestMethods(["add", "iterate", "addFirst", "addLast", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			addTestCase("Commons Map", new AS3CommonsMapTest());
			addTestCase("Commons OrderedMap", new AS3CommonsLinkedMapTest());

			selectTestMethods(["add", "has", "iterate", "remove", "addFirst", "addLast", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			addTestCase("Commons SortedMap", new AS3CommonsSortedMapTest());
			addTestCase("Commons Treap", new AS3CommonsTreapTest());

			setTestProperty("numItems", 50000);

			addTestCase("50000 Items", new EmptyTestCase());

			selectTestMethods(["add", "iterate", "addFirst", "addLast", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			addTestCase("Commons ArrayList", new AS3CommonsArrayListTest());
			addTestCase("Commons LinkedList", new AS3CommonsLinkedListTest());

			selectTestMethods(["add", "has", "iterate", "remove", "addFirst", "addLast", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			addTestCase("Commons SortedList", new AS3CommonsSortedListTest());
			addTestCase("Commons Set", new AS3CommonsSetTest());
			addTestCase("Commons OrderedSet", new AS3CommonsLinkedSetTest());
			addTestCase("Commons SortedSet", new AS3CommonsSortedSetTest());

			selectTestMethods(["add", "iterate", "addFirst", "addLast", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			addTestCase("Commons Map", new AS3CommonsMapTest());
			addTestCase("Commons OrderedMap", new AS3CommonsLinkedMapTest());

			selectTestMethods(["add", "has", "iterate", "remove", "addFirst", "addLast", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			addTestCase("Commons SortedMap", new AS3CommonsSortedMapTest());
			addTestCase("Commons Treap", new AS3CommonsTreapTest());

		}
	}
}

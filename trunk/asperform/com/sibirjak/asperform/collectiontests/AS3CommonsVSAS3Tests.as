package com.sibirjak.asperform.collectiontests {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.as3collections.AS3CollectionsArrayListTest;
	import com.sibirjak.asperform.collectiontests.as3collections.AS3CollectionsLinkedListTest;
	import com.sibirjak.asperform.collectiontests.as3collections.AS3CollectionsLinkedMapTest;
	import com.sibirjak.asperform.collectiontests.as3collections.AS3CollectionsLinkedSetTest;
	import com.sibirjak.asperform.collectiontests.as3collections.AS3CollectionsMapTest;
	import com.sibirjak.asperform.collectiontests.as3collections.AS3CollectionsSetTest;
	import com.sibirjak.asperform.collectiontests.as3collections.AS3CollectionsSortedListTest;
	import com.sibirjak.asperform.collectiontests.as3collections.AS3CollectionsSortedMapTest;
	import com.sibirjak.asperform.collectiontests.as3collections.AS3CollectionsSortedSetTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsArrayListTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsLinkedListTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsLinkedMapTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsLinkedSetTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsMapTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsSetTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsSortedListTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsSortedMapTest;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsSortedSetTest;

	/**
	 * @author jes 08.04.2010
	 */
	public class AS3CommonsVSAS3Tests extends TestSuite {
		public function AS3CommonsVSAS3Tests() {
			
			setTestOrder(["add", "has", "iterate", "remove", "addFirst", "addLast", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			selectTestMethods(["add", "has", "iterate", "remove", "addFirst", "addLast", "removeFirst", "removeLast", "hasKey", "removeKey"]);

			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 1000);

//			setTestProperty("numItems", 50000);

			addTestCase("50000 Items", new EmptyTestCase());

			selectTestMethods(["add", "iterate", "addFirst", "addLast", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			addTestCase("Commons ArrayList", new AS3CommonsArrayListTest());
			addTestCase("AS3 ArrayList", new AS3CollectionsArrayListTest());
			
//			return;
			
			addTestCase("Commons LinkedList", new AS3CommonsLinkedListTest());
			addTestCase("AS3 LinkedList", new AS3CollectionsLinkedListTest());

			selectTestMethods(["add", "has", "iterate", "remove", "addFirst", "addLast", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			addTestCase("Commons SortedList", new AS3CommonsSortedListTest());
			addTestCase("AS3 SortedList", new AS3CollectionsSortedListTest());
			addTestCase("Commons Set", new AS3CommonsSetTest());
			addTestCase("AS3 Set", new AS3CollectionsSetTest());
			addTestCase("Commons OrderedSet", new AS3CommonsLinkedSetTest());
			addTestCase("AS3 OrderedSet", new AS3CollectionsLinkedSetTest());
			addTestCase("Commons SortedSet", new AS3CommonsSortedSetTest());
			addTestCase("AS3 SortedSet", new AS3CollectionsSortedSetTest());

			selectTestMethods(["add", "iterate", "addFirst", "addLast", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			addTestCase("Commons Map", new AS3CommonsMapTest());
			addTestCase("AS3 Map", new AS3CollectionsMapTest());
			addTestCase("Commons OrderedMap", new AS3CommonsLinkedMapTest());
			addTestCase("AS3 OrderedMap", new AS3CollectionsLinkedMapTest());

			selectTestMethods(["add", "has", "iterate", "remove", "addFirst", "addLast", "removeFirst", "removeLast", "hasKey", "removeKey"]);
			addTestCase("Commons SortedMap", new AS3CommonsSortedMapTest());
			addTestCase("AS3 SortedMap", new AS3CollectionsSortedMapTest());

		}
	}
}

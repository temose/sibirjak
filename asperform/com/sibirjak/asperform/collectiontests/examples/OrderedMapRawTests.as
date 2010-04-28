package com.sibirjak.asperform.collectiontests.examples {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.examples.linkedlist.LinkedListRawTest;
	import com.sibirjak.asperform.collectiontests.examples.map.MapRawTest;
	import com.sibirjak.asperform.collectiontests.examples.map.OrderedMapRawTest;

	/**
	 * @author Jens Struwe 29.04.2010
	 */
	public class OrderedMapRawTests extends TestSuite {
		public function OrderedMapRawTests() {

			setTestOrder(["addFirst", "addLast", "removeFirst", "removeLast", "add", "hasKey", "removeKey"]);
			selectTestMethods(["addFirst", "addLast", "removeFirst", "removeLast", "add", "hasKey", "removeKey"]);
			
			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);
			
			addTestCase("5000 Items", new EmptyTestCase());
			addTestCase("OrderedMap", new OrderedMapRawTest());
			addTestCase("Map", new MapRawTest());
			addTestCase("LinkedList", new LinkedListRawTest());

			setTestProperty("numItems", 10000);
			
			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("OrderedMap", new OrderedMapRawTest());
			addTestCase("Map", new MapRawTest());
			addTestCase("LinkedList", new LinkedListRawTest());

			setTestProperty("numItems", 50000);
			
			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("OrderedMap", new OrderedMapRawTest());
			addTestCase("Map", new MapRawTest());
			addTestCase("LinkedList", new LinkedListRawTest());

		}
	}
}

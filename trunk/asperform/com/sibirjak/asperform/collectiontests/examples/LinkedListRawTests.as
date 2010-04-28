package com.sibirjak.asperform.collectiontests.examples {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.examples.linkedlist.LinkedListRawTest;
	import com.sibirjak.asperform.collectiontests.flash.ArrayTest;

	/**
	 * @author Jens Struwe 28.04.2010
	 */
	public class LinkedListRawTests extends TestSuite {
		public function LinkedListRawTests() {

			setTestOrder(["addLast", "removeLast", "addFirst", "removeFirst"]);
			selectTestMethods(["addFirst", "addLast", "removeFirst", "removeLast"]);
			
			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);
			
			addTestCase("5000 Items", new EmptyTestCase());
			addTestCase("LinkedList", new LinkedListRawTest());
			addTestCase("Array", new ArrayTest());
			
			setTestProperty("numItems", 10000);
			
			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("LinkedList", new LinkedListRawTest());
			addTestCase("Array", new ArrayTest());
			
			setTestProperty("numItems", 50000);
			
			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("LinkedList", new LinkedListRawTest());
			addTestCase("Array", new ArrayTest());

		}
	}
}

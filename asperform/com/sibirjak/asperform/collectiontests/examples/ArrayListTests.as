package com.sibirjak.asperform.collectiontests.examples {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.examples.arraylist.ArrayListRawTest;
	import com.sibirjak.asperform.collectiontests.flash.ArrayTest;

	/**
	 * @author Jens Struwe 23.04.2010
	 */
	public class ArrayListTests extends TestSuite {

		public function ArrayListTests() {


			setTestOrder(["addLast", "removeLast", "addFirst", "removeFirst"]);
			selectTestMethods(["addFirst", "removeFirst", "addLast", "removeLast"]);

			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);

			addTestCase("5000 Items", new EmptyTestCase());
			addTestCase("ArrayList", new ArrayListRawTest());
			addTestCase("Array", new ArrayTest());

			setTestProperty("numItems", 10000);

			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("ArrayList", new ArrayListRawTest());
			addTestCase("Array", new ArrayTest());

			setTestProperty("numItems", 50000);

			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("ArrayList", new ArrayListRawTest());
			addTestCase("Array", new ArrayTest());

		}

	}
}

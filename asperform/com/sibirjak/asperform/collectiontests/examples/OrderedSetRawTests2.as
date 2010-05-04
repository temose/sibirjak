package com.sibirjak.asperform.collectiontests.examples {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.examples.set.OrderedSetRawTest;
	import com.sibirjak.asperform.collectiontests.flash.ArrayTest;

	/**
	 * @author Jens Struwe 29.04.2010
	 */
	public class OrderedSetRawTests2 extends TestSuite {
		public function OrderedSetRawTests2() {

			setTestOrder(["addLast", "has", "remove"]);
			selectTestMethods(["addLast", "has", "remove"]);
			
			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);
			
			addTestCase("5000 Items", new EmptyTestCase());
			addTestCase("OrderedSet", new OrderedSetRawTest());
			addTestCase("Array", new ArrayTest());

			setTestProperty("numItems", 10000);
			
			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("OrderedSet", new OrderedSetRawTest());
			addTestCase("Array", new ArrayTest());

			setTestProperty("numItems", 50000);
			
			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("OrderedSet", new OrderedSetRawTest());
			addTestCase("Array", new ArrayTest());

		}
	}
}

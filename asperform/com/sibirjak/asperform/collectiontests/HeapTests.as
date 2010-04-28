package com.sibirjak.asperform.collectiontests {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsTreapTest;
	import com.sibirjak.asperform.collectiontests.polygonal.PolygonalHeapTest;

	/**
	 * @author Jens Struwe 28.04.2010
	 */
	public class HeapTests extends TestSuite {
		public function HeapTests() {

			setTestOrder(["add", "first", "removeFirst"]);
			selectTestMethods(["add", "first", "removeFirst"]);

			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);

			addTestCase("5000 Items", new EmptyTestCase());
			addTestCase("Heap", new PolygonalHeapTest());
			addTestCase("Treap", new AS3CommonsTreapTest());

			setTestProperty("numItems", 10000);

			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("Heap", new PolygonalHeapTest());
			addTestCase("Treap", new AS3CommonsTreapTest());

			setTestProperty("numItems", 50000);

			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("Heap", new PolygonalHeapTest());
			addTestCase("Treap", new AS3CommonsTreapTest());


		}
	}
}

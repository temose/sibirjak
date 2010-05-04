package com.sibirjak.asperform.collectiontests {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsTreapTest;
	import com.sibirjak.asperform.collectiontests.dpdk.DpdkPriorityQueueTest;
	import com.sibirjak.asperform.collectiontests.polygonal.PolygonalHeapTest;

	/**
	 * @author jes 08.04.2010
	 */
	public class PriorityQueueTests extends TestSuite {
		public function PriorityQueueTests() {

			setTestOrder(["add", "removeFirst"]);
			selectTestMethods(["add", "removeFirst"]);

			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);

			addTestCase("5000 Items", new EmptyTestCase());
			addTestCase("AS3Commons Treap", new AS3CommonsTreapTest());
			addTestCase("Dpdk PriorityQueue", new DpdkPriorityQueueTest());
			addTestCase("Polygonal Heap", new PolygonalHeapTest());

			setTestProperty("numItems", 10000);

			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("AS3Commons Treap", new AS3CommonsTreapTest());
			addTestCase("Dpdk PriorityQueue", new DpdkPriorityQueueTest());
			addTestCase("Polygonal Heap", new PolygonalHeapTest());

			setTestProperty("numItems", 50000);

			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("AS3Commons Treap", new AS3CommonsTreapTest());
			addTestCase("Dpdk PriorityQueue", new DpdkPriorityQueueTest());
			addTestCase("Polygonal Heap", new PolygonalHeapTest());

		}
	}
}

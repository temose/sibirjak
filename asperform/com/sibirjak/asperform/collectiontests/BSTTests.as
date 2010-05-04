package com.sibirjak.asperform.collectiontests {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsTreapTest;
	import com.sibirjak.asperform.collectiontests.dpdk.DpdkBinarySearchTreeTest;
	import com.sibirjak.asperform.collectiontests.polygonal.PolygonalBinarySearchTreeTest;

	/**
	 * @author jes 08.04.2010
	 */
	public class BSTTests extends TestSuite {
		public function BSTTests() {

			setTestOrder(["add", "has", "remove"]);
			selectTestMethods(["add", "has", "remove"]);

//			setTestProperty("testData", new TestData());
//			setTestProperty("numItems", 1000);
//
//			addTestCase("1000 Items", new EmptyTestCase());
//			addTestCase("AS3Commons", new AS3CommonsTreapTest());
//			addTestCase("Dpdk", new DpdkBinarySearchTreeTest());
//			addTestCase("Polygonal", new PolygonalBinarySearchTreeTest());
//
//			setTestProperty("numItems", 5000);
//
//			addTestCase("5000 Items", new EmptyTestCase());
//			addTestCase("AS3Commons", new AS3CommonsTreapTest());
//			addTestCase("Dpdk", new DpdkBinarySearchTreeTest());
//			addTestCase("Polygonal", new PolygonalBinarySearchTreeTest());
//
//			setTestProperty("numItems", 10000);
//
//			addTestCase("10000 Items", new EmptyTestCase());
//			addTestCase("AS3Commons", new AS3CommonsTreapTest());
//			addTestCase("Dpdk", new DpdkBinarySearchTreeTest());
//			addTestCase("Polygonal", new PolygonalBinarySearchTreeTest());

			setTestProperty("testData", new TestData(null, TestData.INSERTION_ORDER));
			setTestProperty("numItems", 1000);

			addTestCase("1000 Items sorted", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsTreapTest());
			addTestCase("Dpdk", new DpdkBinarySearchTreeTest());
			addTestCase("Polygonal", new PolygonalBinarySearchTreeTest());

			setTestProperty("numItems", 5000);

			addTestCase("5000 Items sorted", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsTreapTest());

			setTestProperty("numItems", 10000);

			addTestCase("10000 Items sorted", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsTreapTest());

		}
	}
}

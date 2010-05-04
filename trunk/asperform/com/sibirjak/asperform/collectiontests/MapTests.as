package com.sibirjak.asperform.collectiontests {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsMapTest;
	import com.sibirjak.asperform.collectiontests.dpdk.DpdklMapTest;
	import com.sibirjak.asperform.collectiontests.polygonal.PolygonalMapTest;

	/**
	 * @author jes 08.04.2010
	 */
	public class MapTests extends TestSuite {
		public function MapTests() {

			setTestOrder(["add", "hasKey", "removeKey"]);
			selectTestMethods(["add", "hasKey", "removeKey"]);

			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);

			addTestCase("5000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsMapTest());
			addTestCase("Dpdk", new DpdklMapTest()); // not working with 1000 items
			addTestCase("Polygonal", new PolygonalMapTest());

			setTestProperty("numItems", 10000);

			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsMapTest());
			addTestCase("Dpdk", new DpdklMapTest()); // not working with 1000 items
			addTestCase("Polygonal", new PolygonalMapTest());

			setTestProperty("numItems", 50000);

			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsMapTest());
			addTestCase("Dpdk", new DpdklMapTest()); // not working with 1000 items
			addTestCase("Polygonal", new PolygonalMapTest());

			setTestProperty("numItems", 100000);

			addTestCase("100000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsMapTest());
			addTestCase("Dpdk", new DpdklMapTest()); // not working with 1000 items
			addTestCase("Polygonal", new PolygonalMapTest());

		}
	}
}

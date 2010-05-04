package com.sibirjak.asperform.collectiontests {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsSetTest;
	import com.sibirjak.asperform.collectiontests.dpdk.DpdkSetTest;
	import com.sibirjak.asperform.collectiontests.polygonal.PolygonalSetTest;

	/**
	 * @author jes 08.04.2010
	 */
	public class SetTests extends TestSuite {
		public function SetTests() {

			setTestOrder(["add", "has", "remove"]);
			selectTestMethods(["add", "has", "remove"]);

			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);

			addTestCase("5000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsSetTest());
			addTestCase("Dpdk", new DpdkSetTest());
			addTestCase("Polygonal", new PolygonalSetTest());

			setTestProperty("numItems", 10000);

			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsSetTest());
			addTestCase("Dpdk", new DpdkSetTest());
			addTestCase("Polygonal", new PolygonalSetTest());

			setTestProperty("numItems", 50000);

			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsSetTest());
			addTestCase("Dpdk", new DpdkSetTest());
			addTestCase("Polygonal", new PolygonalSetTest());

			setTestProperty("numItems", 100000);

			addTestCase("100000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsSetTest());
			addTestCase("Dpdk", new DpdkSetTest());
			addTestCase("Polygonal", new PolygonalSetTest());

		}
	}
}

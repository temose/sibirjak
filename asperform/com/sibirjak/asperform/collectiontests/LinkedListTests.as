package com.sibirjak.asperform.collectiontests {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsLinkedListTest;
	import com.sibirjak.asperform.collectiontests.dpdk.DpdkLinkedListTest;
	import com.sibirjak.asperform.collectiontests.polygonal.PolygonalLinkedListTest;

	/**
	 * @author jes 07.04.2010
	 */
	public class LinkedListTests extends TestSuite {
		public function LinkedListTests() {
			
			setTestOrder(["addFirst", "addLast", "removeFirst", "removeLast"]);
			selectTestMethods(["addFirst", "addLast", "removeFirst", "removeLast"]);
			
			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);
			
			addTestCase("5000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsLinkedListTest());
			addTestCase("Dpdk", new DpdkLinkedListTest());
			addTestCase("Polygonal", new PolygonalLinkedListTest());
			
			setTestProperty("numItems", 10000);
			
			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsLinkedListTest());
			addTestCase("Dpdk", new DpdkLinkedListTest());
			addTestCase("Polygonal", new PolygonalLinkedListTest());
			
			setTestProperty("numItems", 50000);
			
			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsLinkedListTest());
			addTestCase("Dpdk", new DpdkLinkedListTest());
			addTestCase("Polygonal", new PolygonalLinkedListTest());
			
			setTestProperty("numItems", 100000);
			
			addTestCase("100000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsLinkedListTest());
			addTestCase("Dpdk", new DpdkLinkedListTest());
			addTestCase("Polygonal", new PolygonalLinkedListTest());

		}
	}
}

package com.sibirjak.asperform.collectiontests {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.flash.ArrayTest;

	/**
	 * @author Jens Struwe 23.04.2010
	 */
	public class ArraySortedTests extends TestSuite {
		public function ArraySortedTests() {

			selectTestMethods(["sorted"]);

			setTestProperty("testData", new TestData());

			setTestProperty("numItems", 100);

			addTestCase("100 Items", new EmptyTestCase());
			addTestCase("Array", new ArrayTest());

			setTestProperty("numItems", 500);

			addTestCase("500 Items", new EmptyTestCase());
			addTestCase("Array", new ArrayTest());

			setTestProperty("numItems", 1000);

			addTestCase("1000 Items", new EmptyTestCase());
			addTestCase("Array", new ArrayTest());

			setTestProperty("numItems", 2000);

			addTestCase("2000 Items", new EmptyTestCase());
			addTestCase("Array", new ArrayTest());

		}
	}
}

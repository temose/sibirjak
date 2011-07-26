package com.sibirjak.asperform.collectiontests {

	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.TestData;
	import com.sibirjak.asperform.TestSuite;
	import com.sibirjak.asperform.collectiontests.as3commons.AS3CommonsLinkedListTest;
	import com.sibirjak.asperform.collectiontests.examples.linkedlist.LinkedListRawTest;
	import com.sibirjak.asperform.collectiontests.flash.ArrayTest;
	import com.sibirjak.asperform.collectiontests.jacksondunstan.JDLinkedListTest;

	/**
	 * @author jes 07.04.2010
	 */
	public class JDLinkedListTests extends TestSuite {
		public function JDLinkedListTests() {
			
			setTestProperty("testData", new TestData());

			setTestOrder(["addFirst", "addLast", "removeFirst", "removeLast", "has", "iterate", "sort"]);

//			selectTestMethods(["has", "iterate"]);
//			setTestProperty("numItems", 10000);
//			
//			addTestCase("10000 Items", new EmptyTestCase());
//			addTestCase("AS3Commons", new AS3CommonsLinkedListTest());
//			addTestCase("JD", new JDLinkedListTest());
			

			selectTestMethods(["addFirst", "addLast", "removeFirst", "removeLast"]);

			setTestProperty("numItems", 1000000);

			addTestCase("1000000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsLinkedListTest());
			addTestCase("JD", new JDLinkedListTest());
			addTestCase("Raw", new LinkedListRawTest());
			
			return;

			selectTestMethods(["sort"]);

			setTestProperty("numItems", 100000);

			addTestCase("100000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsLinkedListTest());
			addTestCase("JD", new JDLinkedListTest());
			addTestCase("Array", new ArrayTest());

			return;
			
			setTestOrder(["create", "addFirst", "addLast", "removeFirst", "removeLast"]);
			selectTestMethods(["create", "addFirst", "addLast", "removeFirst", "removeLast"]);
			
			setTestProperty("testData", new TestData());
			setTestProperty("numItems", 5000);
			
			addTestCase("5000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsLinkedListTest());
			addTestCase("JD", new JDLinkedListTest());
			
			setTestProperty("numItems", 10000);
			
			addTestCase("10000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsLinkedListTest());
			addTestCase("JD", new JDLinkedListTest());
			
			setTestProperty("numItems", 50000);
			
			addTestCase("50000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsLinkedListTest());
			addTestCase("JD", new JDLinkedListTest());
			
			setTestProperty("numItems", 100000);
			
			addTestCase("100000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsLinkedListTest());
			addTestCase("JD", new JDLinkedListTest());

			setTestProperty("numItems", 1000000);
			
			addTestCase("1000000 Items", new EmptyTestCase());
			addTestCase("AS3Commons", new AS3CommonsLinkedListTest());
			addTestCase("JD", new JDLinkedListTest());

		}
	}
}

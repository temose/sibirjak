package com.sibirjak.asperform {
	import flash.events.Event;

	/**
	 * @author jes 07.04.2010
	 */
	public class ResultEvent extends Event {

		public static const TEST_START : String = "testrunner_start";
		public static const RESULT : String = "testrunner_result";
		public static const TEST_COMPLETE : String = "testrunner_complete";
		
		public var test : Test;
		public var testCase : TestCase;
		
		public function ResultEvent(type : String, theTest : Test) {
			super(type);
			
			test = theTest;
			testCase = test.testCase;
		}
	}
}

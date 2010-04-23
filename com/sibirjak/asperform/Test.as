package com.sibirjak.asperform {

	/**
	 * @author jes 07.04.2010
	 */
	public class Test {
		
		public var testCase : TestCase;

		public var methodName : String;

		public var setUpFunction : Function;
		
		public var testFunction : Function;
		
		public var tearDownFunction : Function;
		
		private var _testCaseProperties : Array;

		public var runCount : uint;

		private var _durations : Array;
		
		public function Test() {
			_durations = new Array;
			_testCaseProperties = new Array();
		}

		public function addTestCaseProperty(propertyName : String, value : *) : void {
			_testCaseProperties.push(propertyName, value);
		}
		
		public function get testCaseProperties() : Array {
			return _testCaseProperties;
		}

		public function addDuration(duration : uint) : void {
			_durations.push(duration);
		}
		
		public function get lastDuration() : uint {
			return _durations[_durations.length - 1];
		}
	
		public function get duration() : uint {
			var sum : uint;
			var min : uint = _durations[0];
			var max : uint;

			for each (var duration : int in _durations) {
				sum += duration;
				max = Math.max(max, duration);
				min = Math.min(min, duration);
			}

			var numValues : uint = _durations.length;
			
			if (numValues > 1) { // remove max if # > 1
				sum -= max;
				numValues--;
			}
			
			if (numValues > 1) { // remove min if # > 1
				sum -= min;
				numValues--;
			}
			
			return sum / numValues;
		}
		
		public function toString() : String {
			return methodName;
		}
		
	}
}

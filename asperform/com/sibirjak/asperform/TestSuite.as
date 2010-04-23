package com.sibirjak.asperform {
	import org.as3commons.collections.LinkedList;
	import org.as3commons.collections.LinkedMap;
	import org.as3commons.collections.SortedSet;
	import org.as3commons.collections.framework.IMapIterator;
	import org.as3commons.collections.utils.ArrayUtils;

	import flash.utils.describeType;

	/**
	 * @author jes 07.04.2010
	 */
	public class TestSuite {
		
		protected var _testOrder : Object;
		protected var _testProperties : LinkedMap;
		protected var _selectedTestMethods : Object;
		
		protected var _testCases : Array;
		protected var _tests : LinkedList;
		protected var _allTestMethods : SortedSet;

		public function TestSuite() {
			_testProperties = new LinkedMap();

			_testCases = new Array();
			_tests = new LinkedList();
		}

		public function get tests() : LinkedList {
			return _tests;
		}

		public function get allTestMethods() : SortedSet {
			return _allTestMethods;
		}

		public function getAllTestMethods() : Array {
			return _allTestMethods.toArray();
		}

		public function getAllTestCases() : Array {
			return _testCases;
		}

		public function selectTestMethods(testMethods : Array) : void {
			_selectedTestMethods = new Object();
			for (var i : int = 0; i < testMethods.length; i++) {
				_selectedTestMethods[testMethods[i]] = true;
			}
		}

		public function clearSelectTestMethods() : void {
			_selectedTestMethods = null;
		}

		public function get selectedTestMethods() : Object {
			return _selectedTestMethods;
		}

		public function setTestOrder(testOrder : Array) : void {
			if (_testOrder) return;
			
			_testOrder = new Object();
			for (var i : int = 0; i < testOrder.length; i++) {
				_testOrder[testOrder[i]] = i;
			}
		}

		public function get testOrder() : Object {
			return _testOrder;
		}
		
		public function setTestProperty(propertyName : String, value : *, methodName : String = "_global") : void {
			var propertyMap : LinkedMap;
			if (_testProperties.hasKey(methodName)) {
				propertyMap = _testProperties.itemFor(methodName);
				propertyMap.removeKey(propertyName);
			} else {
				propertyMap = new LinkedMap();
				_testProperties.add(methodName, propertyMap);
			}
			
			propertyMap.add(propertyName, value);
		}

		public function clearTestProperties() : void {
			_testProperties = new LinkedMap();
		}

		public function get testProperties() : LinkedMap {
			return _testProperties;
		}
		
		public function addTestCase(name : String, testCase : TestCase) : void {
			_testCases.push(testCase);
			
			if (!_allTestMethods) _allTestMethods = new SortedSet(new TestOrderComparator(_testOrder));

			testCase.name = name;
			
			var pattern : RegExp = /^test_?/;
			var description:XML = describeType(testCase);
			var methods : XMLList = description..method.@name;
			var test : Test;
			var methodsArray : Array = new Array();
			var methodName : String;
			for each (var method : String in methods) {
				if (method.toString().indexOf("test") == 0) {
					
					methodName = method.replace(pattern, "");
					
					if (_selectedTestMethods && !_selectedTestMethods[methodName]) continue;

					test = new Test();
					test.testCase = testCase;
					test.methodName = methodName;
					
					test.setUpFunction = testCase["setUp"];
					test.testFunction = testCase[method];
					test.tearDownFunction = testCase["tearDown"];

					// set dynamic test properties
					
					var iterator : IMapIterator;
					if (_testProperties.hasKey("_global")) {
						iterator = LinkedMap(_testProperties.itemFor("_global")).iterator() as IMapIterator;
						while (iterator.hasNext()) {
							iterator.next();
							test.addTestCaseProperty(iterator.key, iterator.current);
						}
					}
					if (_testProperties.hasKey(methodName)) {
						iterator = LinkedMap(_testProperties.itemFor(methodName)).iterator() as IMapIterator;
						while (iterator.hasNext()) {
							iterator.next();
							test.addTestCaseProperty(iterator.key, iterator.current);
						}
					}

					methodsArray.push(test);
					_allTestMethods.add(test.methodName);
				}
			}
			
			if (_testOrder) {
				ArrayUtils.mergeSort(methodsArray, new TestOrderComparator(_testOrder));
			}
			
			for each (test in methodsArray) {
				_tests.add(test);
			}
		}
	}
}

import com.sibirjak.asperform.Test;

import org.as3commons.collections.framework.IComparator;

internal class TestOrderComparator implements IComparator {
	private var _testOrder : Object;

	public function TestOrderComparator(testOrder : Object) {
		_testOrder = testOrder;
	}
	
	public function compare(item1 : *, item2 : *) : int {
		if (!_testOrder) return 0;
		
		var method1 : String = item1 is String ? item1 : Test(item1).methodName;
		var method2 : String = item2 is String ? item2 : Test(item2).methodName;
		
		if (_testOrder[method1] === undefined) return 1;
		if (_testOrder[method2] === undefined) return -1;
		if (_testOrder[method1] == _testOrder[method2]) return 0;
		return _testOrder[method1] < _testOrder[method2] ? -1 : 1;
	}
}
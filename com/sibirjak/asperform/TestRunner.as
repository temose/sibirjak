package com.sibirjak.asperform {
	import org.as3commons.collections.LinkedMap;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author jes 07.04.2010
	 */
	public class TestRunner extends TestSuite implements IEventDispatcher {

		private var _eventDispatcher : IEventDispatcher;

		public var runsPerTest : uint = 1;

		private var _timer : Timer;
		private var _clock : Clock;
		
		private var _currentTest : Test;
		private var _started : Boolean = false;
		
		public function TestRunner() {
			
			_eventDispatcher = new EventDispatcher(this);
			
			_testProperties = new LinkedMap();
			
			_clock = new Clock();
			
			_timer = new Timer(64);
			_timer.addEventListener(TimerEvent.TIMER, timerHandler);
		}
		
		public function setTestSuite(testSuite : TestSuite) : void {
			_tests = testSuite.tests;
			_testCases = testSuite.getAllTestCases();
			_allTestMethods = testSuite.allTestMethods;
		}

		public function startTests() : void {
			_started = true; // TODO

			if (_tests) _timer.start();
		}
		
		private function timerHandler(event : TimerEvent) : void {
			
			// test finished

			if (_currentTest && _currentTest.runCount == runsPerTest) {
				dispatchEvent(new ResultEvent(ResultEvent.TEST_COMPLETE, _currentTest));

				_currentTest = null;
				return;
			}

			// test starts

			if (!_currentTest) {
				_currentTest = _tests.removeFirst();

				if (!_currentTest) {
					_timer.stop();
					return;
				}
				
				// set testcase properties
				
				for (var i : uint = 0; i < _currentTest.testCaseProperties.length; i += 2) {
					_currentTest.testCase[_currentTest.testCaseProperties[i]] = _currentTest.testCaseProperties[i + 1];
				}

				dispatchEvent(new ResultEvent(ResultEvent.TEST_START, _currentTest));
			}

			
			// setup test

			if (_currentTest.setUpFunction != null) {
				_currentTest.setUpFunction.call(null, _currentTest.methodName);
			}
			
			// execute test

			_clock.start();

			_currentTest.testFunction.call();
			
			_currentTest.addDuration(_clock.all());
			
			
			_currentTest.runCount++;

			// tear down test

			if (_currentTest.tearDownFunction != null) {
				_currentTest.tearDownFunction.call(null, _currentTest.methodName);
			}

			// write result

			dispatchEvent(new ResultEvent(ResultEvent.RESULT, _currentTest));
		}

		/*
		 * IEventDispatcher
		 */
		
		/**
		 * @inheritDoc
		 */
		public function dispatchEvent(event : Event) : Boolean {
			return _eventDispatcher.dispatchEvent(event);
		}
		
		/**
		 * @inheritDoc
		 */
		public function hasEventListener(type : String) : Boolean {
			return _eventDispatcher.hasEventListener(type);
		}
		
		/**
		 * @inheritDoc
		 */
		public function willTrigger(type : String) : Boolean {
			return _eventDispatcher.willTrigger(type);
		}
		
		/**
		 * @inheritDoc
		 */
		public function removeEventListener(type : String, listener : Function, useCapture : Boolean = false) : void {
			_eventDispatcher.removeEventListener(type, listener, useCapture);
		}
		
		/**
		 * @inheritDoc
		 */
		public function addEventListener(type : String, listener : Function, useCapture : Boolean = false, priority : int = 0, useWeakReference : Boolean = false) : void {
			_eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
	}
}

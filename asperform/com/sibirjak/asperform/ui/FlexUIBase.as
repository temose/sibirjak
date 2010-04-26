package com.sibirjak.asperform.ui {
	import com.sibirjak.asperform.EmptyTestCase;
	import com.sibirjak.asperform.ResultEvent;
	import com.sibirjak.asperform.TestCase;
	import com.sibirjak.asperform.TestRunner;
	import com.sibirjak.asperform.TestSuite;

	import mx.collections.ArrayCollection;
	import mx.containers.Panel;
	import mx.controls.DataGrid;
	import mx.controls.dataGridClasses.DataGridColumn;
	import mx.managers.PopUpManager;

	import flash.utils.Dictionary;

	/**
	 * @author jes 07.04.2010
	 */
	public class FlexUIBase extends Panel {
		
		public var grid : DataGrid;
		
		private var _runner : TestRunner;

		private var _testCases : Dictionary;
		
		private var _testMethodKeyMap : Dictionary;
		
		public function FlexUIBase() {
		}

		public function creationComplete() : void {
			_testCases = new Dictionary();
			_testMethodKeyMap = new Dictionary();
			
			_runner = new TestRunner();
			_runner.addEventListener(ResultEvent.RESULT, resultHandler);
			_runner.addEventListener(ResultEvent.TEST_COMPLETE, completeHandler);
			
			grid.dataProvider = new ArrayCollection();
		}
		
		public function setMethodKey(methodName : String, key : String) : void {
			_testMethodKeyMap[methodName] = key;
		}
		
		public function setTestOrder(testOrder : Array) : void {
			_runner.setTestOrder(testOrder);
		}

		public function setTestSuite(testSuite : TestSuite) : void {
			_runner.setTestSuite(testSuite);
		}

		public function addTestCase(name : String, testCase : TestCase) : void {
			_runner.addTestCase(name, testCase);
		}

		public function startTests() : void {
			
			if (!_runner.tests.size) return;

			// create columns
			
			var methods : Array = _runner.getAllTestMethods();
			var columns : Array = [createColumn("TestCase", "test")];
			var methodName : String;
			for each (methodName in methods) {
				columns.push(createColumn(methodName, methodName));
			}
			grid.columns = columns;

			// create test records

			var record : TestRecord;
			var testCase : TestCase;
			
			var i : uint = 0;
			for each (testCase in _runner.getAllTestCases()) {
				
				record = new TestRecord();
				record["test"] = testCase.name; 

				if (!(testCase is EmptyTestCase)) {
					for each (methodName in methods) {
						record[methodName] = "-";
					}
				}
				
				var data : ArrayCollection = grid.dataProvider as ArrayCollection;
				data.addItem(record);
				
				if (testCase is EmptyTestCase) {
					var indices : Array = grid.selectedIndices;
					indices.push(i);
					grid.selectedIndices = indices;
				}
				
				_testCases[testCase] = record;
				
				i++;
			}

			_runner.startTests();
		}
		
		protected function showHTML() : void {
			var panel : HTMLPopUp = new HTMLPopUp();
            panel.title = "Result as HTML table";
            panel.width = 400;
            panel.height = 300;

			PopUpManager.addPopUp(panel, this, true);
            PopUpManager.centerPopUp(panel);
            
			var data : ArrayCollection = grid.dataProvider as ArrayCollection;
			if (!data.length) {
				panel.html.text = "No tests found";
				return;
			}
			
			panel.html.text = "<table class='simple_table'>\n";
			panel.html.text += "<tr>";
			panel.html.text += "<th>TestCase</th>";
			
			var methods : Array = _runner.getAllTestMethods();
			var methodName : String;
			for each (methodName in methods) {
				if (_testMethodKeyMap[methodName]) methodName = _testMethodKeyMap[methodName];
				panel.html.text += "<th>" + methodName + "</th>";
			}

			panel.html.text += "</tr>\n";

			var testCase : TestCase;
			var result : String;
			for each (testCase in _runner.getAllTestCases()) {
				
				if (testCase is EmptyTestCase) {
					panel.html.text += "<tr class='heading'>";
					panel.html.text += "<td colspan='" + (methods.length + 1) + "'>" + testCase.name + "</td>";
				} else {
					panel.html.text += "<tr>";
					panel.html.text += "<td>" + testCase.name + "</td>";
	
					var record : TestRecord = _testCases[testCase];
	
					for each (methodName in methods) {
						result = record[methodName];
						if (!result) result = "";
						panel.html.text += "<td>" + result + "</td>";
					}
					
				}

				panel.html.text += "</tr>\n";
			}

			panel.html.text += "</table>";
			
		}

		private function createColumn(label : String, dataField : String) : DataGridColumn {
			var column : DataGridColumn = new DataGridColumn();
			column.headerText = label;
			column.dataField = dataField;
			return column;
		}

		private function resultHandler(event : ResultEvent) : void {
			var record : TestRecord = _testCases[event.testCase];
			record[event.test.methodName] = event.test.lastDuration + " (" + event.test.runCount + ")";
			
			var data : ArrayCollection = grid.dataProvider as ArrayCollection;
			data.itemUpdated(record);
			//trace ("result", event.testCase.label, event.test.methodName, event.test.runCount, event.test.duration);
		}

		private function completeHandler(event : ResultEvent) : void {

			var record : TestRecord = _testCases[event.testCase];
			record[event.test.methodName] = event.test.duration;
			
			var data : ArrayCollection = grid.dataProvider as ArrayCollection;
			data.itemUpdated(record);

			//trace ("complete", event.testCase.label, event.test.methodName, event.test.runCount, event.test.duration);
		}
		
	}
}

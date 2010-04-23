package com.sibirjak.asperform.collectiontests.as3commons {
	import org.as3commons.collections.fx.LinkedSetFx;

	/**
	 * @author jes 25.03.2010
	 */
	public class AS3CommonsLinkedSetFxTest extends AS3CommonsLinkedSetTest {

		/*
		 * Test neutralisation
		 */

		override protected function createCollection() : * {
			_set = new LinkedSetFx();
			return _set;
		}

		/*
		 * Tests
		 */

		override public function test_create() : void {
			for (var i : uint = 0; i < iterations; i++) {
				_set = new LinkedSetFx();
			}
		}

	}
}

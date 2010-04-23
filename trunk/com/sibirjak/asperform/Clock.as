package com.sibirjak.asperform {
	import flash.utils.getTimer;

	/**
	 * @author jes 07.04.2010
	 */
	public class Clock {

		private var _start : uint;
		private var _measured : uint;
		
		public function start() : uint {
			_start = _measured = getTimer();
			return 0;
		}
		
		public function last() : uint {
			var time : uint = getTimer();
			var last : uint = time - _measured;
			_measured = time;
			return last;
		}

		public function all() : uint {
			return getTimer() - _start;
		}

	}
}

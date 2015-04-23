package {
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Actor extends EventDispatcher {
		
		public var deleted:Boolean = false;
		
		public function Actor() {
		
		}
		
		public function updateNow():void {
		
		}
		
		public function remove():void {
			destroy();
		}
		
		public function destroy():void {
			if (!deleted) {
				deleted = true;
				cleanUpBeforeRemoving();
			}
		}
		
		protected function cleanUpBeforeRemoving():void {
			removeCostumes();
			removeBodies();
		}
		
		protected function removeCostumes():void {
		}
		
		protected function removeBodies():void {
		}
		
		public function getSpriteLoc():Point {
			return null;
		}
	}
}
package {
	import Box2D.Dynamics.b2Body;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class BodyManager {
		protected var _body:b2Body;
		protected var shape:MyShape;
		
		public function BodyManager() {
		
		}
		
		public function updateNow():void {
			
		}
		
		public function get body():b2Body {
			return _body;
		}
		
		public function removeBodies():void {
			Platformer.safeRemoveBody(_body);
		}
	}
}
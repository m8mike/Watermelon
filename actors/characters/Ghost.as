package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Ghost extends Character {
		
		public function Ghost(x:int, y:int) {
			bodyManager = new GhostBodyManager(new Point(x * 20, y * 20), this);
			costumeManager = new GhostCostumeManager(this);
		}
		
		public function getBody():b2Body {
			return bodyManager.body;
		}
		
		override public function updateNow():void {
			super.updateNow();
		}
	}
}
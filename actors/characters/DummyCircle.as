package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class DummyCircle extends Character {
		
		public function DummyCircle(x:int, y:int, size:Number) {
			bodyManager = new DummyBodyManager(new Point(x * 20, y * 20), this, MyShape(new CircleShape(size)));
		}
		
		public function getBody():b2Body {
			return bodyManager.body;
		}
		
		override public function updateNow():void {
			super.updateNow();
		}
	}
}
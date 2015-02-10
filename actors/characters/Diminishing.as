package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Diminishing  extends Character {
		private var actualSize:Number;
		private var loc:b2Vec2;
		private var already:int = 5;
		
		public var needBody:Boolean = false;
		
		public function Diminishing(x:int, y:int, size:Number) {
			bodyManager = new DummyBodyManager(new Point(x * 20, y * 20), this, MyShape(new RectShape(size, size)));
			actualSize = size;
		}
		
		public function getBody():b2Body {
			return bodyManager.body;
		}
		
		override public function updateNow():void {
			super.updateNow();
		}
		
		override public function remove():void {
			loc = bodyManager.body.GetWorldCenter();
			deleted = true;
			bodyManager.removeBodies();
			actualSize *= 0.9;
			needBody = true;
		}
		
		public function initBody():void {
			if (already >= 0) {
				already--;
				bodyManager = new DummyBodyManager(new Point(loc.x*30, loc.y*30), this, MyShape(new RectShape(actualSize, actualSize)));
			}
			deleted = false;
			needBody = false;
		}
	}
}
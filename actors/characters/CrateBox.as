package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CrateBox extends Character {
		
		public function CrateBox(x:Number, y:Number) {
			bodyManager = new CrateBoxBodyManager(new Point(x * 20, y * 20), this);
			costumeManager = new CrateBoxCostumeManager(this);
			super(x, y);
		}
		
		public function getBody():b2Body {
			return bodyManager.body;
		}
		
		override public function destroy():void {
			var wc:b2Vec2 = getBody().GetWorldCenter();
			Item.addRandomItem(wc.x * 1.5, wc.y * 1.5);
			super.destroy();
		}
	}
}
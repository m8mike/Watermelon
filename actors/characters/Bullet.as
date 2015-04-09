package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Bullet extends Character {
		
		public function Bullet(x:Number, y:Number, size:Number, velocity:b2Vec2) {
			bodyManager = new BulletBodyManager(new Point(x * 30, y * 30), size, velocity, this);
			costumeManager = new BulletCostumeManager(size, this);
		}
		
		public function getBody():b2Body {
			return bodyManager.body;
		}
		
		override public function destroy():void {
			//var wc:b2Vec2 = getBody().GetWorldCenter();
			//Item.addRandomItem(wc.x * 1.5, wc.y * 1.5);
			super.destroy();
		}
	}
}
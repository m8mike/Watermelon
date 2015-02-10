package {
	import Box2D.Collision.Shapes.b2CircleDef;
	import Box2D.Collision.Shapes.b2PolygonDef;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2ShapeDef;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import flash.display.DisplayObject;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Platform extends Actor {
		private var _body:b2Body;
		public var _costume:DisplayObject;
		
		/*public var _trigger:int;
		   public static const NONE = 0;
		   public static const FRAME = 1;
		   public static const PERIOD = 2;
		   public static const COLLISION = 3;
		public static const COLLISIONLESS = 4;*/
		
		public function Platform(myBody:b2Body, myCostume:DisplayObject) {
			_body = myBody;
			_body.SetUserData(this);
			_costume = myCostume;
			Platformer.platforms.push(this);
			updateCostumes();
		}
		override protected function cleanUpBeforeRemoving():void {
			Platformer.platforms.splice(Platformer.platforms.indexOf(this), 1);
			super.cleanUpBeforeRemoving();
		}
		override public function destroy():void {
			Platformer.safeRemoveBody(_body);
			//PhysiVals.world.DestroyBody(_body);
			super.destroy();
		}
		
		public function updateCostumes():void {
			_costume.x = _body.GetPosition().x * PhysiVals.RATIO;
			_costume.y = _body.GetPosition().y * PhysiVals.RATIO;
			_costume.rotation = _body.GetAngle() * 180 / Math.PI;
		}
	}
}
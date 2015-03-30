package {
	import Box2D.Dynamics.b2Body;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Key extends Collectable {
		public var mask:Sprite;
		private var body:b2Body;
		private var shape:CircleShape;
		private var location:Point;
		private var koef:int = 20;
		
		private var door:Door;
		
		public function Key(x:Number, y:Number, d:Door) {
			door = d;
			location = new Point(x * koef, y * koef);
			shape = new CircleShape(1 / 3);
			mask = shape.getSimpleSprite(location);
			CameraManager._staticLayer.addChild(mask);
			Platformer.platforms.push(this);
			super(mask);
		}
		
		override public function createBodies():void {
			var standardBodyBuilder:StaticBodyBuilder = new StaticBodyBuilder();
			standardBodyBuilder.density = 0;
			standardBodyBuilder.friction = 0.2;
			standardBodyBuilder.restitution = 0.3;
			standardBodyBuilder.groupIndex = -2;
			standardBodyBuilder.isSensor = true;
			standardBodyBuilder.x = location.x;
			standardBodyBuilder.y = location.y;
			body = standardBodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
			super.createBodies();
		}
		
		override protected function cleanUpBeforeRemoving():void {
			Platformer._player.addKey();
			door.open();
			door = null;
			super.cleanUpBeforeRemoving();
		}
		
		override protected function removeCostumes():void {
			mask.parent.removeChild(mask);
		}
		
		override protected function removeBodies():void {
			Platformer.safeRemoveBody(body);
			//PhysiVals.world.DestroyBody(body);
		}
	}

}
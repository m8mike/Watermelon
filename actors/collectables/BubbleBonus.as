package {
	import Box2D.Dynamics.b2Body;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class BubbleBonus extends Collectable {
		private var bubble:Bubble;
		
		public var mask:Sprite;
		private var body:b2Body;
		private var shape:CircleShape;
		public var location:Point;
		private var koef:int = 20;
		
		public function BubbleBonus(x:Number, y:Number) {
			location = new Point(x * koef, y * koef);
			shape = new CircleShape(10); // 1/3
			mask = shape.getSimpleSprite(location);
			CameraManager._staticLayer.addChild(mask);
			mask.visible = false;
			bubble = new Bubble(x * koef, y * koef);
			//Platformer.platforms.push(this);
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
		
		override public function pick(player:Player):void {
			super.pick(player);
		}
		
		override protected function cleanUpBeforeRemoving():void {
			if (!bubble.deleted) {	
				bubble.pop();
			}
			LevelInfo.bubblesPopped++;
			super.cleanUpBeforeRemoving();
		}
		
		override protected function removeCostumes():void {
			mask.parent.removeChild(mask);
		}
		
		override protected function removeBodies():void {
			Platformer.safeRemoveBody(body);
		}
	}
}
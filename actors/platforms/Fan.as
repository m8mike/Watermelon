package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Fan extends Platform {
		private var body:b2Body;
		private var costume:AnimationCostume;
		
		private var fanBody:b2Body;
		
		public function Fan(x:Number, y:Number) {
			super();
			location = new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			super.reload();
			super.init(body, shape.getSimpleSprite(location));
		}
		
		override public function reload():void {
			super.reload();
			super.init(body, shape.getSimpleSprite(location));
		}
		
		override protected function createShapes():void {
			shape = new RectShape(5 * PhysiVals.MIN_SQARE, 10 * PhysiVals.MIN_SQARE);
		}
		
		override protected function createCostumes():void {
		   costume = new AnimationCostume("fan_working", CameraManager._dynamicLayer, 0.2, 0.2);
		   costume.setCoords(location.x + 2.5 * PhysiVals.MIN_SQARE, location.y + 10 * PhysiVals.MIN_SQARE);
		   costume.play();
		}
		
		override protected function removeCostumes():void {
			if (costume) {
				costume.remove();
			}
			super.removeCostumes();
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0;
				bodyBuilder.friction = 0.2;
				bodyBuilder.restitution = 0.7;
				bodyBuilder.groupIndex = -2;
			}
			bodyBuilder.x = location.x + 5;
			bodyBuilder.y = location.y + 200;
			bodyBuilder.isSensor = false;
			bodyBuilder.restitution = 1;
			fanBody = bodyBuilder.getBody(new Array(new RectShape(90, 20)));
			fanBody.SetUserData(this);
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			bodyBuilder.angularDamping = 20;
			bodyBuilder.isSensor = true;
			bodyBuilder.restitution = 0.7;
			body = bodyBuilder.getBody(new Array(shape));
		}
		
		override protected function removeBodies():void {
			Platformer.safeRemoveBody(fanBody);
			super.removeBodies();
		}
	}
}
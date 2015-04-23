package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Cloud extends Platform {
		private var body:b2Body;
		private var costume:AnimationCostume;
		
		public function Cloud(x:Number, y:Number) {
			location = new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			shape = new RectShape(5 * PhysiVals.MIN_SQARE, 1 * PhysiVals.MIN_SQARE);
			createCostumes();
			createBodies();
			super(body, shape.getSimpleSprite(location));
		}
		
		public function createCostumes():void {
			costume = new AnimationCostume("cloudblue", CameraManager._dynamicLayer, 0.5, 0.5);
			costume.setCoords(location.x, location.y);
			costume.animation.visible = true;
		}
		
		override protected function removeCostumes():void {
			costume.remove();
			super.removeCostumes();
		}
		
		private function createBodies():void {
			if (!bodyBuilder) {	
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0;
				bodyBuilder.friction = 0.2;
				bodyBuilder.restitution = 0.7;
				bodyBuilder.groupIndex = -2;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			bodyBuilder.isSensor = true;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
	}
}
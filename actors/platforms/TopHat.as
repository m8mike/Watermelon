package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class TopHat extends Platform {
		private var body:b2Body;
		private var hat:AnimationCostume;
		private var topHat:AnimationCostume;
		private var shape1:RectShape;
		
		public function TopHat(x:int, y:int) {
			location = new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			createCostumes();
			createBodies();
			Platformer.platforms.push(this);
			super(body, shape1.getSimpleSprite(location));
		}
		
		public function createCostumes():void {
			hat = new AnimationCostume("hatFinish", CameraManager._dynamicLayer, 0.2, 0.2);
			hat.setCoords(location.x, location.y);
			hat.play();
			topHat = new AnimationCostume("hatFinishTop", CameraManager.belowLayer, 0.2, 0.2);
			topHat.setCoords(location.x, location.y);
			topHat.play();
		}
		
		override protected function removeCostumes():void {
			topHat.remove();
			hat.remove();
			super.removeCostumes();
		}
		
		private function createBodies():void {
			shape1 = new RectShape(0.5 * PhysiVals.MIN_SQARE, 3.4 * PhysiVals.MIN_SQARE);
			shape1.setLoc(-2, -3.4);
			var shape2:RectShape = new RectShape(0.7 * PhysiVals.MIN_SQARE, 3.4 * PhysiVals.MIN_SQARE);
			shape2.setLoc(1.3, -3.4);
			var shape3:RectShape = new RectShape(3.3 * PhysiVals.MIN_SQARE, 0.5 * PhysiVals.MIN_SQARE);
			shape3.setLoc(-1.5, -0.5);
			var standardBodyBuilder:StaticBodyBuilder = new StaticBodyBuilder();
			standardBodyBuilder.density = 0;
			standardBodyBuilder.friction = 0.2;
			standardBodyBuilder.restitution = 0.3;
			standardBodyBuilder.groupIndex = -2;
			standardBodyBuilder.x = location.x;
			standardBodyBuilder.y = location.y;
			body = standardBodyBuilder.getBody(new Array(shape1, shape2, shape3));
			body.SetUserData(this);
		}
	}
}
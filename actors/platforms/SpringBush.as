package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class SpringBush extends Platform {
		private var body:b2Body;
		private var costume:AnimationCostume;
		private var shape:RectShape;
		
		private var playing:Boolean = false;
		
		public function SpringBush(x:Number, y:Number) {
			location = new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			shape = new RectShape(PhysiVals.MIN_SQARE, PhysiVals.MIN_SQARE);
			createCostumes();
			createBodies();
			super(body, shape.getSimpleSprite(location));
		}
		
		override public function updateNow():void {
			if (playing) {
				if (costume.checkAndStop()) {
					costume.animation.gotoAndStop(1);
					playing = false;
				}
			}
			super.updateNow();
		}
		
		public function hit():void {
			if (!playing) {
				playing = true;
				costume.play();
			}
		}
		
		public function createCostumes():void {
			costume = new AnimationCostume("bush_spring", CameraManager._dynamicLayer, 0.25, 0.25, 10);
			costume.setCoords(location.x, location.y);
			costume.animation.visible = true;
		}
		
		override protected function removeCostumes():void {
			costume.remove();
			super.removeCostumes();
		}
		
		private function createBodies():void {
			var bodyBuilder:StaticBodyBuilder = new StaticBodyBuilder();
			bodyBuilder.density = 0;
			bodyBuilder.friction = 0.2;
			bodyBuilder.restitution = 0.7;
			bodyBuilder.groupIndex = -2;
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			bodyBuilder.isSensor = true;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
	}
}
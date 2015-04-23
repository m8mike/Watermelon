package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Wooden extends Platform {
		private var body:b2Body;
		private var costume:AnimationCostume;
		private var damaged:AnimationCostume;
		private var condition:int;
		
		private const NORMAL:int = 2;
		private const DAMAGED:int = 1;
		
		public function Wooden(x:int, y:int) {
			location = new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			shape = new RectShape(3 * PhysiVals.MIN_SQARE, 0.2 * PhysiVals.MIN_SQARE);
			createCostumes();
			createBodies();
			condition = 2;
			super(body, shape.getSimpleSprite(location));
		}
		
		public function hit(vel:Number):void {
			if (vel < 40) {
				changeState();
			} else if (condition == NORMAL) {
				changeState();
				changeState();
			} else {
				changeState();
			}
		}
		
		public function changeState():void {
			if (condition == NORMAL) {
				costume.animation.visible = false;
				damaged.play();
				condition--;
			} else if (condition == DAMAGED) {
				damaged.animation.visible = false;
				this.remove();
			}
		}
		
		public function createCostumes():void {
			costume = new AnimationCostume("wooden_block", CameraManager._dynamicLayer, 0.2, 0.2);
			costume.setCoords(location.x, location.y);
			costume.play();
			damaged = new AnimationCostume("wooden_block_damaged", CameraManager._dynamicLayer, 0.2, 0.2);
			damaged.setCoords(location.x, location.y);
		}
		
		override protected function removeCostumes():void {
			costume.remove();
			damaged.remove();
			super.removeCostumes();
		}
		
		private function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0;
				bodyBuilder.friction = 0.2;
				bodyBuilder.restitution = 0.3;
				bodyBuilder.groupIndex = -2;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
	}
}
package {
	import Box2D.Common.Math.b2Vec2;
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
			super();
			location = new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			super.reload();
			condition = 2;
			super.init(body, shape.getSimpleSprite(location));
		}
		
		override public function reload():void {
			super.reload();
			super.init(body, shape.getSimpleSprite(location));
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
				costume.hide();
				damaged.play();
				condition--;
			} else if (condition == DAMAGED) {
				damaged.hide();
				this.remove();
			}
		}
		
		override protected function createShapes():void {
			shape = new RectShape(3 * PhysiVals.MIN_SQARE, 0.2 * PhysiVals.MIN_SQARE);
		}
		
		override protected function createCostumes():void {
			costume = new AnimationCostume("wooden_block", CameraManager._dynamicLayer);
			costume.setScale(0.2);
			costume.setLocation(location.x, location.y);
			costume.play();
			damaged = new AnimationCostume("wooden_block_damaged", CameraManager._dynamicLayer);
			damaged.setScale(0.2);
			damaged.setLocation(location.x, location.y);
		}
		
		override public function updateCostumes():void {
			var angle:Number = body.GetAngle() / Math.PI * 180;
			var loc:b2Vec2 = body.GetPosition().Copy();
			loc.Multiply(PhysiVals.RATIO);
			if (costume) {
				costume.setLocation(loc.x, loc.y);
				costume.setAngle(angle);
			}
			if (damaged) {
				damaged.setLocation(loc.x, loc.y);
				damaged.setAngle(angle);
			}
			super.updateCostumes();
		}
		
		override protected function removeCostumes():void {
			if (costume) {	
				costume.remove();
			}
			if (damaged) {
				damaged.remove();
			}
			super.removeCostumes();
		}
		
		override protected function createBodies():void {
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
package {
	import Box2D.Common.Math.b2Vec2;
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
			shape = new RectShape(5 * PhysiVals.MIN_SQARE, 1 * PhysiVals.MIN_SQARE);
		}
		
		override protected function createCostumes():void {
			costume = new AnimationCostume("cloudblue", CameraManager._dynamicLayer, 0.5, 0.5);
			costume.setCoords(location.x, location.y);
			costume.animation.visible = true;
		}
		
		override public function updateCostumes():void {
			var loc:b2Vec2 = body.GetPosition().Copy();
			loc.Multiply(PhysiVals.RATIO);
			costume.setCoords(loc.x, loc.y);
			super.updateCostumes();
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
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			bodyBuilder.isSensor = true;
			body = bodyBuilder.getBody(new Array(shape));
		}
	}
}
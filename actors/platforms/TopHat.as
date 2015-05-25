package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.utils.getDefinitionByName;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class TopHat extends Platform {
		private var body:b2Body;
		private var hat:AnimationCostume;
		private var topHat:AnimationCostume;
		private var shape2:RectShape;
		private var shape3:RectShape;
		
		public function TopHat(x:int, y:int) {
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
			shape = new RectShape(0.5 * PhysiVals.MIN_SQARE, 3.4 * PhysiVals.MIN_SQARE);
			shape.setLoc(-2, -3.4);
			shape2 = new RectShape(0.7 * PhysiVals.MIN_SQARE, 3.4 * PhysiVals.MIN_SQARE);
			shape2.setLoc(1.3, -3.4);
			shape3 = new RectShape(3.3 * PhysiVals.MIN_SQARE, 0.5 * PhysiVals.MIN_SQARE);
			shape3.setLoc( -1.5, -0.5);
		}
		
		override protected function createCostumes():void {
			var clipDef:MovieClip = new (getDefinitionByName("hatFinish"))();
			hat = new AnimationCostume("hatFinish", CameraManager._dynamicLayer, 0.2, 0.2);
			hat.setCoords(location.x - 0.01 * clipDef.width, location.y - 0.018 * clipDef.height);
			hat.play();
			topHat = new AnimationCostume("hatFinishTop", CameraManager.belowLayer, 0.2, 0.2);
			topHat.setCoords(location.x, location.y);
			topHat.play();
		}
		
		override public function updateCostumes():void {
			var angle:Number = body.GetAngle() / Math.PI * 180;
			var loc:b2Vec2 = body.GetPosition().Copy();
			loc.Multiply(PhysiVals.RATIO);
			loc.x += 2;
			loc.y += 3.4;
			var clipDef:MovieClip = new (getDefinitionByName("hatFinish"))();
			topHat.setCoords(loc.x, loc.y);
			hat.setCoords(loc.x - 0.01 * clipDef.width, loc.y - 0.018 * clipDef.height);
			topHat.animation.rotation = angle;
			hat.animation.rotation = angle;
			super.updateCostumes();
		}
		
		override protected function removeCostumes():void {
			if (topHat) {	
				topHat.remove();
			}
			if (hat) {	
				hat.remove();
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
			body = bodyBuilder.getBody(new Array(shape, shape2, shape3));
			body.SetUserData(this);
		}
	}
}
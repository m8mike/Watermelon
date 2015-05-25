package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class SpringBush extends Platform {
		private var body:b2Body;
		private var costume:AnimationCostume;
		
		private var playing:Boolean = false;
		
		public function SpringBush(x:Number, y:Number) {
			super();
			location = new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			super.reload();
			super.init(body, shape.getSimpleSprite(location));
		}
		
		override public function reload():void {
			super.reload();
			super.init(body, shape.getSimpleSprite(location));
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
				SoundMusic.playBoink();
			}
		}
		
		override protected function createShapes():void {
			shape = new RectShape(PhysiVals.MIN_SQARE, PhysiVals.MIN_SQARE);
		}
		
		override protected function createCostumes():void {
			costume = new AnimationCostume("bush_spring1", CameraManager._dynamicLayer, 0.25, 0.25, 10);
			costume.setCoords(location.x, location.y);
			costume.animation.visible = true;
		}
		
		override public function updateCostumes():void {
			var angle:Number = body.GetAngle() / Math.PI * 180;
			costume.animation.rotation = angle;
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
			body.SetUserData(this);
		}
	}
}
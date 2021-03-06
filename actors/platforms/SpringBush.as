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
		
		private function backToStart():void {	
			costume.animation.gotoAndStop(1);
			playing = false;
		}
		
		public function hit():void {
			if (!playing) {
				playing = true;
				costume.play();
				SoundMusic.playBoink();
			}
			var angle:Number = body.GetAngle(); 
			var x:Number = 0.3 * Math.sin(angle);
			var y:Number = -0.3 * Math.cos(angle);
			var playerBody:b2Body = Platformer._player.getBody();
			playerBody.ApplyImpulse(new b2Vec2(x, y), playerBody.GetWorldCenter());
		}
		
		override protected function createShapes():void {
			shape = new RectShape(PhysiVals.MIN_SQARE, PhysiVals.MIN_SQARE);
		}
		
		override protected function createCostumes():void {
			costume = new AnimationCostume("bush_spring1", CameraManager._dynamicLayer);
			costume.setScale(0.25);
			costume.setLocation(location.x, location.y);
			costume.show();
			costume.animation.onEnd = backToStart;
		}
		
		override public function updateCostumes():void {
			var angle:Number = body.GetAngle() / Math.PI * 180;
			costume.setAngle(angle);
			var loc:b2Vec2 = body.GetPosition().Copy();
			loc.Multiply(PhysiVals.RATIO);
			costume.setLocation(loc.x, loc.y);
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
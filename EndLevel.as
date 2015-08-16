package {
	import Box2D.Dynamics.b2Body;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class EndLevel extends Platform {
		private var body:b2Body;
		public var mask:Sprite;
		public var width:Number;
		public var height:Number;
		
		public function EndLevel(x:Number, y:Number) {
			super();
			location = new Point((x - 1.4) * PhysiVals.MIN_SQARE, (y - 1) * PhysiVals.MIN_SQARE);
			width = 3.3;
			height = 0.5;
			super.reload();
			super.init(body, mask);
		}
		
		override public function reload():void {
			super.reload();
			super.init(body, mask);
		}
		
		public function finish(player:Player):void {
			//player.remove();
			if (Platformer.menu.clouds.visible) {
				Platformer.menu.clouds.visible = false;
				Platformer.menu.clouds.appear(finishHim);
			} else {
				trace("clouds are invisible! make them visible before completed screen");
			}
		}
		
		private function finishHim():void {
			trace("finish him!");
			if (Platformer._player) {	
				Platformer._player.remove();
			}
			Platformer.menu.complete(null);
		}
		
		override protected function createShapes():void {
			shape = new RectShape(width * PhysiVals.MIN_SQARE, height * PhysiVals.MIN_SQARE);
			mask = shape.getSimpleSprite(location);
			CameraManager._staticLayer.addChild(mask);
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0;
				bodyBuilder.restitution = 0.3;
				bodyBuilder.isSensor = true;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
	}
}
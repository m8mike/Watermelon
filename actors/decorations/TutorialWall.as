package {
	import Box2D.Dynamics.b2Body;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class TutorialWall extends Platform {
		private var body:b2Body;
		private var costume:Bitmap;
		
		public function TutorialWall(x:Number, y:Number) {
			super();
			location = new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			super.reload();
			super.init(body, costume);
		}
		
		override protected function createCostumes():void {
			var source:MovieClip = new tutorial_wall();
			costume = Costume.bitmapFromMC(source);
			costume.x = location.x - source.width / 2;
			costume.y = location.y - source.height;
			CameraManager._staticLayer.addChild(costume);
		}
		
		override public function reload():void {
			super.reload();
			super.init(body, costume);
		}
		
		override public function updateCostumes():void {
			super.updateCostumes();
			var angle:Number = body.GetAngle() / Math.PI * 180;
			if (costume) {
				costume.rotation = angle;
			}
		}
		
		override protected function removeCostumes():void {
			if (costume.parent) {
				costume.parent.removeChild(costume);
			}
			/*if (costume is Bitmap) {
				Bitmap(costume).bitmapData.dispose();
			}*/
			super.removeCostumes();
		}
		
		override protected function createShapes():void {
			shape = new RectShape(PhysiVals.MIN_SQARE, PhysiVals.MIN_SQARE);
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
			}
			StaticBodyBuilder(bodyBuilder).x = location.x;
			StaticBodyBuilder(bodyBuilder).y = location.y;
			StaticBodyBuilder(bodyBuilder).isSensor = true;
			body = bodyBuilder.getBody(new Array(shape));
		}
	}
}
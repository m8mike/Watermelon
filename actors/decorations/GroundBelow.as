package {
	import Box2D.Dynamics.b2Body;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class GroundBelow extends Platform {
		private var body:b2Body;
		private var costume:MovieClip;
		public var width:Number = 1;
		public var height:Number = 1;
		
		public function GroundBelow(x:Number, y:Number) {
			super();
			location = new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			super.reload();
			super.init(body, costume);
		}
		
		override protected function createCostumes():void {
			var scaleRate:Number = 3;
			var bitmapData:BitmapData = new BitmapData(width * 20 * scaleRate, height * 20 * scaleRate, false, 0x00000000);
			var u:MovieClip = new ug2();
			for (var j:int = 0; j < height * 20 / 43 + 1; j++) {
				for (var i:int = 0; i < width * 20 / 92 + 1; i++) {
					var m:Matrix = new Matrix();
					m.translate( -10 * scaleRate + i * 92, -22 * scaleRate + j * 43);
					m.scale(scaleRate, scaleRate);
					bitmapData.draw(u, m);
				}
			}
			var bitmap:Bitmap = new Bitmap(bitmapData);
			bitmap.scaleX = 1 / scaleRate;
			bitmap.scaleY = bitmap.scaleX;
			costume = new MovieClip();
			costume.x = location.x / PhysiVals.RATIO;
			costume.y = location.y / PhysiVals.RATIO;
			costume.addChild(bitmap);
			CameraManager.belowLayer.addChild(costume);
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
				trace("disposing GroindBelow");
				Bitmap(costume).bitmapData.dispose();
			}*/
			super.removeCostumes();
		}
		
		override protected function createShapes():void {
			shape = new RectShape(width * PhysiVals.MIN_SQARE, height * PhysiVals.MIN_SQARE);
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
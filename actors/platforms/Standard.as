package 
{
	import bodyBuilder.StaticBodyBuilder;
	import Box2D.Dynamics.b2Body;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Standard extends Platform {
		private var body:b2Body;
		private var costume:MovieClip;
		public var mask:Sprite;
		private var bounds:Bounds;
		public var width:Number;
		public var height:Number;
		private var offsetCostumeFromMask:Point;
		
		public function Standard(x:Number, y:Number, w:Number = 1, h:Number = 1) {
			super();
			location = new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			width = w;
			height = h;
			super.reload();
			bounds = new Bounds(x, y, w, h, costume);
			super.init(body, costume);
		}
		
		override public function reload():void {
			super.reload();
			bounds = new Bounds(location.x / PhysiVals.MIN_SQARE, location.y / PhysiVals.MIN_SQARE, width, height, costume);
			super.init(body, costume);
		}
		
		public function bodyTrace():void {
			trace(body.GetWorldCenter().x + " " + body.GetWorldCenter().y);
		}
		
		override protected function createShapes():void {
			shape = new RectShape(width * PhysiVals.MIN_SQARE, height * PhysiVals.MIN_SQARE);
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
			CameraManager._staticLayer.addChild(costume);
		}
		
		override protected function removeCostumes():void {
			if (costume) {
				if (costume.mask) {
					if (costume.mask.parent) {
						costume.mask.parent.removeChild(costume.mask);
					}
					costume.mask = null;
				}
				if (costume.parent) {
					costume.parent.removeChild(costume);
				}
				PhysiVals.cleanChildren(costume);
			}
			if (bounds) {
				bounds.remove();
			}
			super.removeCostumes();
		}
		
		override public function updateCostumes():void {
			super.updateCostumes();
			var angle:Number = body.GetAngle() / Math.PI * 180;
			if (bounds) {
				bounds.setAngle(angle);
				bounds.setLoc(body.GetPosition().x * PhysiVals.RATIO, body.GetPosition().y * PhysiVals.RATIO);
			}
			if (mask) {
				mask.rotation = angle;
			}
			if (costume) {
				costume.rotation = angle;
			}
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				StaticBodyBuilder(bodyBuilder).groupIndex = -2;
			}
			StaticBodyBuilder(bodyBuilder).x = location.x;
			StaticBodyBuilder(bodyBuilder).y = location.y;
			body = StaticBodyBuilder(bodyBuilder).getBody(new Array(shape));
		}
	}
}
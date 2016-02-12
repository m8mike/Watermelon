package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CharAnimConfig {
		public var shoes1ID:int = 1;
		public var hands1ID:int = 0;
		public var headID:int = 0;
		public var hatID:int = 8;
		public var stripeID:int = 1;
		public var shoes2ID:int = 1;
		public var hands2ID:int = 0;
		
		public var animationMode:int = 0;
		public static const NO_ITEMS:int = 0;
		public static const UMBRELLA_IN_RIGHT_HAND:int = 1;
		public static const UMBRELLA_IN_LEFT_HAND:int = 2;
		public static const NO_HANDS:int = 3;
		public static const ROCKETS:int = 4;
		public static const UMBRELLA_GO:int = 5;
		
		public var left:Boolean = false;
		
		public function CharAnimConfig() {
			
		}
		
		public static function convertToBitmap(mc:MovieClip, scaleRate:Number = 0.5):Bitmap {
			mc.scaleX = 0.5;
			mc.scaleY = 0.5;
			var clipBounds:Rectangle = mc.getBounds(mc);
			var bitmapData:BitmapData = new BitmapData(120, 185, true, 0x00000000);
			var matrix:Matrix = new Matrix();
			matrix.translate(clipBounds.width / 2, clipBounds.height / 2);
			matrix.scale(scaleRate, scaleRate);
			bitmapData.draw(mc, matrix);
			var bitmap:Bitmap = new Bitmap(bitmapData);
			bitmap.scaleX = 1 / scaleRate;
			bitmap.scaleY = 1 / scaleRate;
			return bitmap;
		}
		
		public static function hideNeighbours(doc:DisplayObject):void {
			for (var k:int = 0; k < doc.parent.numChildren; k++) {
				doc.parent.getChildAt(k).visible = false;
			}
			doc.visible = true;
		}
		
		public static function isolateChildren(doc:DisplayObjectContainer, room:Array):void {
			for (var i:int = 0; i < doc.numChildren; i++) {
				hideNeighbours(doc);
				hideNeighbours(doc.getChildAt(i));
				room.push(convertToBitmap(CharAnimCached.mc));
			}
		}
		
		public static function makeAllChildrenGoToFrame(doc:DisplayObjectContainer, f:int):void {
			for (var i:int = 0; i < doc.numChildren; i++) {
				var c = doc.getChildAt(i);
				if (c is MovieClip) {
					makeAllChildrenGoToFrame(c, f);
					c.gotoAndStop(f);
				} else if (c is DisplayObjectContainer) {
					makeAllChildrenGoToFrame(c, f);
				}
			}
		}
		
		/*private static function cropBitmap(bmd:BitmapData, newWidth:uint, newHeight:uint, newX:uint = 0, newY:uint = 0):BitmapData {
			var newBMD:BitmapData = new BitmapData(newWidth, newHeight);
			newBMD.copyPixels(bmd, new Rectangle(newX, newY, newWidth, newHeight), new Point(0, 0));
			return newBMD;
		}
		*/
	}
}
package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Costume {
		
		public function Costume() {
		
		}
		
		public static function bitmapFromMC(mc:MovieClip):Bitmap {
			var scaleRate:Number = 12;
			var m:Matrix = new Matrix();
			m.scale(scaleRate, scaleRate);
			var bitmapData:BitmapData = new BitmapData(mc.width * scaleRate, mc.height * scaleRate, true, 0x00000000);
			bitmapData.draw(mc, m);
			var bitmap:Bitmap = new Bitmap(bitmapData);
			bitmap.scaleX = 1 / scaleRate;
			bitmap.scaleY = 1 / scaleRate;
			return bitmap;
		}
	}
}
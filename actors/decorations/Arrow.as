package {
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Arrow extends Addable {
		private var costume:Bitmap;
		
		public function Arrow(x:Number, y:Number, angle:Number = 0) {
			var source:MovieClip = new arrow1_1();
			costume = Costume.bitmapFromMC(source);
			costume.x = x - source.width / 2;
			costume.y = y - source.height / 2;
			costume.rotation = angle;
			CameraManager._staticLayer.addChild(costume);
			super(new Point(x, y));
		}
		
		override protected function cleanUpBeforeRemoving():void {
			CameraManager._staticLayer.removeChild(costume);
			costume.bitmapData.dispose();
			super.cleanUpBeforeRemoving();
		}
	}
}
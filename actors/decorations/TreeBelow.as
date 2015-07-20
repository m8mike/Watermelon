package {
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class TreeBelow extends Addable {
		private var costume:Bitmap;
		
		public function TreeBelow(x:Number, y:Number) {
			var source:MovieClip = new tree_decor();
			costume = Costume.bitmapFromMC(source);
			costume.x = x - source.width / 2;
			costume.y = y - source.height;
			CameraManager.belowLayer.addChild(costume);
			super(new Point(x, y));
		}
		
		override protected function cleanUpBeforeRemoving():void {
			CameraManager.belowLayer.removeChild(costume);
			costume.bitmapData.dispose();
			super.cleanUpBeforeRemoving();
		}
	}
}
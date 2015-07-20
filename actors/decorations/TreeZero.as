package {
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class TreeZero extends Addable {
		private var costume:Bitmap;
		
		public function TreeZero(x:Number, y:Number) {
			var source:MovieClip = new tree_decor();
			costume = Costume.bitmapFromMC(source);
			costume.x = x - source.width / 2;
			costume.y = y - source.height;
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
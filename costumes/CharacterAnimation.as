package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getQualifiedClassName;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CharacterAnimation extends Costume {
		private var cached:CharAnimCached;
		private var config:CharAnimConfig;
		
		public function CharacterAnimation(mc:MovieClip, onEnd:Function = null) {
			cached = new CharAnimCached(mc);
			config = new CharAnimConfig();
			animation = new Animation();
			animation.frames = cached.getFrames(config);
			animation.onEnd = onEnd;
			animation.clip = mc;
			setScale(0.3);
			super(getQualifiedClassName(mc), CameraManager.pLayer);
		}
	}
}
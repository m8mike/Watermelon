package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;
	
	public class Animation {
		public var bitmap:Bitmap;
		public var clip:MovieClip;
		public var frames:Array = [];
		public var currentFrame:int = 1;
		public var onEnd:Function;
		
		private var clipDef:MovieClip;
		
		public function Animation() {
			bitmap = new Bitmap();
			bitmap.smoothing = false;
		}
		
		public function buildCacheFromLibrary(identifier:String):void {
			clipDef = new (getDefinitionByName(identifier))();
			buildCacheFromClip(clipDef);
		}
		
		public function buildCacheFromClip(clip:MovieClip, scaleRate:Number = 1):void {
			var clipBounds:Rectangle = clip.getBounds(clip);
			var matrix:Matrix = new Matrix();
			matrix.translate(clipBounds.width / 2, clipBounds.height / 2);
			matrix.scale(scaleRate, scaleRate);
			for (var i = 1; i <= clip.totalFrames; i++) {
				CharAnimConfig.makeAllChildrenGoToFrame(clip, i);
				var bitmapData:BitmapData = new BitmapData(clipBounds.width, clipBounds.height, true, 0x00000000);
				bitmapData.draw(clip, matrix);
				frames.push(bitmapData);
			}
		}
		
		public function play():void {
			Platformer.animations.push(this);
		}
		
		public function stop():void {
			Platformer.animations.splice(Platformer.animations.indexOf(this), 1);
		}
		
		public function gotoAndStop(frame:Number):void {
			currentFrame = frame;
			goto();
			stop();
		}
		
		public function gotoAndPlay(frame:Number):void {
			currentFrame = frame;
			goto();
			play();
		}
		
		public function nextFrame():void {
			if (!clip) {
				stop();
				return void;
			}
			currentFrame++;
			if (currentFrame > clip.totalFrames) {	
				currentFrame = 1;
			}
			goto();
		}
		
		private function goto():void {
			bitmap.bitmapData = frames[currentFrame - 1];
		}
		
		public function update():void {
			if (!clip) {
				stop();
				return void;
			}
			nextFrame();
			if (currentFrame >= clip.totalFrames) {
				if (onEnd != null) {	
					onEnd();
				}
			}
		}
		
		public function destroy():void {
			stop();
			if (bitmap.parent) {	
				bitmap.parent.removeChild(bitmap);
			}
		}
	}
}
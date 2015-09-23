package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import raster.touchmypixel.peepee.utils.Animation;
	import raster.touchmypixel.peepee.utils.AnimationCache;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Raster 
	{
		public static var _levelPieces:Array = [];
		
		// вызвать только 1 раз - в начале
		public static function cacheBackground():void {
			cacheAnimation("Mountains");
			cacheAnimation("Coniferous");
			cacheAnimation("bigCloud1");
			cacheAnimation("bigCloud2");
			cacheAnimation("bigCloud3");
			cacheAnimation("hillsWithTrees1"); //"fon1");
			cacheAnimation("hillsWithTrees2"); //"fon32");
			cacheAnimation("hillsWithTrees3"); //"fon6");
			cacheAnimation("hillsWithTrees4"); //"fon5");
			cacheAnimation("ghost1");
			cacheAnimation("bubbleBonus");
			cacheAnimation("diamond_bonus");
			cacheAnimation("heart");
			cacheAnimation("GrassBackground");
			cacheAnimation("GroundBackground");
			cacheAnimation("hatFinish");
			cacheAnimation("hatFinishZebra");
			cacheAnimation("hatFinish1");
			cacheAnimation("hatFinish2");
			cacheAnimation("hatFinish3");
			cacheAnimation("hatFinishTop");
			cacheAnimation("hatFinishTop1");
			cacheAnimation("hatFinishTop2");
			cacheAnimation("hatFinishTop3");
			cacheAnimation("hatFinishTopZebra");
			cacheAnimation("dustBlow");
			cacheAnimation("lightBlow");
			cacheAnimation("flinders");
			cacheAnimation("rocketSmoke");
			cacheAnimation("wooden_block");
			cacheAnimation("wooden_block_damaged");
			cacheAnimation("crate_box");
			cacheAnimation("bullet_rocket");
			cacheAnimation("bush_spring");
			cacheAnimation("bush_spring1");
			cacheAnimation("cloudblue");
			cacheAnimation("spikes_2");
			cacheAnimation("loadingBackground");
			cacheAnimation("fan_working");
			cacheAnimation("hat01");
			cacheAnimation("hat02");
			cacheAnimation("hat03");
			cacheAnimation("hat04");
			cacheAnimation("hat05");
			cacheAnimation("hat06");
			cacheAnimation("hat08");
			cacheAnimation("hat10");
			cacheAnimation("hat11");
			cacheAnimation("hat12");
			cacheAnimation("hat14");
			/*cacheAnimation("level_completed");
			cacheAnimation("level_not_completed");
			cacheAnimation("level_closed");*/
			cacheItems();
		}
		// вызывать перед созданием игрока
		public static function cachePlayer(player:Player):void {
			Animation.playerToCache = player;
			cacheAnimation("go_right");
			cacheAnimation("go_left");
			cacheAnimation("stay_right");
			cacheAnimation("stay_left");
			cacheAnimation("jump_right");
			cacheAnimation("jump_left");
			cacheAnimation("fall_right");
			cacheAnimation("fall_left");
			cacheAnimation("umbrella_right");
			cacheAnimation("umbrella_left");
			cacheAnimation("walljump_right");
			cacheAnimation("walljump_left");
			//cacheAnimation("red_splash");
			Animation.playerToCache = null;
		}
		
		public static function cachePlayerOnce(player:Player):void {
			Animation.playerToCache = player;
			cacheAnimation("umbrella_right");
			cacheAnimation("umbrella_left");
			cacheAnimation("red_splash");
			cacheAnimation("zapped");
			cacheAnimation("birds");
		}
		
		public static function cacheItems():void {
			cacheAnimation("bazookaHands");
			cacheAnimation("bazookaSnowHands");
			/*for (var i:int = 1; i < 15; i++) {
				cacheAnimation("hat" + (i<10?("0"+i):i));
			}*/
		}
		
		public static function getAnimation(id):Animation {
			var animationCache:AnimationCache = AnimationCache.getInstance();
			return animationCache.getAnimation(id);
		}
		
		public static function cacheAnimation(identifier:String, useSpriteSheet:Boolean = false):Animation {
			var animationCache:AnimationCache = AnimationCache.getInstance();
			animationCache.replaceExisting = true;
			return animationCache.cacheAnimation(identifier, useSpriteSheet);
		}
		
		public static function rasterize2(clip:Sprite):void {
			var clipContentsBound:Rectangle = clip.getBounds(clip);
			var bitmapData1:BitmapData;
			bitmapData1 = new BitmapData(clipContentsBound.width * 2, clipContentsBound.height * 2, true, 0x00000000);
			var matrix1:Matrix = new Matrix();
			matrix1.scale(2, 2);
			matrix1.translate(-clipContentsBound.x * 0, -clipContentsBound.y * 2);
			bitmapData1.draw(clip, matrix1);
			while (clip.numChildren > 0)
				clip.removeChildAt(0);
			clip.graphics.clear();
			var bitmap1:Bitmap = new Bitmap(bitmapData1);
			bitmap1.x = 0;
			bitmap1.y = clipContentsBound.y;
			bitmap1.smoothing = true;
			bitmap1.scaleX = 0.5;
			bitmap1.scaleY = 0.5;
			
			//clip.addChild(bitmap1);
			for (var i:int = bitmapData1.width / 640; i >= 0; i--) {
				for (var j:int = bitmapData1.height / 480; j >= 0; j--) {
					var bmd:BitmapData = cropBitmap(bitmapData1, 640, 480, i * 640, j * 480);
					var bitmap:Bitmap = new Bitmap(bmd);
					bitmap.x = 0 + i * 640;
					bitmap.y = clipContentsBound.y + j * 480;
					_levelPieces.push(bitmap);
					//bitmap.smoothing = true;/////////////////////////////////
					(j + i) % 2 ? CameraManager._cameraStaticLayer1.addChild(bitmap) : clip.addChild(bitmap);
				}
			}
			CameraManager._cameraStaticLayer1.scaleX = 0.5;
			CameraManager._cameraStaticLayer1.scaleY = 0.5;
			clip.scaleX = 0.5;
			clip.scaleY = 0.5;
			clip.x = CameraManager._cameraStaticLayer1.x - clip.x;
			clip.y = CameraManager._cameraStaticLayer1.y - clip.y;
			CameraManager._cameraStaticLayer1.x = 0;
			CameraManager._cameraStaticLayer1.y = clipContentsBound.y / 2;
			clip.x += CameraManager._cameraStaticLayer1.x;
			clip.y += CameraManager._cameraStaticLayer1.y;
		}
		
		public static function rasterize(clip:Sprite):void {
			var clipContentsBound:Rectangle = clip.getBounds(clip);
			var bitmapData:BitmapData = new BitmapData(clipContentsBound.width, clipContentsBound.height, true, 0x00000000);
			var matrix:Matrix = new Matrix();
			matrix.translate(-clipContentsBound.x, -clipContentsBound.y);
			bitmapData.draw(clip, matrix);
			while (clip.numChildren > 0)
				clip.removeChildAt(0);
			clip.graphics.clear();
			var bitmap:Bitmap = new Bitmap(bitmapData);
			bitmap.x = clipContentsBound.x;
			bitmap.y = clipContentsBound.y;
			//bitmap.smoothing = true;///////////////////////////////////
			clip.addChild(bitmap);
		}
		
		private static function cropBitmap(bmd:BitmapData, newWidth:uint, newHeight:uint, newX:uint = 0, newY:uint = 0):BitmapData {
			var newBMD:BitmapData = new BitmapData(newWidth, newHeight);
			newBMD.copyPixels(bmd, new Rectangle(newX, newY, newWidth, newHeight), new Point(0, 0));
			return newBMD;
		}
		
		public static function rasterizeAll():void {
			var n:int;
			for (n = 0; n < CameraManager._camera01.numChildren; n++) {
				if (CameraManager._camera01.getChildAt(n) is Sprite)
				rasterize(Sprite(CameraManager._camera01.getChildAt(n)));
			}
			for (n = 0; n < CameraManager._camera02.numChildren; n++) {
				if (CameraManager._camera02.getChildAt(n) is Sprite)
				rasterize(Sprite(CameraManager._camera02.getChildAt(n)));
			}
			for (n = 0; n < CameraManager._camera03.numChildren; n++) {
				if (CameraManager._camera03.getChildAt(n) is Sprite)
				rasterize(Sprite(CameraManager._camera03.getChildAt(n)));
			}
			for (n = 0; n < CameraManager._camera04.numChildren; n++) {
				if (CameraManager._camera04.getChildAt(n) is Sprite)
				rasterize(Sprite(CameraManager._camera04.getChildAt(n)));
			}
			for (n = 0; n < CameraManager._camera11.numChildren; n++) {
				if (CameraManager._camera11.getChildAt(n) is Sprite)
				rasterize(Sprite(CameraManager._camera11.getChildAt(n)));
			}
			for (n = 0; n < CameraManager._camera12.numChildren; n++) {
				if (CameraManager._camera12.getChildAt(n) is Sprite)
				rasterize(Sprite(CameraManager._camera12.getChildAt(n)));
			}
			for (n = 0; n < CameraManager._camera13.numChildren; n++) {
				if (CameraManager._camera13.getChildAt(n) is Sprite)
				rasterize(Sprite(CameraManager._camera13.getChildAt(n)));
			}/*
			for (n = 0; n < CameraManager._cameraConiferous.numChildren; n++) {
				if (CameraManager._cameraConiferous.getChildAt(n) is Sprite)
				rasterize(Sprite(CameraManager._cameraConiferous.getChildAt(n)));
			}*/
			for (n = 0; n < CameraManager._cameraMount.numChildren; n++) {
				if (CameraManager._cameraMount.getChildAt(n) is Sprite)
			   rasterize(Sprite(CameraManager._cameraMount.getChildAt(n)));
			}
			/*for (n = 0; n < CameraManager._cameraConiferous.numChildren; n++) {
				if (CameraManager._cameraStaticLayer.getChildAt(n) is MovieClip) {
					CameraManager._cameraStaticLayer.addChild(
					BmpFrames.createBmpFramesFromMC(MovieClip(CameraManager._cameraStaticLayer.getChildAt(n))).frames[0]);
				}
			}*/
			rasterize2(CameraManager._staticLayer);
			/*if (Platformer.levelNow >= 1 && Platformer.levelNow <= 8) {
			   rasterize2(CameraManager._cameraStaticLayer);
			   } else {
			   rasterize(CameraManager._cameraStaticLayer);
			 }*/
		}
	}

}
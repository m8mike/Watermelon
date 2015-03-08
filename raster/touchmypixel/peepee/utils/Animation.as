package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.PixelSnapping;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;
	import raster.bit101.display.BigAssCanvas;
	
	public class Animation extends Sprite {
		public static var playerToCache:Player;
		
		public var bitmap:Bitmap;
		public var clip:MovieClip;
		public var frames:Array = [];
		public var currentFrame:Number = 1;
		private var _playing:Boolean = false;
		private var _cache:Boolean = true;
		
		public var repeat:Boolean = true;
		public var onEnd:Function;
		private var clipData:MovieClip;
		public var reverse:Boolean = false;
		
		public var speed:Number = 1;
		
		public var treatAsLoopedGraphic:Boolean = false;
		public var bigBitmap:BigAssCanvas;
		
		public var cols:Number = 0;
		public var rows:Number = 0
		public var r:Rectangle
		private var _totalFrames;
		
		private var clipDef;
		
		public var useSpriteSheet:Boolean = false;
		
		public function Animation() {
			bitmap = new Bitmap();
			bitmap.smoothing = false;
			addChild(bitmap);
		}
		
		public function set bitmapData(value:BitmapData) {
			bitmap.bitmapData = value;
		}
		
		public function get bitmapData():BitmapData {
			return bitmap.bitmapData;
		}
		
		public function get playing():Boolean {
			return _playing;
		}
		
		public function get totalFrames():Number {
			return clip.totalFrames;
		}
		
		private function hideShoes(clip:DisplayObjectContainer):void {
			for (var j:int = 0; j < MovieClip(clip.getChildAt(0)).numChildren; j++) {
				MovieClip(clip.getChildAt(0)).getChildAt(j).visible = false;
				MovieClip(clip.getChildAt(3)).getChildAt(j).visible = false;
			}
		}
		
		private function hideRightHand(clip:DisplayObjectContainer):void {
			for (var j:int = 0; j < MovieClip(clip.getChildAt(4)).numChildren; j++) {
				MovieClip(clip.getChildAt(4)).getChildAt(j).visible = false;
			}
		}
		
		private function hideLeftHand(clip:DisplayObjectContainer):void {
			for (var j:int = 0; j < MovieClip(clip.getChildAt(1)).numChildren; j++) {
				MovieClip(clip.getChildAt(1)).getChildAt(j).visible = false;
			}
		}
		
		private function hideChildren(clip:DisplayObjectContainer):void {
			clip.visible = false;
			if (clip.numChildren > 0) {
				for (var j:int = 0; j < clip.numChildren; j++) {
					if (clip.getChildAt(j) is DisplayObjectContainer) {
						hideChildren(DisplayObjectContainer(clip.getChildAt(j)));
					} else {
						clip.getChildAt(j).visible = false;
						clip.removeChildAt(j);
					}
				}
			}
		}
		
		private function showShoes(clip:DisplayObjectContainer):void {
			MovieClip(clip.getChildAt(0)).getChildAt(playerToCache.shoesIndex).visible = true;
			MovieClip(clip.getChildAt(3)).getChildAt(playerToCache.shoesIndex).visible = true;
		}
		
		private function umbrellaPartsRight(clip:MovieClip):void {
			if (playerToCache.animationMode == Player.UMBRELLA_IN_RIGHT_HAND) {
				clip.getChildAt(0).visible = true;
			} else if (playerToCache.animationMode == Player.UMBRELLA_GO && clip.numChildren > 2) {
				clip.getChildAt(2).visible = true;
			} else {
				clip.getChildAt(1).visible = true;
			}
		}
		
		private function umbrellaPartsLeft(clip:MovieClip):void {
			if (playerToCache.animationMode == Player.UMBRELLA_IN_RIGHT_HAND) {
				clip.getChildAt(1).visible = true;
			} else if (playerToCache.animationMode == Player.UMBRELLA_GO && clip.numChildren > 2) {
				clip.getChildAt(2).visible = true;
			} else {
				clip.getChildAt(0).visible = true;
			}
		}
		
		private function headParts(clipParent:DisplayObjectContainer):void {
			var clip:DisplayObjectContainer = DisplayObjectContainer(clipParent.getChildAt(2));
			if (clip is head || clip is headleft) {
				for (var i:int = 0; i < MovieClip(clip.getChildAt(0)).numChildren; i++) {
					MovieClip(clip.getChildAt(0)).getChildAt(i).visible = false;
				}
				MovieClip(clip.getChildAt(0)).getChildAt(playerToCache.characterIndex + (clip is head ? 0 : 1)).visible = true;
				MovieClip(clip.getChildAt(0)).getChildAt(playerToCache.hatIndex).visible = true;
			}
		}
		
		public function buildCacheFromLibrary(identifier:String):void {
			clipDef = new (getDefinitionByName(identifier))();
			if (clipDef is go_right || clipDef is go_left || clipDef is stay_right || clipDef is stay_left || 
				clipDef is jump_right || clipDef is jump_left || clipDef is fall_right || clipDef is fall_left || 
				clipDef is umbrella_right || clipDef is umbrella_left) {
				hideShoes(DisplayObjectContainer(clipDef));
				hideLeftHand(DisplayObjectContainer(clipDef));
				showShoes(DisplayObjectContainer(clipDef));
				headParts(DisplayObjectContainer(clipDef));
				if (playerToCache) {
					if (playerToCache.animationMode == Player.NO_HANDS) {
						hideChildren(clipDef.getChildAt(4));
						hideChildren(clipDef.getChildAt(1));
						if (useSpriteSheet) {
							buildCacheFromClip2(clipDef);
						} else {
							buildCacheFromClip(clipDef);
						}
						return void;
					}
				}
			}
			if (clipDef is go_right || clipDef is stay_right || clipDef is jump_right) {
				hideRightHand(DisplayObjectContainer(clipDef));
				umbrellaPartsRight(MovieClip(MovieClip(clipDef).getChildAt(4)));
				MovieClip(MovieClip(clipDef).getChildAt(1)).getChildAt(0).visible = true;
			}
			if (clipDef is go_right) {
				
			} else if (clipDef is go_left) {
				hideRightHand(DisplayObjectContainer(clipDef));
				if (playerToCache.animationMode == Player.UMBRELLA_IN_RIGHT_HAND) {
					umbrellaPartsLeft(MovieClip(go_left(clipDef).getChildAt(4)));
				} else {
					umbrellaPartsRight(MovieClip(go_left(clipDef).getChildAt(4)));
				}
				umbrellaPartsLeft(MovieClip(go_left(clipDef).getChildAt(1)));
			} else if (clipDef is stay_right) {
				hideRightHand(DisplayObjectContainer(clipDef));
				umbrellaPartsLeft(MovieClip(MovieClip(clipDef).getChildAt(4)));
			} else if (clipDef is stay_left) {
				hideRightHand(DisplayObjectContainer(clipDef));
				umbrellaPartsLeft(MovieClip(stay_left(clipDef).getChildAt(1)));
				MovieClip(stay_left(clipDef).getChildAt(4)).getChildAt(1).visible = true;
			} else if (clipDef is jump_right) {
				
			} else if (clipDef is jump_left) {
				hideRightHand(DisplayObjectContainer(clipDef));
				umbrellaPartsLeft(MovieClip(jump_left(clipDef).getChildAt(1)));
				MovieClip(jump_left(clipDef).getChildAt(4)).getChildAt(0).visible = true;
			} else if (clipDef is fall_right) {
				hideRightHand(DisplayObjectContainer(clipDef));
				MovieClip(fall_right(clipDef).getChildAt(1)).getChildAt(0).visible = true;
				MovieClip(MovieClip(MovieClip(fall_right(clipDef).getChildAt(1)).getChildAt(0)).getChildAt(0)).getChildAt(1).visible = false;
				if (playerToCache.animationMode == Player.UMBRELLA_IN_RIGHT_HAND) {
					MovieClip(fall_right(clipDef).getChildAt(4)).getChildAt(1).visible = true;
				} else {
					MovieClip(fall_right(clipDef).getChildAt(4)).getChildAt(2).visible = true;
				}
			} else if (clipDef is fall_left) {
				hideRightHand(DisplayObjectContainer(clipDef));
				MovieClip(MovieClip(MovieClip(fall_left(clipDef).getChildAt(1)).getChildAt(0)).getChildAt(0)).getChildAt(1).visible = false;
				if (playerToCache.animationMode == Player.UMBRELLA_IN_RIGHT_HAND) {
					MovieClip(fall_left(clipDef).getChildAt(1)).getChildAt(0).visible = true;
					MovieClip(MovieClip(MovieClip(fall_left(clipDef).getChildAt(1)).getChildAt(0)).getChildAt(0)).getChildAt(1).visible = true;
				} else {
					MovieClip(fall_left(clipDef).getChildAt(1)).getChildAt(0).visible = true;
					MovieClip(MovieClip(MovieClip(fall_left(clipDef).getChildAt(1)).getChildAt(0)).getChildAt(0)).getChildAt(1).visible = false;
				}
				MovieClip(fall_left(clipDef).getChildAt(4)).getChildAt(2).visible = true;
			} else if (clipDef is umbrella_right) {
				hideRightHand(DisplayObjectContainer(clipDef));
				MovieClip(umbrella_right(clipDef).getChildAt(1)).getChildAt(0).visible = true;
				MovieClip(MovieClip(umbrella_right(clipDef).getChildAt(1)).getChildAt(0)).getChildAt(0).visible = false;
				MovieClip(umbrella_right(clipDef).getChildAt(4)).getChildAt(0).visible = true;
			} else if (clipDef is umbrella_left) {
				hideRightHand(DisplayObjectContainer(clipDef));
				//MovieClip(umbrella_left(clipDef).getChildAt(1)).getChildAt(1).visible = true;
				MovieClip(umbrella_left(clipDef).getChildAt(4)).getChildAt(0).visible = true;
			}
			if (useSpriteSheet) {
				buildCacheFromClip2(clipDef);
			} else {
				buildCacheFromClip(clipDef);
			}
		}
		
		public function buildCacheFromClip(_clip:MovieClip):void {
			clip = _clip;
			
			if (clip["e_bounds"] != null) {
				var c = clip["e_bounds"];
				r = new Rectangle(c.x, c.y, c.width, c.height);
				clip["e_bounds"].visible = false;
			} else {
				r = clip.getRect(clip)
			}
			
			for (var i = 1; i <= clip.totalFrames; i++) {
				clip.gotoAndStop(i)
				makeAllChildrenGoToFrame(clip, i);
				var bitmapData:BitmapData;
				if (clipDef is GroundBackground || clipDef is GrassBackground) {
					bitmapData = new BitmapData(r.width, r.height, true, 0x00000000);
				} else if (clipDef is red_splash) {
					bitmapData = new BitmapData(r.width * 2, r.height * 2, true, 0x00000000);
				} else {
					bitmapData = new BitmapData(r.width * 1.2, r.height * 1.1, true, 0x00000000);
				}
				var m:Matrix = new Matrix();
				if (clipDef is Zombie || clipDef is Mountains) {
					m.translate(-r.x * 1.2, -r.y * 1.1);
				} else if (clipDef is red_splash) {
					m.translate(-r.x * 2, -r.y * 2);
				} else {
					m.translate(-r.x, -r.y);
				}
				m.scale(clip.scaleX, clip.scaleY);
				bitmapData.draw(clip, m);
				frames.push(bitmapData);
			}
			bitmap.x = r.x;
			bitmap.y = r.y;
			//bitmap.smoothing = true;
		}
		
		public function buildCacheFromClip2(_clip:MovieClip):void {
			clip = _clip;
			
			if (clip["e_bounds"] != null) {
				var c = clip["e_bounds"];
				r = new Rectangle(c.x, c.y, c.width, c.height);
				clip["e_bounds"].visible = false;
			} else {
				r = clip.getRect(clip)
			}
			
			cols = Math.floor(2880 / r.width);
			rows = Math.ceil(clip.totalFrames / cols);
			
			bigBitmap = new BigAssCanvas(Math.ceil(cols * clip.width), Math.ceil(rows * clip.height), true);
			
			for (var i = 0; i <= clip.totalFrames - 1; i++) {
				clip.gotoAndStop(i + 1)
				makeAllChildrenGoToFrame(clip, i + 1);
				
				var xx = i % cols * r.width;
				var yy = Math.floor(i / cols) * r.height;
				
				var m:Matrix = new Matrix();
				m.translate(-r.x, -r.y);
				
				m.scale(clip.scaleX, clip.scaleY);
				m.translate(xx, yy)
				
				bigBitmap.draw(clip, m, null, null);
			}
			_totalFrames = clip.totalFrames;
		}
		
		private function makeAllChildrenGoToFrame(m:MovieClip, f:int):void {
			for (var i:int = 0; i < m.numChildren; i++) {
				var c = m.getChildAt(i);
				if (c is MovieClip) {
					makeAllChildrenGoToFrame(c, f);
					c.gotoAndStop(f);
				}
			}
		}
		
		public function play():void {
			_playing = true;
			addEventListener(Event.ENTER_FRAME, enterFrame, false, 0, true);
		}
		
		public function stop():void {
			_playing = false;
			removeEventListener(Event.ENTER_FRAME, enterFrame)
		}
		
		public function gotoAndStop(frame:Number):void {
			if (treatAsLoopedGraphic) {
				if (frame > totalFrames) {
					frame = frame % totalFrames;
				}
			}
			currentFrame = frame;
			
			goto(currentFrame);
			stop();
		}
		
		public function gotoAndPlay(frame:Number):void {
			currentFrame = frame;
			goto(currentFrame);
			play();
		}
		
		public function gotoAndPlayRandomFrame():void {
			gotoAndPlay(Math.ceil(Math.random() * totalFrames));
		}
		
		public function nextFrame(useSpeed:Boolean = false):void {
			useSpeed ? currentFrame += speed : currentFrame++;
			if (currentFrame > totalFrames)
				currentFrame = 1;
			goto(Math.floor(currentFrame));
		}
		
		public function prevFrame(useSpeed:Boolean = false):void {
			useSpeed ? currentFrame -= speed : currentFrame--;
			
			if (currentFrame < 1)
				currentFrame = totalFrames;
			goto(Math.floor(currentFrame));
		}
		import flash.utils.getQualifiedClassName;
		
		private function goto(frame:Number):void {
			if (!_cache) {
				if (!clipData) {
					var c = getQualifiedClassName(clip);
					clipData = new (getDefinitionByName(c))();
					var rect:Rectangle = clipData.getRect(clipData);
					clipData.x = rect.x;
					clipData.y = rect.y;
					addChild(clipData);
				}
				clipData.gotoAndStop(frame);
			} else {
				
				if (useSpriteSheet) {
					var temp:Rectangle = r.clone();
					temp.x = ((currentFrame - 1) % cols) * r.width;
					temp.y = Math.floor((currentFrame - 1) / cols) * r.height;
					
					if (bitmapData)
						bitmapData.dispose();
					bitmapData = bigBitmap.copyPixelsOut(temp);
					bitmap.bitmapData = bitmapData;
					bitmap.smoothing = true;
				} else {
					bitmap.bitmapData = frames[currentFrame - 1];
					bitmap.smoothing = true;
				}
			}
		}
		
		public function enterFrame(e:Event = null):void {
			if (reverse) {
				prevFrame(true)
			} else {
				nextFrame(true);
			}
			
			if (currentFrame >= totalFrames) {
				
				if (!repeat) {
					stop();
				}
				dispatchEvent(new Event(Event.COMPLETE))
				if (onEnd != null)
					onEnd();
			}
		}
		
		public function update():void {
			//addChild(bigBitmap);
			stop();
			frames = [];
			buildCacheFromClip(clip);
		}
		
		public function destroy() {
			stop();
			if (parent)
				parent.removeChild(this);
		}
	}
}
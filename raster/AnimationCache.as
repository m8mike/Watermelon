package {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.setTimeout;
	
	public class AnimationCache extends EventDispatcher { 
		private static var animations:Array = [];
		
		public static function cacheAnimation(identifier:String):Animation {
			var animation:Animation;
			if (!animations[identifier]) {
				animation = new Animation();
				animation.buildCacheFromLibrary(identifier);
				animations[identifier] = animation;
			} else {
				animation = animations[identifier];
			}
			return animation;
		}
		
		public static function getAnimation(id):Animation {
			if (!animations[id]) {
				trace("MISSING ANIMATION :" + id);
				return null;
			}
			var animation:Animation = new Animation();
			animation.frames = animations[id].frames;
			animation.bitmap.x = animations[id].bitmap.x
			animation.bitmap.y = animations[id].bitmap.y
			animation.clip = animations[id].clip;
			animation.gotoAndStop(1);
			return animation;
		}
	}
}
package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class ButtonMute {
		private static var costumeOn:MovieClip;
		private static var costumeOff:MovieClip;
		
		public function ButtonMute() {
		
		}
		
		public static function show(parent:DisplayObjectContainer):void {
			if (!costumeOn) {
				costumeOn = new volume_on();
				costumeOn.x = 600;
				costumeOn.y = 30;
				costumeOn.scaleX = 0.2;
				costumeOn.scaleY = 0.2;
				costumeOff = new volume_off();
				costumeOff.x = 600;
				costumeOff.y = 30;
				costumeOff.scaleX = 0.2;
				costumeOff.scaleY = 0.2;
			}
			if (SoundMusic.getVolume()) {
				costumeOn.visible = true;
				costumeOff.visible = false;
			} else {
				costumeOn.visible = false;
				costumeOff.visible = true;
			}
			if (costumeOn.parent) {
				costumeOn.parent.removeChild(costumeOn);
			}
			if (costumeOn.hasEventListener(MouseEvent.CLICK)) {
				costumeOn.removeEventListener(MouseEvent.CLICK, musicOff);
			}
			if (costumeOff.parent) {
				costumeOff.parent.removeChild(costumeOff);
			}
			if (costumeOff.hasEventListener(MouseEvent.CLICK)) {
				costumeOff.removeEventListener(MouseEvent.CLICK, musicOn);
			}
			//costumeOn.visible = true;
			parent.addChild(costumeOn);
			parent.addChild(costumeOff);
			costumeOn.addEventListener(MouseEvent.CLICK, musicOff);
			costumeOff.addEventListener(MouseEvent.CLICK, musicOn);
		}
		
		private static function musicOff(e:MouseEvent):void {
			costumeOn.visible = false;
			costumeOff.visible = true;
			SoundMusic.setVolume(0);
			SoundMusic.setSoundVolume(0);
		}
		
		private static function musicOn(e:MouseEvent):void {
			costumeOn.visible = true;
			costumeOff.visible = false;
			SoundMusic.setVolume(1);
			SoundMusic.setSoundVolume(1);
		}
		
		public static function hide():void {
			if (costumeOn) {
				costumeOn.visible = false;
				costumeOff.visible = false;
			}
		}
	}

}
package {
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class SoundMusic {
		private static var menuMusic:Sound = new music_menu();
		private static var menuChannel:SoundChannel;
		private static var menuMusicPlaying:Boolean = false;
		private static var inGameMusicPlaying:Boolean = false;
		private static var currentChannel:SoundChannel;
		private static var music1:Sound = new swing();
		private static var music2:Sound = new borsh();
		private static var music3:Sound = new megatron();
		private static var swingChannel:SoundChannel;
		private static var borshChannel:SoundChannel;
		private static var megatronChannel:SoundChannel;
		private static var st:SoundTransform;
		private static var stSound:SoundTransform;
		
		public static function playInGame():void {
			if (!inGameMusicPlaying) {
				inGameMusicPlaying = true;
				if (CarbonMenu.levelCursor.location.x == 0) {
					if (!swingChannel) {
						swingChannel = new SoundChannel();
						swingChannel.soundTransform = st;
					}
					swingChannel = music1.play(0, 1000000, st);
					currentChannel = swingChannel;
				} else if (CarbonMenu.levelCursor.location.x == 1) {
					if (!borshChannel) {
						borshChannel = new SoundChannel();
						borshChannel.soundTransform = st;
					}
					borshChannel = music2.play(0, 1000000, st);
					currentChannel = borshChannel;
				} else if (CarbonMenu.levelCursor.location.x == 2) {
					if (!megatronChannel) {
						megatronChannel = new SoundChannel();
						megatronChannel.soundTransform = st;
					}
					megatronChannel = music3.play(0, 1000000, st);
					currentChannel = megatronChannel;
				}
			}
		}
		
		public static function stopInGame():void {
			if (inGameMusicPlaying) {
				inGameMusicPlaying = false;
				currentChannel.stop();
			}
		}
		
		public static function playMenu():void {
			if (!menuMusicPlaying) {
				menuMusicPlaying = true;
				if (!menuChannel) {
					menuChannel = new SoundChannel();
					st = new SoundTransform();
					menuChannel.soundTransform = st;
					stSound = new SoundTransform();
				}
				menuChannel = menuMusic.play(0, 1000000, st);
			}
		}
		
		public static function stopMenu():void {
			if (menuMusicPlaying) {
				menuMusicPlaying = false;
				menuChannel.stop();
			}
		}
		
		public static function playJump():void {
			var jumpSound:Sound;
			/*var randomNumber:int = Math.random() * 5;
			switch (randomNumber) {
				case 0:
					jumpSound = new c7();
				break;
				case 1:
					jumpSound = new c8();
				break;
				case 2:
					jumpSound = new e7();
				break;
				case 3:
					jumpSound = new g7();
				break;
				default:
					jumpSound = new g7();
			}*/
			jumpSound = new vg();
			jumpSound.play(0, 0, stSound);
		}
		
		public static function playPopBubble():void {
			var hitSound:Sound;
			hitSound = new pop_bubble();
			hitSound.play(0, 0, stSound);
		}
		
		public static function playBoink():void {
			var hitSound:Sound;
			hitSound = new boink();
			hitSound.play(0, 0, stSound);
		}
		
		public static function playChoom():void {
			var hitSound:Sound;
			hitSound = new choomier();
			hitSound.play(0, 0, stSound);
		}
		
		public static function setSoundVolume(volume:Number):void {
			stSound.volume = volume;
		}
		
		public static function setVolume(volume:Number):void {
			st.volume = volume;
			if (menuChannel) {
				menuChannel.soundTransform = st;
			}
			if (swingChannel) {
				swingChannel.soundTransform = st;
			}
			if (borshChannel) {
				borshChannel.soundTransform = st;
			}
			if (megatronChannel) {
				megatronChannel.soundTransform = st;
			}
		}
		
		public static function getVolume():Number {
			if (st) {	
				return st.volume;
			} else {
				return 1;
			}
		}
	}
}
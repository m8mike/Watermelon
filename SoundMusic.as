package {
	import flash.media.Sound;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class SoundMusic {
		
		public static function playJump():void {
			var jumpSound:Sound;
			var randomNumber:int = Math.random() * 5;
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
			}
			jumpSound.play();
		}
		
		public static function playPopBubble():void {
			var hitSound:Sound;
			hitSound = new pop_bubble();
			hitSound.play();
		}
		
		public static function playBoink():void {
			var hitSound:Sound;
			hitSound = new boink();
			hitSound.play();
		}
		
		public static function playChoom():void {
			var hitSound:Sound;
			hitSound = new choom();
			hitSound.play();
		}
	}
}
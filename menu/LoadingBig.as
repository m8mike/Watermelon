package {
	import flash.display.MovieClip;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LoadingBig extends Decor {
		private var bigWatermelon:MovieClip;
		public var loaded:Boolean = false;
		
		public function LoadingBig() {
			bigWatermelon = new loadingBackground();
			CameraManager.loadingScreen.addChild(bigWatermelon);
		}
		
		override public function updateNow():void {
			if (bigWatermelon.currentFrame < 35) {
				
			} else if (bigWatermelon.currentFrame == 35) {
				if (loaded) {
					bigWatermelon.play();
				} else {
					bigWatermelon.stop();
				}
			} else if (bigWatermelon.currentFrame == 45) {
				bigWatermelon.stop();
				bigWatermelon.parent.removeChild(bigWatermelon);
				this.remove();
			}
			super.updateNow();
		}
		
		public function setLoaded():void {
			loaded = true;
		}
	}
}
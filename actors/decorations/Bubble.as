package {
	import flash.display.MovieClip;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Bubble extends Decor {
		var bubble:MovieClip;
		public function Bubble(x:Number, y:Number) {
			bubble = new bubbleBonus()
			bubble.x = x;
			bubble.y = y;
			bubble.scaleX = 0.17;
			bubble.scaleY = 0.17;
			bubble.gotoAndStop(1);
			CameraManager._dynamicLayer.addChild(bubble);
		}
		
		override public function updateNow():void {
			if (bubble.currentFrame == 13) {
				destroy();
			}
			super.updateNow();
		}
		
		override protected function cleanUpBeforeRemoving():void {
			bubble.stop();
			bubble.parent.removeChild(bubble);
			bubble = null;
			super.cleanUpBeforeRemoving();
		}
		
		public function pop() {
			if (bubble.currentFrame == 1) {
				bubble.gotoAndPlay(2);
			}
		}
		
	}
}
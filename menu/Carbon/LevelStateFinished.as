package {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelStateFinished extends LevelState {
		
		public function LevelStateFinished() {
		
		}
		
		override public function getAnimation(x:int, y:int):MovieClip {
			costume = new level_complete();
			costume.play();
			costume.addEventListener(Event.ENTER_FRAME, playOnlyOnce);
			return costume;
		}
		
		override public function getSprite(x:int, y:int):MovieClip {
			costume = new level_completed();
			costume.x = x;
			costume.y = y;
			costume.width = 60;
			costume.height = 60;
			return costume;
		}
		
		public function getAnotherSprite():MovieClip {
			costume = new level_completed();
			return costume;
		}
		
		private function playOnlyOnce(e:Event):void {
			var costume:MovieClip = MovieClip(e.target);
			if (costume.currentFrame == 10) {
				costume.stop();
				costume.parent.removeChild(costume);
				costume.removeEventListener(Event.ENTER_FRAME, playOnlyOnce);
			}
		}
	}
}
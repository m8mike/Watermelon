package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelStateOpen extends LevelState {
		
		public function LevelStateOpen() {
		
		}
		
		override public function getSprite(x:int, y:int):MovieClip {
			sprite = new MovieClip();
			sprite.x = x;
			sprite.y = y;
			sprite.graphics.beginFill(0x00FF00);
			sprite.graphics.lineStyle(LevelState.STROKE, 0x008040);
			sprite.graphics.drawRoundRect(0, 0, LevelState.SIZE, LevelState.SIZE, 0.1 * LevelState.SIZE);
			sprite.graphics.endFill();
			return sprite;
		}
	}
}
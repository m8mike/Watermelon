package {
	import flash.display.MovieClip;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelStateClosed extends LevelState {
		
		public function LevelStateClosed() {
		
		}
		
		override public function getSprite(x:int, y:int):MovieClip {
			sprite = new MovieClip();
			sprite.x = x;
			sprite.y = y;
			sprite.graphics.beginFill(0x008080);
			sprite.graphics.lineStyle(LevelState.STROKE, 0x000000);
			sprite.graphics.drawRoundRect(0, 0, LevelState.SIZE, LevelState.SIZE, 0.1 * LevelState.SIZE);
			sprite.graphics.endFill();
			return sprite;
		}
	}
}
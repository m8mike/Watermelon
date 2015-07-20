package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelStateClosed extends LevelState {
		
		public function LevelStateClosed() {
			
		}
		
		override public function addCostume(x:int, y:int, parent:DisplayObjectContainer, listener:Function):void {
			costume = new AnimationCostume("level_closed", parent);
			costume.setCoords(x, y);
			costume.animation.visible = true;
			costume.animation.addEventListener(MouseEvent.CLICK, listener);
		}
	}
}
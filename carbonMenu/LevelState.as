package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelState {
		protected var costume:AnimationCostume;
		public static const SIZE:int = 60;
		public static const STROKE:int = 10;
		
		
		public function LevelState() {
			
		}
		
		public function addCostume(x:int, y:int, parent:DisplayObjectContainer, listener:Function):void {
		}
		
		public function remove():void {
			costume.remove();
		}
		
		public function moveUp():void {
			costume.animation.y -= LevelList.OFFSET_BETWEEN_LEVELS;
		}
	}
}
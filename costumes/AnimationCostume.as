package  
{
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class AnimationCostume extends Costume
	{
		public var animation:Animation;
		public var id:String;
		private var startFrame:int = 1;
		private var stopFrame:int;
		public function AnimationCostume(id:String, parent:DisplayObjectContainer, 
										scaleX:Number = 1, scaleY:Number = 1, stopFrame = 0)
		{
			this.stopFrame = stopFrame;
			this.id = id;
			if (id == "go_right" || id == "go_left") {
				startFrame = 16;
			}
			animation = Raster.getAnimation(id);
			animation.scaleX = scaleX;
			animation.scaleY = scaleY;
			animation.visible = false;
			animation.gotoAndStop(1);
			parent.addChild(animation);
		}
		
		public function play():void {
			animation.gotoAndPlay(startFrame);
			animation.visible = true;
		}
		
		public function checkAndStop():Boolean {
			if (stopFrame != 0) {
				if (animation.currentFrame == stopFrame) {
					animation.stop();
					return true;
				}
			}
			return false;
		}
		
		public function setCoords(x:Number, y:Number):void {
			animation.x = x;
			animation.y = y;
		}
		
		public function hide():void {
			animation.stop();
			animation.visible = false;
		}
		
		public function remove():void {
			animation.destroy();
		}
		
		/*public function setLoc(x:Number, y:Number) {
			animation.x = x;
			animation.y = y;
		}*/
		
	}

}
package {
	import flash.display.DisplayObjectContainer;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class AnimationCostume extends Costume {
		
		public function AnimationCostume(id:String, parent:DisplayObjectContainer, onEnd:Function = null) {
			animation = Raster.getAnimation(id);
			animation.bitmap.visible = false;
			animation.gotoAndStop(1);
			animation.onEnd = onEnd;
			super(id, parent);
		}
	}
}
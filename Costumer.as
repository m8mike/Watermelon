package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Costumer {
		
		public function Costumer() {
			var anim:MovieClip = new go_right();
			Platformer.thisIs.addChild(anim);
			anim.gotoAndStop(1);
			trace("frames " + anim.totalFrames);
			trace("children " + anim.numChildren);
			hideAll(anim, 0);
			hideAll(DisplayObjectContainer(anim.getChildAt(0)), 0);
			trace("width " + anim.width);
			trace("height " + anim.height);
			/*Raster.c
			var s:AnimationCostume = new AnimationCostume(""*/
			//traceChildren(anim);
		}
		
		public static function hideAll(mc:DisplayObjectContainer, except:int = -1):void {
			for (var i:int = 0; i < mc.numChildren; i++) {
				mc.getChildAt(i).visible = false;
			}
			if (except != -1) {
				mc.getChildAt(except).visible = true;
			}
		}
		
		public static function traceChildren(mc:DisplayObjectContainer):void {
			trace("<inside>");
			for (var i:int = 0; i < mc.numChildren; i++) {
				if (mc.getChildAt(i) is DisplayObjectContainer) {
					traceChildren(DisplayObjectContainer(mc.getChildAt(i)));
				}
				trace(mc.getChildAt(i).toString());
				trace("width " + mc.width);
				trace("height " + mc.height);
			}
			trace("</inside>");
		}
	
	}

}
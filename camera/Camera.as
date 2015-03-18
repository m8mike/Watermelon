package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Camera extends Sprite {
		//private static const ZOOM_IN_AMT:Number = 7.5;//1.7//3.0//7.5true
		public var ZOOM:Number; //1.7//3.0//7.5true
		public var SLOW_DOWN:Number;
		
		public function Camera(zoom:Number, slowDown:Number = 0) {
			ZOOM = zoom;
			if (slowDown == 0) {
				SLOW_DOWN = ZOOM;
			} else {
				SLOW_DOWN = slowDown;
			}
		}
		
		public function zoomTo(whatPoint:Point, zoomRatio:Number):void {
			this.scaleX = ZOOM * zoomRatio;
			this.scaleY = ZOOM * zoomRatio;
			/*this.scaleX = zoomRatio;
			this.scaleY = zoomRatio;*/
			this.x = 320 - (whatPoint.x * SLOW_DOWN * zoomRatio);
			this.y = 240 - (whatPoint.y * SLOW_DOWN * zoomRatio);
		}
	}
}
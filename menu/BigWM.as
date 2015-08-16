package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class BigWM extends MovieClip {
		private var bigWM:MovieClip;
		private var letItOut:Boolean = false;
		private var _parent:DisplayObjectContainer;
		
		public function BigWM(parent:DisplayObjectContainer) {
			_parent = parent;
			bigWM = new loadingBackground();
			addChild(bigWM);
			parent.addChild(this);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void {
			if (bigWM) {
				if (bigWM.currentFrame == 51) {
					bigWM.gotoAndStop(52);
					onIn();
				} else if (bigWM.currentFrame == 52) {
					if (letItOut) {
						bigWM.gotoAndPlay(53);
					}
				} else if (bigWM.currentFrame >= 70) {
					letItOut = false;
					bigWM.stop();
					bigWM.visible = false;
					remove();
				}
			}
		}
		
		public function remove():void {
			bigWM.removeEventListener(Event.ENTER_FRAME, update);
			if (parent) {
				parent.removeChild(this);
			}
		}
		
		public function hide():void {
			onOut();
			bigWM.visible = true;
			letItOut = true;
		}
		
		public function show():void {
			if (!parent) {
				_parent.addChild(this);
			}
			onIn();
			bigWM.gotoAndPlay(1);
			bigWM.visible = true;
			letItOut = false;
			if (!bigWM.hasEventListener(Event.ENTER_FRAME)) {
				bigWM.addEventListener(Event.ENTER_FRAME, update);
			}
		}
		
		public function onIn():void {
			
		}
		
		public function onOut():void {
			
		}
	}
}
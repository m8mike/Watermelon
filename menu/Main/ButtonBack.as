package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class ButtonBack {
		private static var costume:MovieClip;
		private static var fun:Function;
		
		public function ButtonBack() {
			
		}
		
		public static function show(parent:DisplayObjectContainer, onClick:Function):void {
			if (!costume) {	
				costume = new button_back();
				costume.x = 30;
				costume.y = 450;
				costume.scaleX = 0.2;
				costume.scaleY = 0.2;
			}
			if (costume.parent) {
				costume.parent.removeChild(costume);
			}
			if (costume.hasEventListener(MouseEvent.CLICK)) {
				costume.removeEventListener(MouseEvent.CLICK, fun);
			}
			costume.visible = true;
			parent.addChild(costume);
			costume.addEventListener(MouseEvent.CLICK, onClick);
			MainMenu.getStage().addEventListener(KeyboardEvent.KEY_DOWN, handleEscape);
			fun = onClick;
		}
		
		public static function hide():void {
			if (costume) {	
				costume.visible = false;
				costume.removeEventListener(MouseEvent.CLICK, fun);
			}
			MainMenu.getStage().removeEventListener(KeyboardEvent.KEY_DOWN, handleEscape);
		}
		
		private static function handleEscape(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case 8: //backspace
					fun(new MouseEvent(MouseEvent.CLICK));
					MainMenu.getStage().removeEventListener(KeyboardEvent.KEY_DOWN, handleEscape);
					//remove();
					break;
				case 27: //esc
					fun(new MouseEvent(MouseEvent.CLICK));
					MainMenu.getStage().removeEventListener(KeyboardEvent.KEY_DOWN, handleEscape);
					//remove();
					break;
			}
		}
	}
}
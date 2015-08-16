package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class MenuList extends MovieClip {
		private var current:int;
		public var items:Array = [];
		public var pressed:int = -1;
		
		public function MenuList(parent:DisplayObjectContainer) {
			parent.addChild(this);
		}
		
		public function initAsMainMenu(levelSelect:Function, settings:Function, achievements:Function, complete:Function):void {
			items.push(new MenuItem("Play", this, levelSelect));
			items.push(new MenuItem("Settings", this, settings));
			//items.push(new MenuItem("Achievements", this, achievements));
			items.push(new MenuItem("Credits", this, complete));
			setCurrent(0);
		}
		
		public function initAsEscapeMenu(resume:Function, settings:Function, achievements:Function, restart:Function, quit:Function):void {
			y -= 40;
			items.push(new MenuItem("Resume", this, resume)); // remove escape menu
			items.push(new MenuItem("Settings", this, settings));
			//items.push(new MenuItem("Achievements", this, achievements));
			items.push(new MenuItem("Restart", this, restart)); //remove escape menu
			items.push(new MenuItem("Quit", this, quit)); // go to main
			setCurrent(0);
		}
		
		public function setCurrent(index:int):void {
			if (pressed != -1) return void;
			for each (var i:MenuItem in items) {
				i.makeWhite();
			}
			current = index;
			MenuItem(items[current]).makeGreen();
		}
		
		public function unpress(e:MouseEvent):void {
			if (pressed != -1) {
				MenuItem(items[pressed]).itemText.x -= 4;
				MenuItem(items[pressed]).itemText.y -= 4;
				pressed = -1;
			}
		}
		
		public function controlMenu(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case 38: //Up
					if (current == 0) {
						setCurrent(items.length - 1);
					} else {
						setCurrent(current - 1);
					}
					break;
				case 87: //w
					if (current == 0) {
						setCurrent(items.length - 1);
					} else {
						setCurrent(current - 1);
					}
					break;
				case 40: //Down
					if (current == items.length - 1) {
						setCurrent(0);
					} else {
						setCurrent(current + 1);
					}
					break;
				case 83: //s
					if (current == items.length - 1) {
						setCurrent(0);
					} else {
						setCurrent(current + 1);
					}
					break;
				case 13: //enter
						MenuItem(items[current]).onClick(null);
					break;
			}
		}
		
		private function allowControls():void {
			MainMenu.getStage().addEventListener(KeyboardEvent.KEY_DOWN, controlMenu);
			MainMenu.thisIs.addEventListener(MouseEvent.MOUSE_UP, unpress);	
		}
		
		private function disallowControls():void {
			MainMenu.getStage().removeEventListener(KeyboardEvent.KEY_DOWN, controlMenu);
			MainMenu.thisIs.removeEventListener(MouseEvent.MOUSE_UP, unpress);	
		}
		
		public function hide():void {
			for each (var item:MenuItem in items) {
				item.hide();
			}
			disallowControls();
		}
		
		public function show():void {
			for each (var item:MenuItem in items) {
				item.show();
			}
			allowControls();
			ButtonMute.hide();
			ButtonMute.show(parent);
		}
		
		public function remove():void {
			for each (var item:MenuItem in items) {
				item.remove();
			}
			parent.removeChild(this);
		}
	}
}
package {
	import flash.display.DisplayObjectContainer;
	import flash.events.KeyboardEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Settings {
		private var fullScreen:CheckBox;
		private var music:ScrollBar;
		private var sound:ScrollBar;
		private var parent:DisplayObjectContainer;
		
		public function Settings(parent:DisplayObjectContainer) {
			this.parent = parent;
			fullScreen = new CheckBox(parent, 280, 100, "Full Screen");
			music = new ScrollBar(parent, 280, 200, "Music");
			sound = new ScrollBar(parent, 280, 300, "Sound");
			fullScreen.select();
		}
		
		public function allowControls():void {
			MainMenu.getStage().addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		}
		
		public function disallowControls():void {
			MainMenu.getStage().removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		}
		
		private function keyDown(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case 38: //up
					if (fullScreen.selected) {
						fullScreen.diselect();
						sound.select();
					} else if (music.selected) {
						music.diselect();
						fullScreen.select();
					} else if (sound.selected) {
						sound.diselect();
						music.select();
					}
					break;
				case 40: //down
					if (fullScreen.selected) {
						fullScreen.diselect();
						music.select();
					} else if (music.selected) {
						music.diselect();
						sound.select();
					} else if (sound.selected) {
						sound.diselect();
						fullScreen.select();
					}
					break;
			}
		}
		
		public function hide():void {
			fullScreen.hide();
			music.hide();
			sound.hide();
			fullScreen.diselect();
			music.diselect();
			sound.diselect();
			parent.visible = false;
		}
		
		public function show():void {
			fullScreen.select();
			fullScreen.show();
			music.show();
			sound.show();
			parent.visible = true;
		}
	}
}
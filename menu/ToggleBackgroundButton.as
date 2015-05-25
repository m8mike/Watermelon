package {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class ToggleBackgroundButton {
		private var buttonTF:TextField;
		public var enabled:Boolean = false;
		
		public function ToggleBackgroundButton() {
			buttonTF = new TextField();
			buttonTF.x = 150;
			buttonTF.y = 20;
			buttonTF.visible = true;
			buttonTF.selectable = false;
			buttonTF.text = "turn background on";
			var mytf:TextFormat = new TextFormat("Courier New");
			buttonTF.setTextFormat(mytf);
			buttonTF.defaultTextFormat = mytf;
			buttonTF.width = 140;
			buttonTF.height = 20;
			buttonTF.background = true;
			buttonTF.backgroundColor = 0x000000;
			buttonTF.alpha = 0.9;
			buttonTF.textColor = 0xFF0000;
			buttonTF.addEventListener(MouseEvent.CLICK, toggleBackground);
			CameraManager.hud.addChild(buttonTF);
		}
		
		private function toggleBackground(e:Event):void {
			if (enabled) {
				if (LevelDirector.coniferous) {
					LevelDirector.coniferous.remove();
					LevelDirector.coniferous = null;
				} else {
					return void;
				}
				if (LevelDirector.mountains) {
					LevelDirector.mountains.remove();
					LevelDirector.mountains = null;
				} else {
					return void;
				}
				if (LevelDirector.hills) {
					LevelDirector.hills.remove();
					LevelDirector.hills = null;
				} else {
					return void;
				}
			} else {
				if (!LevelDirector.coniferous) {
					LevelDirector.coniferous = new BigConiferous();
				} else {
					return void;
				}
				if (!LevelDirector.mountains) {
					LevelDirector.mountains = new BigMountains();
				} else {
					return void;
				}
				if (!LevelDirector.hills) {
					LevelDirector.hills = new Hills();
				} else {
					return void;
				}
			}
			enabled = !enabled;
			if (enabled) {
				buttonTF.text = "turn background off";
			} else {
				buttonTF.text = "turn background on";
			}
		}
	}
}
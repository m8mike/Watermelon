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
			addButton();
		}
		
		private function addButton():void {
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
		
		public static function addBackground():void {
			if (!LevelDirector.coniferous) {
				LevelDirector.coniferous = new BigConiferous();
			}
			if (!LevelDirector.mountains) {
				LevelDirector.mountains = new BigMountains();
			}
			if (!LevelDirector.hills) {
				LevelDirector.hills = new Hills();
			}
		}
		
		private function removeBackground():void {
			if (LevelDirector.coniferous) {
				LevelDirector.coniferous.remove();
				LevelDirector.coniferous = null;
			}
			if (LevelDirector.mountains) {
				LevelDirector.mountains.remove();
				LevelDirector.mountains = null;
			}
			if (LevelDirector.hills) {
				LevelDirector.hills.remove();
				LevelDirector.hills = null;
			}
		}
		
		private function toggleBackground(e:Event):void {
			if (enabled) {
				removeBackground();
			} else {
				addBackground();
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
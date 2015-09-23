package {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class EditorBackground {
		private static var buttonTF:TextField;
		public static var enabled:Boolean = false;
		
		public static var _numScrollers:Array = [];
		
		public function EditorBackground() {
			addButton();
			addNumScrollers();
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
		
		private static function removeBackground():void {
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
		
		public static function toggleBackground(e:Event):void {
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
		
		public function addNumScrollers():void {
			_numScrollers.push(new NumScroller(CameraManager.hud, Hills.line1, "hills01"));
			_numScrollers.push(new NumScroller(CameraManager.hud, Hills.line2, "hills02"));
			_numScrollers.push(new NumScroller(CameraManager.hud, Hills.line3, "hills03"));
			_numScrollers.push(new NumScroller(CameraManager.hud, Hills.line4, "hills04"));
			_numScrollers.push(new NumScroller(CameraManager.hud, BigConiferous.coniferous, "coniferous"));
			_numScrollers.push(new NumScroller(CameraManager.hud, BigMountains.funkyMountains, "mountains"));
		}
		
		public function setNumScrollersVisibility(vis:Boolean):void {
			for each (var numScroller:NumScroller in _numScrollers) {
				numScroller.visible = vis;
			}
		}
	}
}
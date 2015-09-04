package {
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CheatCode {
		private static var code:String = "";
		
		public function CheatCode() {
		
		}
		
		public static function check(e:KeyboardEvent):void {
			if (e.keyCode == Keyboard.I) {
				code = "i";
			} else if (e.keyCode == Keyboard.A) {
				if (code == "i") {
					code = "ia";
				} else if (code == "iamcre") {
					code = "iamcrea";
				} else {
					code = "";
				}
			} else if (e.keyCode == Keyboard.M) {
				if (code == "ia") {
					code = "iam";
				} else {
					code = "";
				}
			} else if (e.keyCode == Keyboard.C) {
				if (code == "iam") {
					code = "iamc";
				} else {
					code = "";
				}
			} else if (e.keyCode == Keyboard.R) {
				if (code == "iamc") {
					code = "iamcr";
				} else if (code == "iamcreato") {
					code = "";
					iAmCreator();
				} else {
					code = "";
				}
			} else if (e.keyCode == Keyboard.E) {
				if (code == "iamcr") {
					code = "iamcre";
				} else {
					code = "";
				}
			} else if (e.keyCode == Keyboard.T) {
				if (code == "iamcrea") {
					code = "iamcreat";
				} else {
					code = "";
				}
			} else if (e.keyCode == Keyboard.O) {
				if (code == "iamcreat") {
					code = "iamcreato";
				} else {
					code = "";
				}
			} else {
				code = "";
			}
		}
		
		private static function iAmCreator():void {
			CameraManager.hud.visible = !CameraManager.hud.visible;
			CarbonMenu.levelList.unlockAll();
		}
	
	}

}
package {
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Inventory extends Decor {
		public var _lifes:Array = [];
		public var _keys:Array = [];
		public var diamondCount:int = 0;
		
		public static const MAX_LIFES:int = 5;
		public static const MAX_KEYS:int = 3;
		
		private var diamondIcon:AnimationCostume;
		private var diamondText:TextField;
		
		private var jetpackText:TextField;
		
		public function Inventory() {
		
		}
		
		public function addDiamond():void {
			diamondCount++;
			if (!diamondIcon) {
				diamondIcon = new AnimationCostume("diamond_bonus", CameraManager.hud, 0.5, 0.5);
				diamondIcon.setCoords(50, 50);
				diamondIcon.animation.visible = true;
				diamondText = new TextField();
				diamondText.x = 80;
				diamondText.y = 40;
				diamondText.visible = true;
				diamondText.selectable = false;
				diamondText.text = "x " + diamondCount.toString();
				var mytf:TextFormat = new TextFormat("Zorque-Regular");
				mytf.size = 22;
				diamondText.setTextFormat(mytf);
				diamondText.defaultTextFormat = mytf;
				diamondText.width = 200;
				diamondText.height = 60;
				diamondText.textColor = 0x004080;
				CameraManager.hud.addChild(diamondText);
			} else {
				diamondText.text = "x " + diamondCount.toString();
			}
		}
		
		public function addLife():void {
			if (_lifes.length < MAX_LIFES) {
				var hpHeart:MovieClip = new heart();
				hpHeart.x = 60 + _lifes.length * 40;
				hpHeart.y = 420;
				hpHeart.scaleX = 0.5;
				hpHeart.scaleY = 0.5;
				CameraManager.hud.addChild(hpHeart);
				_lifes.push(hpHeart);
			}
		}
		
		public function removeLife():void {
			if (_lifes.length > 0) {
				for (var i:int = CameraManager.hud.numChildren - 1; i > 0; i--) {
					if (CameraManager.hud.getChildAt(i) is heart) {
						CameraManager.hud.removeChildAt(i);
						break;
					}
				}
				_lifes.splice(_lifes.length - 1, 1);
			}
		}
		
		public function addKey():void {
			if (_keys.length < MAX_KEYS) {
				var key:MovieClip = new key1();
				key.x = 500 + _keys.length * 40;
				key.y = 40;
				key.scaleX = 0.5;
				key.scaleY = 0.5;
				CameraManager.hud.addChild(key);
				_keys.push(key);
			}
		}
		
		public function removeKey():void {
			if (_keys.length > 0) {
				for (var i:int = CameraManager.hud.numChildren - 1; i > 0; i--) {
					if (CameraManager.hud.getChildAt(i) is key1) {
						CameraManager.hud.removeChildAt(i);
						break;
					}
				}
				_keys.splice(_keys.length - 1, 1);
			}
		}
		
		public function addJetpackTime():void {
			if (jetpackText) {
				jetpackText.visible = true;
				return void;
			}
			jetpackText = new TextField();
			jetpackText.x = 490;
			jetpackText.y = 10;
			jetpackText.visible = true;
			jetpackText.selectable = false;
			jetpackText.text = "Jetpack: 100";
			var mytf:TextFormat = new TextFormat("Zorque-Regular");
			mytf.size = 22;
			jetpackText.setTextFormat(mytf);
			jetpackText.defaultTextFormat = mytf;
			jetpackText.width = 200;
			jetpackText.height = 60;
			jetpackText.textColor = 0x004080;
			CameraManager.hud.addChild(jetpackText);
		}
		
		public function setJetpackTime(time:int):void {
			jetpackText.text = "Jetpack: " + time.toString();
		}
		
		public function removeJetpackTime():void {
			if (jetpackText) {
				if (jetpackText.parent) {	
					jetpackText.parent.removeChild(jetpackText);
				}
			}
		}
		
		public function removeDiamonds():void {
			diamondCount = 0;
			if (diamondIcon) {
				diamondIcon.remove();
			}
			if (diamondText) {
				if (diamondText.parent) {	
					diamondText.parent.removeChild(diamondText);
				}
			}
		}
		
		public function hideJetpackTime():void {
			if (jetpackText) {
				jetpackText.visible = false;
			} else {
				trace("error jetpack time removing while there is no jetpack time");
			}
		}
	}
}
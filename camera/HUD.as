package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class HUD {
		public var _lifes:Array = [];
		public var _keys:Array = [];
		public static var _info:Array = [];
		public static var _edit:Array = [];
		public static var _changes:Array = [];
		public static const MAX_LIFES:int = 5;
		public static const MAX_KEYS:int = 3;
		
		public static var ib:MovieClip;
		public static var rb:MovieClip;
		public static var respB:MovieClip;
		
		public function HUD() {
			
		}
		
		public static function hideInfo():void {
			for each (var tf:TextField in _info) {
				tf.visible = false;
			}
		}
		
		public static function showInfo():void {
			for each (var tf:TextField in _info) {
				tf.visible = true;
			}
		}
		
		public static function addRespawnButton():void {
			respB = new hat03();
			respB.x = 30;
			respB.y = 30;
			respB.scaleX = 0.1;
			respB.scaleY = 0.1;
			respB.visible = true;
			CameraManager.hud.addChild(respB);
			respB.addEventListener(MouseEvent.CLICK, respawn);
		}
		
		public static function addReloadButton():void {
			rb = new hat02();
			rb.x = 500;
			rb.y = 18 * 20;
			rb.scaleX = 0.1;
			rb.scaleY = 0.1;
			rb.visible = true;
			CameraManager.hud.addChild(rb);
			rb.addEventListener(MouseEvent.CLICK, reloadPlatform);
		}
		
		public static function addInvisibleButton():void {
			ib = new MovieClip();
			ib.graphics.beginFill(0x000000, 0);
			ib.graphics.drawRect( -1000, -1000, 5000, 5000);
			ib.graphics.endFill();
			CameraManager.invisibleButtons.addChild(ib);
		}
		
		public static function addCheckBox(enabled:Boolean, num:int):void {
			var cb:MyCheckBox = new MyCheckBox(enabled, num);
			_changes.push(cb);
		}
		
		public static function addInfoText(text:String):void {
			var tf:TextField = new TextField();
			tf.x = 500;
			tf.y = 20 * _info.length;
			tf.visible = true;
			tf.scaleX = 1;
			tf.scaleY = 1;
			tf.selectable = false;
			tf.text = text;
			var mytf:TextFormat = new TextFormat("Courier New");
			tf.setTextFormat(mytf);
			tf.defaultTextFormat = mytf;
			tf.width = 200;
			tf.height = 20;
			tf.background = true;
			tf.backgroundColor = 0x000000;
			tf.alpha = 0.9;
			tf.textColor = 0xFF0000;
			_info.push(tf);
			CameraManager.hud.addChild(tf);	
		}
		
		public static function addEditText(text:String, num:int):void {
			var tf:TextField = new TextField();
			tf.x = 450;
			tf.y = 20 * num;
			tf.visible = true;
			tf.scaleX = 1;
			tf.scaleY = 1;
			tf.selectable = true;
			tf.type = TextFieldType.INPUT;
			tf.addEventListener(Event.CHANGE, changeText);
			tf.text = text;
			var mytf:TextFormat = new TextFormat("Courier New");
			tf.setTextFormat(mytf);
			tf.defaultTextFormat = mytf;
			tf.width = 50;
			tf.height = 20;
			tf.background = true;
			tf.backgroundColor = 0x000000;
			tf.alpha = 0.7;
			tf.textColor = 0xFF0000;
			_edit.push(tf);
			CameraManager.hud.addChild(tf);	
		}
		
		private static function changeText(e:Event):void {
			if (!LevelEditor.currentPlatform) {
				return void;
			}
			var value:Number = Number(TextField(e.target).text);
			var index:int = _edit.indexOf(TextField(e.target));
			switch (index) {
				case 0:
					
				break;
				case 1:
					
				break;
				case 2:
					
				break;
				case 3:
					
				break;
				case 5:
					LevelEditor.currentPlatform.bodyBuilder.density = value;
				break;
				case 6:
					LevelEditor.currentPlatform.bodyBuilder.friction = value;
				break;
				case 7:
					LevelEditor.currentPlatform.bodyBuilder.restitution = value;
				break;
				default:
			}
		}
		
		public static function respawn(e:MouseEvent):void {
			Platformer._player.hide();
			Platformer._player.invincibilityTime = 10000;
		}
		
		public static function reloadPlatform(e:MouseEvent):void {
			var x:Number = Number(TextField(_edit[0]).text) / PhysiVals.MIN_SQARE;
			var y:Number = Number(TextField(_edit[1]).text) / PhysiVals.MIN_SQARE;
			var w:Number = Number(TextField(_edit[2]).text) / PhysiVals.MIN_SQARE;
			var h:Number = Number(TextField(_edit[3]).text) / PhysiVals.MIN_SQARE;
			LevelEditor.currentPlatform.reload(x, y, w, h);
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
	}
}
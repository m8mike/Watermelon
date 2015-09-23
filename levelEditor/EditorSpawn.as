package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class EditorSpawn {
		public static var _spawn:Array = [];
		public static var respawnButton:MovieClip;
		
		public function EditorSpawn() {
			addRespawnButton();
			addRespawnText("40");
			addRespawnText("-120");
		}
		
		public function setVisibility(vis:Boolean):void {
			for each (var tf3:TextField in _spawn) {
				tf3.visible = vis;
			}
			respawnButton.visible = vis;
		}
		
		public static function addRespawnButton():void {
			respawnButton = new hat03();
			respawnButton.x = 100;
			respawnButton.y = 30;
			respawnButton.scaleX = 0.1;
			respawnButton.scaleY = 0.1;
			respawnButton.visible = true;
			CameraManager.hud.addChild(respawnButton);
			respawnButton.addEventListener(MouseEvent.CLICK, respawn);
		}
		
		public static function addRespawnText(text:String):void {
			var tf:TextField = new TextField();
			tf.x = 20;
			tf.y = 80 + 20 * _spawn.length;
			tf.visible = true;
			tf.selectable = true;
			tf.type = TextFieldType.INPUT;
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
			_spawn.push(tf);
			CameraManager.hud.addChild(tf);	
		}
		
		public static function respawn(e:MouseEvent):void {
			Platformer._player.hide();
			Platformer._player.invincibilityTime = 10000;
			Platformer._player.spawnPoint.x = Number(TextField(_spawn[0]).text);
			Platformer._player.spawnPoint.y = Number(TextField(_spawn[1]).text);
		}
	}
}
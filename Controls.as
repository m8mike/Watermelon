package {
	import flash.display.Sprite;
	import flash.display.StageDisplayState;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Controls {
		public var left:Boolean = false;
		public var right:Boolean = false;
		public var up:Boolean = false;
		public var down:Boolean = false;
		public var enter:Boolean = false;
		public var useUmbrella:Boolean = false;
		public var useJetpack:Boolean = false;
		//public var fly:Boolean = false;
		public var shootCannon:Boolean = false;
		
		
		public static var freeLeft:Boolean = false;
		public static var freeRight:Boolean = false;
		public static var freeUp:Boolean = false;
		public static var freeDown:Boolean = false;
		public static var zoom:Boolean = false;
		public static var unzoom:Boolean = false;
		
		public static var controls:Array = [];
		
		public static var allowed:Boolean;
		
		private var _player:Player;
		
		public function Controls() {
			if (controls.length == 0) {
				Platformer.thisIs.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
				Platformer.thisIs.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
				allowed = true;
			}
			controls.push(this);
		}
		
		public function remove():void {
			controls.splice(controls.indexOf(this), 1);
		}
		
		public static function allowControls():void {
			allowed = true;
		}
		
		public static function disallowControls():void {
			allowed = false;
			/*Platformer.thisIs.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			Platformer.thisIs.stage.removeEventListener(KeyboardEvent.KEY_UP, keyUp);*/
			for each (var c:Controls in controls) {
				c.upKeys();
			}
		}
		
		public function upKeys():void {
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 90, 90));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 81, 81));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 69, 69));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 37, 37));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 65, 65));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 38, 38));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 87, 87));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 39, 39));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 68, 68));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 40, 40));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 83, 83));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 70, 70));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 192, 192));
		}
		
		private function keyDown(e:KeyboardEvent):void {
			//trace(e.keyCode);
			if (!allowed) {
				return void;
			}
			//for each (var c:Controls in controls)	
			if (_player) {
				switch (e.keyCode) {
					case 8: //backspace
						if (CarbonMenu.carbonMenu.visible) {
							CarbonMenu.carbonMenu.hide();
							Platformer.activation(null);
						} else {
							CarbonMenu.carbonMenu.show();
							Platformer.deactivation(null);
						}
						break;
					case 90: //z
						//useUmbrella = true;
						HUD.toggleInfo();
						break;
					case 81: //q
						unzoom = true;
						//CameraManager.zoomKoef /= 1.1;
						//Left = true;
						//Up = true;
						break;
					case 69: //e
						zoom = true;
						//CameraManager.zoomKoef *= 1.1;
						//Right = true;
						//Up = true;
						break;
					case 37: //Left
						left = true;
						break;
					case 65: //a
						_player.itemGet("Bazooka");
						//Controls(controls[1]).left = true;
						break;
					case 38: //Up
						up = true;
						break;
					case 87: //w
						_player.itemGet("Umbrella");
						//Controls(controls[1]).up = true;
						break;
					case 39: //Right
						right = true;
						break;
					case 68: //d
						//Controls(controls[1]).right = true;
						break;
					case 40: //Down
						down = true;
						break;
					case 83: //s
						//Platformer._player = new Player(2, -6, this);
						_player.itemGet("SnowGun");
						//Controls(controls[1]).down = true;
						break;
					case 70: //Fly //83
						//Fly = true;
						_player.hide();
						_player.changeSpawnPoint(10, -10);
						_player.spawn();
						break;
					/*case 83 ://Shoot Cannon
					   ShootCannon = true;
					 break;	*/
					case 192: //`
						Platformer.setFullScreen();
						break;
				}
			} else {
				switch (e.keyCode) {
					case 90: //z
						HUD.toggleInfo();
						break;
					case 13: //enter
						if (!Platformer._player) {
							Platformer._player = new Player(CameraManager.freePoint.x/20, CameraManager.freePoint.y/20, this);
						} else {
							Platformer._player.spawn();
						}
						break;
					case 81: //q
						unzoom = true;
						//CameraManager.zoomKoef /= 1.1;
						break;
					case 69: //e
						zoom = true;
						//CameraManager.zoomKoef *= 1.1;
						break;
					case 37: //Left
						freeLeft = true;
						//CameraManager.freePoint.x -= 10;
						break;
					case 65: //a
						freeLeft = true;
						//CameraManager.freePoint.x -= 10;
						break;
					case 38: //Up
						freeUp = true;
						//CameraManager.freePoint.y -= 10;
						break;
					case 87: //w
						freeUp = true;
						//CameraManager.freePoint.y -= 10;
						break;
					case 39: //Right
						freeRight = true;
						//CameraManager.freePoint.x += 10;
						break;
					case 68: //d
						freeRight = true;
						//CameraManager.freePoint.x += 10;
						break;
					case 40: //Down
						freeDown = true;
						//CameraManager.freePoint.y += 10;
						break;
					case 83: //s
						freeDown = true;
						//CameraManager.freePoint.y += 10;
						break;
					case 192: //`
						Platformer.setFullScreen();
						break;
				}
			}
		}
		
		private function keyUp(e:KeyboardEvent):void {
			//trace(e.keyCode);
			for each (var c:Controls in controls) {	
				switch (e.keyCode) {
					case 13: //Enter
						c.enter = false;
						break;
					case 90: //z
						c.useUmbrella = false;
						break;
					case 81: //q
						unzoom = false;
						c.left = false;
						c.up = false;
						break;
					case 69: //e
						zoom = false;
						c.right = false;
						c.up = false;
						break;
					case 37: //Left
						c.left = false;
						freeLeft = false;
						break;
					case 65: //a
						c.left = false;
						freeLeft = false;
						break;
					case 38: //Up
						c.up = false;
						c.useJetpack = false;
						freeUp = false;
						break;
					case 87: //w
						c.up = false;
						freeUp = false;
						break;
					case 39: //Right
						c.right = false;
						freeRight = false;
						break;
					case 68: //d
						c.right = false;
						freeRight = false;
						break;
					case 40: //Down
						c.down = false;
						freeDown = false;
						break;
					case 83: //s
						c.down = false;
						freeDown = false;
						break;
					case 70: //Fly
						break;
				/*case 83 ://Shoot Cannon
				   ShootCannon = false;
				 break;*/
				}
			}
		}
		
		public function set player(value:Player):void {
			_player = value;
		}
	}
}
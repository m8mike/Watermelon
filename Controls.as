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
		public var fly:Boolean = false;
		public var shootCannon:Boolean = false;
		
		public static var controls:Array = [];
		
		public static var allowed:Boolean;
		
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
			//for each (var c:Controls in controls) {	
				switch (e.keyCode) {
					case 13: //enter
						//Enter = true;
						break;
					case 90: //z
						useUmbrella = true;
						break;
					case 81: //q
						//Left = true;
						//Up = true;
						break;
					case 69: //e
						//Right = true;
						//Up = true;
						break;
					case 37: //Left
						Controls(controls[0]).left = true;
						break;
					case 65: //a
						Controls(controls[1]).left = true;
						break;
					case 38: //Up
						Controls(controls[0]).up = true;
						break;
					case 87: //w
						Controls(controls[1]).up = true;
						break;
					case 39: //Right
						Controls(controls[0]).right = true;
						break;
					case 68: //d
						Controls(controls[1]).right = true;
						break;
					case 40: //Down
						Controls(controls[0]).down = true;
						break;
					case 83: //s
						//Platformer._player = new Player(2, -6, this);
						Controls(controls[1]).down = true;
						break;
					case 70: //Fly //83
						//Fly = true;
						break;
					/*case 83 ://Shoot Cannon
					   ShootCannon = true;
					 break;	*/
					case 192: //`
						Platformer.setFullScreen();
						break;
				/*case 85 :
				   changeCharacter();
				   break;
				   case 73 :
				   changeHat();
				   break;
				   case 79 :
				   changeShoes();
				 break;*/
				}
			//}
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
						c.left = false;
						c.up = false;
						break;
					case 69: //e
						c.right = false;
						c.up = false;
						break;
					case 37: //Left
						c.left = false;
						break;
					case 65: //a
						c.left = false;
						break;
					case 38: //Up
						c.up = false;
						break;
					case 87: //w
						c.up = false;
						break;
					case 39: //Right
						c.right = false;
						break;
					case 68: //d
						c.right = false;
						break;
					case 40: //Down
						c.down = false;
						break;
					case 83: //s
						c.down = false;
						break;
					case 70: //Fly
						c.fly = false;
						break;
				/*case 83 ://Shoot Cannon
				   ShootCannon = false;
				 break;*/
				}
			}
		}
	}
}
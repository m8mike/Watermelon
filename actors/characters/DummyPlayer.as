package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class DummyPlayer {
		public var x:int;
		public var y:int;
		public var controls:Controls;
		public var hatID:int;
		
		public function DummyPlayer(x:int, y:int, controls:Controls, hatID:int = 11) {
			this.x = x;
			this.y = y;
			this.controls = controls;
			this.hatID = hatID;
		}
		
		public function init():void {
			Platformer._player = new Player(x, y, controls, hatID);
		}
	}
}
package {
	import flash.display.MovieClip;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class HatBonus extends BubbleBonus {
		private var costume:AnimationCostume;
		private var hatId:int;
		
		public function HatBonus(x:Number, y:Number, index:int = 8) {
			hatId = index;
			hatId = Math.random() * 6 + 8;
			var id:String;
			switch (hatId) {
				case 8: 
					id = "hat01";
					break;
				case 9: 
					id = "hat02";
					break;
				case 10: 
					id = "hat03";
					break;
				case 11: 
					id = "hat04";
					break;
				case 12: 
					id = "hat05";
					break;
				case 13: 
					id = "hat06";
					break;
				case 15: 
					id = "hat08";
					break;
				case 17: 
					id = "hat10";
					break;
				case 18: 
					id = "hat11";
					break;
				case 19: 
					id = "hat12";
					break;
				case 21:
					id = "hat14";
					break;
				default:
					trace("error in hatBonus");
			}
			costume = new AnimationCostume(id, CameraManager._staticLayer);
			costume.setScale(0.03);
			costume.setLocation(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			costume.show();
			super(x, y);
		}
	
		override public function pick(player:Player):void {
			super.pick(player);
			//var x:Number = player.getSpriteLoc().x/20;
			//var y:Number = player.getSpriteLoc().y/20;
			//var controls:Controls = player.controls;
			//player.remove();
			//Platformer.dummyPlayer = new DummyPlayer(x, y, controls, hatId);
			player.changeHat(hatId);
		}
		
		override protected function cleanUpBeforeRemoving():void {
			costume.remove();
			super.cleanUpBeforeRemoving();
		}
	}
}
package {
	import flash.display.MovieClip;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class HatBonus extends BubbleBonus {
		private var costume:AnimationCostume;
		private var hatId:int;
		
		public function HatBonus(x:Number, y:Number, index:int) {
			hatId = index;
			
			var id:String;
			switch (index) {
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
			costume = new AnimationCostume(id, CameraManager._staticLayer, 0.001, 0.001);
			costume.setCoords(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			super(x, y);
		}
	
		override public function pick(player:Player):void {
			player.changeHat(hatId);
			super.pick(player);
		}
		
		override protected function cleanUpBeforeRemoving():void {
			costume.remove();
			super.cleanUpBeforeRemoving();
		}
	}
}
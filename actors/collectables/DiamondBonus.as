package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class DiamondBonus extends BubbleBonus {
		private var costume:AnimationCostume;
		
		public function DiamondBonus(x:Number, y:Number) {
			costume = new AnimationCostume("diamond_bonus", CameraManager._staticLayer, 0.15, 0.15);
			costume.setCoords(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			costume.animation.visible = true;
			super(x, y);
		}
		
		override public function pick(player:Player):void {
			player.diamondGet();
			super.pick(player);
		}
		
		override protected function cleanUpBeforeRemoving():void {
			if (costume) {
				costume.remove();
			}
			super.cleanUpBeforeRemoving();
		}
	}
}
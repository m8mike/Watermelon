package {
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Heart extends BubbleBonus {
		private var costume:AnimationCostume;
		
		public function Heart(x:Number, y:Number) {
			costume = new AnimationCostume("heart", CameraManager._staticLayer, 0.15, 0.15);
			costume.setCoords(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			costume.animation.visible = true;
			super(x, y);
		}
		
		override public function pick(player:Player):void {
			player.inventory.addLife();
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
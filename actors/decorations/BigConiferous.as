package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class BigConiferous extends Decor {
		public static var coniferous:Array = [];
		
		public function BigConiferous() {
			for (var i:int = -2; i < 5; i++) {
				coniferous[i] = new AnimationCostume("Coniferous", CameraManager._cameraConiferous);
				AnimationCostume(coniferous[i]).setLocation((AnimationCostume(coniferous[i]).animation.bitmap.width - 650 * 0.4) * i, 0);
				AnimationCostume(coniferous[i]).show();
			}
		}
		
		override protected function removeCostumes():void {
			for each (var tree:AnimationCostume in coniferous) {
				tree.remove();
			}
			super.removeCostumes();
		}
	}
}
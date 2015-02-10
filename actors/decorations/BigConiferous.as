package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class BigConiferous extends Decor {
		private static var coniferous:Array = [];
		
		public function BigConiferous() {
			for (var i:int = -2; i < 5; i++) {
				coniferous[i] = new AnimationCostume("Coniferous", CameraManager._cameraConiferous);
				AnimationCostume(coniferous[i]).animation.x = (AnimationCostume(coniferous[i]).animation.width - 650 * 0.4) * i;
				AnimationCostume(coniferous[i]).animation.y = 0;
				AnimationCostume(coniferous[i]).animation.visible = true;
			}
		}
	}
}
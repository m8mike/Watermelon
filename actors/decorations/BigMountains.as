package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class BigMountains extends Decor {
		public static var funkyMountains:Array = [];
		
		public function BigMountains() {
			for (var i:int = -2; i < 5; i++) {
				funkyMountains[i] = new AnimationCostume("Mountains", CameraManager._cameraMount);
				AnimationCostume(funkyMountains[i]).animation.x = (AnimationCostume(funkyMountains[i]).animation.width * 0.7) * i;
				AnimationCostume(funkyMountains[i]).animation.y = -50;
				AnimationCostume(funkyMountains[i]).animation.visible = true;
			}
		}
		
		override protected function removeCostumes():void {
			for each (var mountain:AnimationCostume in funkyMountains) {
				mountain.remove();
			}
			super.removeCostumes();
		}
	}
}
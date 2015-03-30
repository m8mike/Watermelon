package {
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class RocketSmoke extends Decor {
		private var costume:AnimationCostume;
		
		public function RocketSmoke(location:Point) {
			costume = new AnimationCostume("rocketSmoke", CameraManager._dynamicLayer, 0.1, 0.1, 5);
			costume.setCoords(location.x * 30, location.y * 30);
			costume.play();
		}
		
		override public function updateNow():void {
			if (costume) {
				if (costume.checkAndStop()) {
					costume.remove();
				}
			}
			super.updateNow();
		}
	}
}
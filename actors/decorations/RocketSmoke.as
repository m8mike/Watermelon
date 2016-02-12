package {
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class RocketSmoke extends Decor {
		private var costume:AnimationCostume;
		
		public function RocketSmoke(location:Point) {
			costume = new AnimationCostume("rocketSmoke", CameraManager._dynamicLayer);
			costume.setScale(0.1);
			costume.setLocation(location.x * 30, location.y * 30);
			costume.play();
			costume.animation.onEnd = costume.remove;
		}
	}
}
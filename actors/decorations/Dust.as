package {
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Dust extends Decor {
		private var costume:AnimationCostume;
		public static const DUST:String = "dustBlow";
		public static const FLINDERS:String = "flinders";
		public static const LIGHTNING:String = "lightBlow";
		public static const BLOW:String = "rocketBlow";
		
		public function Dust(size:Number, location:Point, id:String = DUST) {
			if (id != FLINDERS) {
				SoundMusic.playChoom();
			}
			costume = new AnimationCostume(id, CameraManager.pLayer);
			costume.setScale(size / 100);
			costume.animation.onEnd = costume.remove;
			costume.setLocation(location.x * 30, location.y * 30);
			costume.play();
		}
	}
}
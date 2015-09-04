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
			if (id == FLINDERS) {
				costume = new AnimationCostume(id, CameraManager.pLayer, size / 100, size / 100, 6);
			} else {
				costume = new AnimationCostume(id, CameraManager.pLayer, size / 100, size / 100, 10);
				SoundMusic.playChoom();
			}
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
package {
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Lightning extends Decor {
		private var costume:AnimationCostume;
		
		public function Lightning(size:Number, location:Point) {
			costume = new AnimationCostume("lightBlow", CameraManager.belowLayer, size / 100, size / 100, 10);
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
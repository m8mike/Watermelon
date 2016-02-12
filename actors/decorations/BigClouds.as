package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class BigClouds extends Decor {
		private static var bigCloud1:AnimationCostume;
		private static var bigCloud2:AnimationCostume;
		private static var bigCloud3:AnimationCostume;
		
		public function BigClouds() {
			addBigClouds(3);
		}
		
		public static function addBigClouds(numClouds:int = 1):void {
			for (var i:int = -2; i < 5; i++) {
				bigCloud1 = new AnimationCostume("bigCloud1", CameraManager._camera11);
				bigCloud1.x += i * bigCloud1.width;
				bigCloud1.y = -300;
				if (numClouds > 1) {
					bigCloud2 = AnimationCostume("bigCloud2", CameraManager._camera12);
					bigCloud2.x += i * bigCloud1.width;
					bigCloud2.y = -150;
				}
				if (numClouds > 2) {
					bigCloud3 = AnimationCostume("bigCloud3", CameraManager._camera13);
					bigCloud3.x += i * bigCloud1.width;
					bigCloud3.y = -300;
				}
			}
		}
	}
}
package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class BigClouds extends Decor {
		private static var bigCloud1:Animation;
		private static var bigCloud2:Animation;
		private static var bigCloud3:Animation;
		
		public function BigClouds() {
			addBigClouds(3);
		}
		
		public static function addBigClouds(numClouds:int = 1):void {
			for (var i:int = -2; i < 5; i++) {
				bigCloud1 = Raster.getAnimation("bigCloud1");
				bigCloud1.x += i * bigCloud1.width;
				bigCloud1.y = -300;
				CameraManager._camera11.addChild(bigCloud1);
				if (numClouds > 1) {
					bigCloud2 = Raster.getAnimation("bigCloud2");
					bigCloud2.x += i * bigCloud1.width;
					bigCloud2.y = -150;
					CameraManager._camera12.addChild(bigCloud2);
				}
				if (numClouds > 2) {
					bigCloud3 = Raster.getAnimation("bigCloud3");
					bigCloud3.x += i * bigCloud1.width;
					bigCloud3.y = -300;
					CameraManager._camera13.addChild(bigCloud3);
				}
			}
		}
	}

}
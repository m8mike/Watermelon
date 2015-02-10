package {
	import flash.display.Sprite;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Hills extends Decor {
		private static var fon1:Animation;
		private static var fon2:Animation;
		private static var fon3:Animation;
		private static var fon4:Animation;
		/*
		private static var fon1:Sprite;
		private static var fon2:Sprite;
		private static var fon3:Sprite;
		private static var fon4:Sprite;*/
		
		public function Hills() {
			addHills(2);
			//addHillsSprite(4);
		}
		
		public static function addHills(numHills:int = 1):void {
			var offset:Number = -300;
			for (var i:int = -2; i < 5; i++) {
				fon1 = Raster.getAnimation("hillsWithTrees1"); //"fon1");
				fon1.x = offset;
				CameraManager._camera01.addChild(fon1);
				if (numHills > 1) {
					offset -= fon1.width / 2;
					fon2 = Raster.getAnimation("hillsWithTrees2"); //"fon6");
					fon2.x = offset / 2 * 0.75;
					CameraManager._camera03.addChild(fon2);
				}
				if (numHills > 2) {
					fon3 = Raster.getAnimation("hillsWithTrees3"); //"fon32");
					fon3.x = offset / 2;
					CameraManager._camera02.addChild(fon3);
				}
				if (numHills > 3) {
					fon4 = Raster.getAnimation("hillsWithTrees4"); //"fon5");
					fon4.x = offset / 4;
					CameraManager._camera04.addChild(fon4);
				}
				offset += fon1.width * 4 / 3;
			}
		}
		/*public static function addHillsSprite(numHills:int = 1):void {
			var offset:Number = -300;
			for (var i:int = -2; i < 5; i++) {
				fon1 = new hillsWithTrees1();
				Raster.rasterize(fon1);
				fon1.x = offset;
				CameraManager._camera01.addChild(fon1);
				if (numHills > 1) {
					offset -= fon1.width / 2;
					fon2 = new hillsWithTrees2();
					Raster.rasterize(fon2);
					fon2.x = offset / 2 * 0.75;
					CameraManager._camera03.addChild(fon2);
				}
				if (numHills > 2) {
					fon3 = new hillsWithTrees3();
					Raster.rasterize(fon3);
					fon3.x = offset / 2;
					CameraManager._camera02.addChild(fon3);
				}
				if (numHills > 3) {
					fon4 = new hillsWithTrees4();
					Raster.rasterize(fon4);
					fon4.x = offset / 4;
					CameraManager._camera04.addChild(fon4);
				}
				offset += fon1.width * 4 / 3;
			}
		}*/
	}

}
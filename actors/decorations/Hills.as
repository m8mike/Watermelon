package {
	import flash.display.Sprite;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Hills extends Decor {
		/*private static var fon1:Animation;
		private static var fon2:Animation;
		private static var fon3:Animation;
		private static var fon4:Animation;*/
		private var line1:Array = [];
		private var line2:Array = [];
		private var line3:Array = [];
		private var line4:Array = [];
		
		public function Hills() {
			addHills(4);
		}
		/*
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
		}*/
		
		public function addHills(numHills:int = 1):void {
			var offset:Number = -300;
			for (var i:int = -2; i < 5; i++) {
				line1.push(new AnimationCostume("hillsWithTrees1", CameraManager._camera01));
				AnimationCostume(line1[i + 2]).setCoords(offset, 0);
				AnimationCostume(line1[i + 2]).animation.visible = true;
				if (numHills > 1) {
					offset -= AnimationCostume(line1[i + 2]).animation.width / 2;
					line2.push(new AnimationCostume("hillsWithTrees2", CameraManager._camera03));
					AnimationCostume(line2[i + 2]).setCoords(offset / 2 * 0.75, 0);
					AnimationCostume(line2[i + 2]).animation.visible = true;
				}
				if (numHills > 2) {
					line3.push(new AnimationCostume("hillsWithTrees3", CameraManager._camera02));
					AnimationCostume(line3[i + 2]).setCoords(offset / 2, 0);
					AnimationCostume(line3[i + 2]).animation.visible = true;
				}
				if (numHills > 3) {
					line4.push(new AnimationCostume("hillsWithTrees4", CameraManager._camera04));
					AnimationCostume(line4[i + 2]).setCoords(offset / 4, 0);
					AnimationCostume(line4[i + 2]).animation.visible = true;
				}
				offset += AnimationCostume(line1[i + 2]).animation.width * 4 / 3;
			}
		}
		
		override protected function removeCostumes():void {
			for each (var hill:AnimationCostume in line1) {
				hill.remove();
			}
			for each (hill in line2) {
				hill.remove();
			}
			for each (hill in line3) {
				hill.remove();
			}
			for each (hill in line4) {
				hill.remove();
			}
			super.removeCostumes();
		}	
	}
}
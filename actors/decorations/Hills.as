package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Hills extends Decor {
		public static var line1:Array = [];
		public static var line2:Array = [];
		public static var line3:Array = [];
		public static var line4:Array = [];
		
		public function Hills() {
			addHills(4);
		}
		
		public function addHills(numHills:int = 1):void {
			var offset:Number = -300;
			line1 = [];
			line2 = [];
			line3 = [];
			line4 = [];
			for (var i:int = -2; i < 5; i++) {
				line1.push(new AnimationCostume("hillsWithTrees1", CameraManager._camera01));
				AnimationCostume(line1[i + 2]).setLocation(offset, 0);
				AnimationCostume(line1[i + 2]).show();
				if (numHills > 1) {
					offset -= AnimationCostume(line1[i + 2]).animation.bitmap.width / 2;
					line2.push(new AnimationCostume("hillsWithTrees2", CameraManager._camera03));
					AnimationCostume(line2[i + 2]).setLocation(offset / 2 * 0.75, 0);
					AnimationCostume(line2[i + 2]).show();
				}
				if (numHills > 2) {
					line3.push(new AnimationCostume("hillsWithTrees3", CameraManager._camera02));
					AnimationCostume(line3[i + 2]).setLocation(offset / 2, 0);
					AnimationCostume(line3[i + 2]).show();
				}
				if (numHills > 3) {
					line4.push(new AnimationCostume("hillsWithTrees4", CameraManager._camera04));
					AnimationCostume(line4[i + 2]).setLocation(offset / 4, 0);
					AnimationCostume(line4[i + 2]).show();
				}
				offset += AnimationCostume(line1[i + 2]).animation.bitmap.width * 4 / 3;
			}
			NumScroller(EditorBackground._numScrollers[0]).asset = line1;
			NumScroller(EditorBackground._numScrollers[1]).asset = line2;
			NumScroller(EditorBackground._numScrollers[2]).asset = line3;
			NumScroller(EditorBackground._numScrollers[3]).asset = line4;
		}
		/*
		public function addHills(numHills:int = 1):void {
			var offset:Number = -300;
			for (var i:int = -2; i < 5; i++) {
				line1.push(getNewBitmap(new hillsWithTrees1(), CameraManager._camera01));
				Bitmap(line1[i + 2]).x = offset;
				Bitmap(line1[i + 2]).y = 0;
				if (numHills > 1) {
					offset -= Bitmap(line1[i + 2]).width / 2;
					line2.push(getNewBitmap(new hillsWithTrees2(), CameraManager._camera03));
					Bitmap(line2[i + 2]).x = offset / 2 * 0.75;
					Bitmap(line2[i + 2]).y = 0;
				}
				if (numHills > 2) {
					line3.push(getNewBitmap(new hillsWithTrees3(), CameraManager._camera02));
					Bitmap(line3[i + 2]).x = offset / 2;
					Bitmap(line3[i + 2]).y = 0;
				}
				if (numHills > 3) {
					line4.push(getNewBitmap(new hillsWithTrees4(), CameraManager._camera04));
					Bitmap(line4[i + 2]).x = offset / 4;
					Bitmap(line4[i + 2]).y = 0;
				}
				offset += Bitmap(line1[i + 2]).width * 4 / 3;
			}
		}
		
		private function getNewBitmap(clip:MovieClip, parent:DisplayObjectContainer, scaleRate:Number = 1):Bitmap {
			var bitmapData:BitmapData = new BitmapData(clip.width * scaleRate, clip.height * scaleRate, true);
			var m:Matrix = new Matrix();
			m.scale(scaleRate, scaleRate);
			bitmapData.draw(clip, m);
			var bitmap:Bitmap = new Bitmap(bitmapData);
			bitmap.scaleX = 1 / scaleRate;
			bitmap.scaleY = bitmap.scaleX;
			parent.addChild(bitmap);
			return bitmap;
		}*/
		
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
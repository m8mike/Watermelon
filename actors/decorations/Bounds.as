package {
	import flash.display.MovieClip;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Bounds extends Decor {
		private var grass:AnimationCostume;
		private var ceiling:AnimationCostume;
		private var leftBound:AnimationCostume;
		private var rightBound:AnimationCostume;
		private var verticals:MovieClip;
		private var horisontals:MovieClip;
		
		public function Bounds(x:Number, y:Number, w:Number, h:Number) {
			var m:int = 1;
			var sectionWidth:Number = 0;
			verticals = new MovieClip();
			horisontals = new MovieClip();
			while (sectionWidth < h * PhysiVals.MIN_SQARE) {
				sectionWidth = 40 * m - 11 * (m - 1) - 21 + 44.88;
				leftBound = new AnimationCostume("GroundBackground", verticals, 0.15, 0.15);
				leftBound.setCoords(0, 40 * m - 11 * (m - 1) - 21);
				leftBound.animation.rotation = -90;
				leftBound.animation.visible = true;
				rightBound = new AnimationCostume("GroundBackground", verticals, 0.15, 0.15);
				rightBound.setCoords(w * PhysiVals.MIN_SQARE, 40 * m - 11 * (m - 1) - 21);
				rightBound.animation.rotation = 90;
				rightBound.animation.visible = true;
				m++;
			}
			m = 1;
			sectionWidth = 0;
			while (sectionWidth < w * PhysiVals.MIN_SQARE) {
				sectionWidth = 40 * m - 11 * (m - 1) - 21 + 44.88;
				grass = new AnimationCostume("GrassBackground", horisontals, 0.15, 0.15);
				grass.setCoords(40 * m - 11 * (m - 1) - 21, 0);
				grass.animation.visible = true;
				ceiling = new AnimationCostume("GroundBackground", horisontals, 0.15, 0.15);
				ceiling.setCoords(40 * m - 11 * (m - 1) - 21, h * PhysiVals.MIN_SQARE);
				ceiling.animation.rotation = 180;
				ceiling.animation.visible = true;
				m++;
			}
			verticals.x = x * PhysiVals.MIN_SQARE;
			verticals.y = y * PhysiVals.MIN_SQARE;
			horisontals.x = x * PhysiVals.MIN_SQARE;
			horisontals.y = y * PhysiVals.MIN_SQARE;
			verticals.height = h * PhysiVals.MIN_SQARE;
			horisontals.width = w * PhysiVals.MIN_SQARE;
			CameraManager._staticLayer.addChild(verticals);
			CameraManager._staticLayer.addChild(horisontals);
			
		}
		
		override protected function removeCostumes():void {
			if (verticals) {
				if (verticals.parent) {
					verticals.parent.removeChild(verticals);
				}
			}
			if (horisontals) {
				if (horisontals.parent) {
					horisontals.parent.removeChild(horisontals);
				}
			}
			super.removeCostumes();
		}
	}
}
package {
	import flash.display.DisplayObjectContainer;
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
		private var hGrass:MovieClip;
		private var hCeiling:MovieClip;
		
		public function Bounds(x:Number, y:Number, w:Number, h:Number, parent:DisplayObjectContainer) {
			var m:int = 1;
			var sectionWidth:Number = 0;
			verticals = new MovieClip();
			hGrass = new MovieClip();
			hCeiling = new MovieClip();
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
				grass = new AnimationCostume("GrassBackground", hGrass, 0.15, 0.15);
				grass.setCoords(40 * m - 11 * (m - 1) - 21, 0);
				grass.animation.visible = true;
				ceiling = new AnimationCostume("GroundBackground", hCeiling, 0.15, 0.15);
				ceiling.setCoords(40 * m - 11 * (m - 1) - 21, h * PhysiVals.MIN_SQARE);
				ceiling.animation.rotation = 180;
				ceiling.animation.visible = true;
				m++;
			}
			verticals.x = x * PhysiVals.MIN_SQARE;
			verticals.y = y * PhysiVals.MIN_SQARE;
			hGrass.x = x * PhysiVals.MIN_SQARE;
			hGrass.y = y * PhysiVals.MIN_SQARE;
			hCeiling.x = x * PhysiVals.MIN_SQARE;
			hCeiling.y = y * PhysiVals.MIN_SQARE;
			verticals.height = (h+0.5) * PhysiVals.MIN_SQARE;
			hGrass.width = (w+0.5) * PhysiVals.MIN_SQARE;
			hCeiling.width = w * PhysiVals.MIN_SQARE;
			parent.parent.addChild(verticals);
			parent.parent.addChild(hGrass);
			parent.parent.addChild(hCeiling);
		}
		
		public function setAngle(angle:Number):void {
			/*if (grass) {
				grass.animation.rotation = angle;
			}
			if (ceiling) {
				ceiling.animation.rotation = angle;
			}*/
			if (verticals) {
				verticals.rotation = angle;
			}
			if (hGrass) {
				hGrass.rotation = angle;
			}
			if (hCeiling) {
				hCeiling.rotation = angle;
			}
		}
		
		public function setLoc(x:Number, y:Number):void {
			if (verticals) {
				verticals.x = x;
				verticals.y = y;
			}
			if (hCeiling) {
				hCeiling.x = x;
				hCeiling.y = y;
			}
			if (hGrass) {
				hGrass.x = x;
				hGrass.y = y;
			}
		}
		
		override protected function removeCostumes():void {
			if (verticals) {
				if (verticals.parent) {
					verticals.parent.removeChild(verticals);
				}
			}
			if (hGrass) {
				if (hGrass.parent) {
					hGrass.parent.removeChild(hGrass);
				}
			}
			if (hCeiling) {
				if (hCeiling.parent) {
					hCeiling.parent.removeChild(hCeiling);
				}
			}
			super.removeCostumes();
		}
	}
}
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
		
		public function Bounds(x:Number, y:Number, w:Number, h:Number) {
			var m:int = 1;
			var sectionWidth:Number = 0;
			var koef:int = 20;
			var verticals:MovieClip = new MovieClip();
			var horisontals:MovieClip = new MovieClip();
			while (sectionWidth < h * koef) {
				sectionWidth = 40 * m - 11 * (m - 1) - 21 + 44.88;
				leftBound = new AnimationCostume("GroundBackground", verticals, 0.15, 0.15);
				leftBound.setCoords(0, 40 * m - 11 * (m - 1) - 21);
				leftBound.animation.rotation = -90;
				leftBound.animation.visible = true;
				rightBound = new AnimationCostume("GroundBackground", verticals, 0.15, 0.15);
				rightBound.setCoords(w * koef, 40 * m - 11 * (m - 1) - 21);
				rightBound.animation.rotation = 90;
				rightBound.animation.visible = true;
				m++;
			}
			m = 1;
			sectionWidth = 0;
			while (sectionWidth < w * koef) {
				sectionWidth = 40 * m - 11 * (m - 1) - 21 + 44.88;
				grass = new AnimationCostume("GrassBackground", horisontals, 0.15, 0.15);
				grass.setCoords(40 * m - 11 * (m - 1) - 21, 0);
				grass.animation.visible = true;
				ceiling = new AnimationCostume("GroundBackground", horisontals, 0.15, 0.15);
				ceiling.setCoords(40 * m - 11 * (m - 1) - 21, h * koef);
				ceiling.animation.rotation = 180;
				ceiling.animation.visible = true;
				m++;
			}
			verticals.x = x * koef;
			verticals.y = y * koef;
			horisontals.x = x * koef;
			horisontals.y = y * koef;
			verticals.height = h * koef;
			horisontals.width = w * koef;
			CameraManager._staticLayer.addChild(verticals);
			CameraManager._staticLayer.addChild(horisontals);
			
		}
	}
}
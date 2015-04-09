package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CrateBoxCostumeManager extends CostumeManager {
		private var parent:CrateBox;
		
		public function CrateBoxCostumeManager(crate:CrateBox) {
			parent = crate;
			createCostumes();
		}
		
		override public function updateNow():void {
			setCoords();
			super.updateNow();
		}
		
		private function createCostumes():void {
			_costumes.push(new AnimationCostume("crate_box", CameraManager.pLayer, 0.2, 0.2));
			AnimationCostume(_costumes[0]).play();
		}
		
		private function setCoords():void {
			var x:Number = parent.getBody().GetPosition().x * PhysiVals.RATIO;
			var y:Number = parent.getBody().GetPosition().y * PhysiVals.RATIO;
			for each (var costume:AnimationCostume in _costumes) {
				costume.setCoords(x, y);
				costume.animation.rotation = parent.getBody().GetAngle() * 180 / Math.PI;
			}
		}
	}

}
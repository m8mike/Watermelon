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
			var animCostume:AnimationCostume = new AnimationCostume("crate_box", CameraManager.pLayer);
			animCostume.setScale(0.2);
			_costumes.push(animCostume);
			AnimationCostume(_costumes[0]).play();
		}
		
		private function setCoords():void {
			var x:Number = parent.getBody().GetPosition().x * PhysiVals.RATIO;
			var y:Number = parent.getBody().GetPosition().y * PhysiVals.RATIO;
			for each (var costume:AnimationCostume in _costumes) {
				costume.setLocation(x, y);
				//costume.animation.rotation = parent.getBody().GetAngle() * 180 / Math.PI;
			}
		}
	}

}
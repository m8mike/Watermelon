package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class GhostCostumeManager extends CostumeManager {
		
		private var condition:int = 1; //состояние персонажа для анимации и т.д.
		private var changedCondition:Boolean = false;
		private var parent:Ghost;
		
		public function GhostCostumeManager(ghost:Ghost) {
			parent = ghost;
			createCostumes();
		}
		
		override public function updateNow():void {
			setCoords();
			//checkCondition();
			super.updateNow();
		}
		
		private function createCostumes():void {
			_costumes.push(new AnimationCostume("ghost1", CameraManager.pLayer, 0.2, 0.2));
			AnimationCostume(_costumes[0]).play();
		}
		
		private function setCoords():void {
			var x:Number = parent.getBody().GetPosition().x * PhysiVals.RATIO + 8;
			var y:Number = parent.getBody().GetPosition().y * PhysiVals.RATIO + 12;
			for each (var costume:AnimationCostume in _costumes) {
				costume.setCoords(x, y);
			}
		}
	}

}
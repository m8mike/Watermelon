package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Character extends Actor {
		protected var bodyManager:BodyManager;
		protected var costumeManager:CostumeManager;
		protected var deleted:Boolean = false;
		
		public function Character() {
			Platformer.characters.push(this);
		}
		
		override public function updateNow():void {
			if (bodyManager) {
				bodyManager.updateNow();
			}
			if (deleted) {
				return void;
			}
			if (costumeManager) {
				costumeManager.updateNow();
			}
			super.updateNow();
		}
		
		override protected function cleanUpBeforeRemoving():void {
			Platformer.characters.splice(Platformer.characters.indexOf(this), 1);
			deleted = true;
			super.cleanUpBeforeRemoving();
		}
		
		override protected function removeCostumes():void {
			if (costumeManager) {	
				costumeManager.removeCostumes();
			}
		}
		
		override protected function removeBodies():void {
			bodyManager.removeBodies();
		}
	}
}
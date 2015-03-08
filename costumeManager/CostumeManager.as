package
{
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class CostumeManager {
		protected  var _costumes:Array = [];
		
		public function CostumeManager() {
			
		}
		
		public function updateNow():void {
			
		}
		
		public function removeCostumes():void {
			while (_costumes.length > 0) {
				AnimationCostume(_costumes[0]).remove();
				_costumes.splice(0, 1);
			}
			/*for each(var costumeToRemove:AnimationCostume in _costumes) {
				costumeToRemove.remove();
				_costumes.splice(_costumes.indexOf(costumeToRemove), 1);
			}*/
		}
		
	}

}
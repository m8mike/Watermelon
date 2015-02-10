package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Umbrella extends Item {
		
		public function Umbrella() {
			//add controls
		}
		
		override protected function cleanUpBeforeRemoving():void {
			//remove controls
			super.cleanUpBeforeRemoving();
		}
	}
}
package {
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Character extends Actor {
		protected var bodyManager:BodyManager;
		protected var costumeManager:CostumeManager;
		
		public var loc2Spawn:Point;
		
		public function Character(x:Number, y:Number) {
			Platformer.characters.push(this);
			loc2Spawn = new Point(x, y);
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
		
		override public function getXML():XML {
			var typeOfCharacter:String = this.toString().substring(8, this.toString().length - 1);
			var xml:XML =  < { typeOfCharacter } x = { loc2Spawn.x } y = { loc2Spawn.y }>{typeOfCharacter}
							</{typeOfCharacter}>;
			return xml;
		}
	}
}
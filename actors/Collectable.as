package {
	import Box2D.Dynamics.b2Body;
	import flash.display.DisplayObject;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Collectable extends Actor {
		
		private var _body:b2Body;
		public var _costume:DisplayObject;
		
		public function Collectable(myBody:b2Body, myCostume:DisplayObject) {
			_body = myBody;
			_body.SetUserData(this);
			_costume = myCostume;
			Platformer.collectables.push(this);
			updateCostumes();
		}
		
		public function pick(player:Player):void {
			this.remove();
		}
		
		public function updateCostumes():void {
			_costume.x = _body.GetPosition().x * PhysiVals.RATIO;
			_costume.y = _body.GetPosition().y * PhysiVals.RATIO;
			_costume.rotation = _body.GetAngle() * 180 / Math.PI;
		}
		
		override protected function cleanUpBeforeRemoving():void {
			Platformer.collectables.splice(Platformer.collectables.indexOf(this), 1);
			super.cleanUpBeforeRemoving();
		}
	}

}
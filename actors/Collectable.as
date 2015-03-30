package {
	import Box2D.Dynamics.b2Body;
	import flash.display.DisplayObject;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Collectable extends Actor {
		
		protected var _body:b2Body;
		public var _costume:DisplayObject;
		public var needBody:Boolean;
		
		public function Collectable(myCostume:DisplayObject) {
			_costume = myCostume;
			Platformer.collectables.push(this);
			updateCostumes();
			needBody = true;
		}
		
		public function createBodies():void {
			needBody = false;
		}
		
		public function pick(player:Player):void {
			this.remove();
		}
		
		public function updateCostumes():void {
			if (_body) {
				_costume.x = _body.GetPosition().x * PhysiVals.RATIO;
				_costume.y = _body.GetPosition().y * PhysiVals.RATIO;
				_costume.rotation = _body.GetAngle() * 180 / Math.PI;
			} else {
				_costume.visible = false;
			}
		}
		
		override protected function cleanUpBeforeRemoving():void {
			Platformer.collectables.splice(Platformer.collectables.indexOf(this), 1);
			super.cleanUpBeforeRemoving();
		}
	}
}
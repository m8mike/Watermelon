package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
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
			var body:b2Body = parent.getBody();
			var loc:b2Vec2 = body.GetWorldCenter();
			var x:Number = loc.x * PhysiVals.RATIO;// + 8;
			var y:Number = loc.y * PhysiVals.RATIO;// + 12;
			var vel:b2Vec2 = body.GetLinearVelocity();
			for each (var costume:AnimationCostume in _costumes) {
				costume.setCoords(x, y);
				costume.animation.rotation = parent.getBody().GetAngle() * 180 / Math.PI;
				if (vel.x < 0) {
					costume.animation.scaleX = -Math.abs(costume.animation.scaleX);
				} else {
					costume.animation.scaleX = Math.abs(costume.animation.scaleX);
				}
			}
		}
	}
}
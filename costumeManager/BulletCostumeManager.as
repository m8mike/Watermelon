package {
	import Box2D.Common.Math.b2Vec2;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class BulletCostumeManager extends CostumeManager {
		private var parent:Bullet;
		
		public function BulletCostumeManager(size:Number, bullet:Bullet) {
			parent = bullet;
			createCostumes(size);
		}
		
		override public function updateNow():void {
			setCoords();
			super.updateNow();
		}
		
		private function createCostumes(size:Number):void {
			_costumes.push(new AnimationCostume("bullet_rocket", CameraManager.pLayer, 0.2, 0.2));
			AnimationCostume(_costumes[0]).play();
		}
		
		private function setCoords():void {
			var x:Number = parent.getBody().GetPosition().x * PhysiVals.RATIO;
			var y:Number = parent.getBody().GetPosition().y * PhysiVals.RATIO;
			var vel:b2Vec2 = parent.getBody().GetLinearVelocity();
			var angle:Number = 180-Math.atan2(vel.x, vel.y) * 180 / Math.PI;
			for each (var costume:AnimationCostume in _costumes) {
				costume.setCoords(x, y);
				costume.animation.rotation = angle;
			}
		}
	}
}
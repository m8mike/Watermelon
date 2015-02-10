package {
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Bazooka extends Item {
		private var costume:AnimationCostume;
		private var direction:Boolean = true;
		
		public function Bazooka() {
			costume = new AnimationCostume("bazookaHands", CameraManager._dynamicLayer, 0.04, 0.04);
			costume.animation.visible = true;
			Platformer.thisIs.stage.addEventListener(MouseEvent.MOUSE_MOVE, setAngle);
			Platformer.thisIs.stage.addEventListener(MouseEvent.CLICK, shoot);
		}
		
		private function shoot(e:MouseEvent):void {
			var x:Number = (e.stageX - CameraManager.pLayer.x) / 60;
			var y:Number = (e.stageY - CameraManager.pLayer.y) / 60;
			new DummyCircle(x, y, 5);
		}
		
		private function click(e:MouseEvent):void {
			var x:Number = (e.stageX - CameraManager.pLayer.x) / 60;
			var y:Number = (e.stageY - CameraManager.pLayer.y) / 60;
			new DummyCircle(x, y, Math.random() * 30 + 10);
		}
		
		private function setAngle(e:MouseEvent):void {
			var x:Number = Platformer._player.getSpriteLoc().x - (e.stageX - CameraManager.pLayer.x) / 3;
			var y:Number = Platformer._player.getSpriteLoc().y - (e.stageY - CameraManager.pLayer.y / 3) + 190;
			if (x < 0) {
				direction = false;
			} else {
				direction = true;
			}
			if (direction == Platformer._player.direction) {
				if (direction) {
					costume.animation.scaleX = -1 * Math.abs(costume.animation.scaleX);
					costume.animation.rotation = 90 - Math.atan2(x, y) * 180 / Math.PI;
				} else {
					costume.animation.scaleX = Math.abs(costume.animation.scaleX);
					costume.animation.rotation = -90 - Math.atan2(x, y) * 180 / Math.PI;
				}
			} else {
				if (Platformer._player.direction) {
					costume.animation.scaleX = -1 * Math.abs(costume.animation.scaleX);
					costume.animation.rotation = 90 - Math.atan2(10, 0) * 180 / Math.PI;
				} else {
					costume.animation.scaleX = Math.abs(costume.animation.scaleX);
					costume.animation.rotation = -90 - Math.atan2(-10, 0) * 180 / Math.PI;
				}
			}
		}
		
		public function setCoords(x:Number, y:Number) {
			costume.animation.y = y;
			if (direction == Platformer._player.direction) {
				if (direction) {
					costume.animation.x = x - 11;
				} else {
					costume.animation.x = x;
				}
			} else {
				if (Platformer._player.direction) {
					costume.animation.x = x - 11;
				} else {
					costume.animation.x = x;
				}
			}
		}
		
		override protected function cleanUpBeforeRemoving():void {
			Platformer.thisIs.stage.removeEventListener(MouseEvent.MOUSE_MOVE, setAngle);
			costume.remove();
			super.cleanUpBeforeRemoving();
		}
	}
}
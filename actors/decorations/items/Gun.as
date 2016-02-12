package {
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Gun extends Item {
		private var costume:AnimationCostume;
		private var direction:Boolean = true;
		
		public function Gun(id:String) {
			costume = new AnimationCostume(id, CameraManager._dynamicLayer);
			costume.setScale(0.04);
			costume.show();
			Platformer.thisIs.stage.addEventListener(MouseEvent.MOUSE_MOVE, setAngle);
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
					costume.flipRight(false);
					costume.setAngle(90 - Math.atan2(x, y) * 180 / Math.PI);
				} else {
					costume.flipRight(true);
					costume.setAngle(-90 - Math.atan2(x, y) * 180 / Math.PI);
				}
			} else {
				if (Platformer._player.direction) {
					costume.flipRight(false);
					costume.setAngle(90 - Math.atan2(10, 0) * 180 / Math.PI);
				} else {
					costume.flipRight(true)
					costume.setAngle(-90 - Math.atan2(-10, 0) * 180 / Math.PI);
				}
			}
		}
		
		public function setCoords(x:Number, y:Number) {
			costume.animation.bitmap.y = y;
			if (direction == Platformer._player.direction) {
				if (direction) {
					costume.animation.bitmap.x = x - 11;
				} else {
					costume.animation.bitmap.x = x;
				}
			} else {
				if (Platformer._player.direction) {
					costume.animation.bitmap.x = x - 11;
				} else {
					costume.animation.bitmap.x = x;
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
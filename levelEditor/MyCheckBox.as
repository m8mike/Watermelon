package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class MyCheckBox extends Decor{
		private var _checked:Boolean;
		public var checkedMC:MovieClip;
		public var uncheckedMC:MovieClip;
		private var index:int;
		
		public function MyCheckBox(enabled:Boolean, num:int) {
			index = num;
			checkedMC = new heartOn();
			checkedMC.x = 480;
			checkedMC.y = 20 * num + 10;
			checkedMC.scaleX = 0.25;
			checkedMC.scaleY = 0.25;
			checkedMC.visible = false;
			CameraManager.hud.addChild(checkedMC);
			uncheckedMC = new heartOff();
			uncheckedMC.x = 480;
			uncheckedMC.y = 20 * num + 10;
			uncheckedMC.scaleX = 0.25;
			uncheckedMC.scaleY = 0.25;
			CameraManager.hud.addChild(uncheckedMC);
			checkedMC.visible = enabled;
			uncheckedMC.visible = !enabled;
			checkedMC.addEventListener(MouseEvent.CLICK, change);
			uncheckedMC.addEventListener(MouseEvent.CLICK, change);
		}
		
		public function change(e:MouseEvent):void {
			changeTo(!checkedMC.visible);
			switch (index) {
				case 10:
					LevelEditor.currentPlatform.bodyBuilder.isSensor = checkedMC.visible;
				break;
				case 13:
					LevelEditor.currentPlatform.bodyBuilder.jumpThrough = checkedMC.visible;
				break;
				case 14:
					LevelEditor.currentPlatform.bodyBuilder.fixedRotation = checkedMC.visible;
				break;
				case 15:
					LevelEditor.currentPlatform.bodyBuilder.bullet = checkedMC.visible;
				break;
				default:
			}
		}
		
		public function changeTo(enabled):void {
			checkedMC.visible = enabled;
			uncheckedMC.visible = !enabled;
		}
		
		override protected function cleanUpBeforeRemoving():void {
			checkedMC.removeEventListener(MouseEvent.CLICK, change);
			uncheckedMC.removeEventListener(MouseEvent.CLICK, change);
			CameraManager.hud.removeChild(checkedMC);
			CameraManager.hud.removeChild(uncheckedMC);
			super.cleanUpBeforeRemoving();
		}
		
		public function get checked():Boolean {
			return _checked;
		}
	}
}
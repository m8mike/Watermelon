package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class levelSelectMc extends Sprite {
		public static const LOCKED = 0;
		public static const UNLOCKED = 1;
		private var num:int;
		public static var nums:int = 0;
		private var level:Number;
		public static var needToStartLevel:Number;
		public var icon:Sprite;
		public function levelSelectMc(n:Number, solved:Boolean):void {
			level = n;
			if (!solved) {
				icon = new lockedMc();
			} else {
				icon = new homeButtonMc();
				addEventListener(MouseEvent.CLICK, clicked);
				buttonMode=true;
			}
			this.addChild(icon);
			num =++nums;
			//Platformer.thisIs.addChild(icon);
			var levelWidth:Number = setupClass.levelsPerRow * width + (setupClass.levelsPerRow - 1) * setupClass.levelsHorizontalSpacing;
			var numberOfRows:Number = Math.floor(setupClass.totalLevels / setupClass.levelsPerRow);
			var levelHeight:Number = numberOfRows * height + (numberOfRows - 1) * setupClass.levelsVerticalSpacing;
			var xOffset:Number = (setupClass.gameWidth - levelWidth) / 2 + setupClass.levelsOffsetX;
			var yOffset:Number = (setupClass.gameHeight - levelHeight) / 2 + setupClass.levelsOffsetY;
			x = n % setupClass.levelsPerRow * (width + setupClass.levelsHorizontalSpacing) + xOffset;
			y = Math.floor(n / setupClass.levelsPerRow) * (height + setupClass.levelsVerticalSpacing) + yOffset;
			//leveltext.text=(n+1).toString();
			mouseChildren = false;
		}
		
		/*public function setType(type:int):void
		{
			if (type == UNLOCKED) {
				icon = new homeButtonMc();
				this.addChild(icon);
					if (icon is lockedMc) {
						this.removeChild(icon);
						icon = null;
					}
				addEventListener(MouseEvent.CLICK, clicked);
			} else if (type == LOCKED) {
				icon = new lockedMc();
				this.addChild(icon);
					if (icon is homeButtonMc) {
						this.removeChild(icon);
						icon = new lockedMc();
						this.addChild(icon);
					}
			}
		}*/
		
		public function remove():void
		{
			nums = 0;
			//if (hasEventListener(MouseEvent.CLICK)) {
			if (icon is homeButtonMc) {
				removeEventListener(MouseEvent.CLICK, clicked);
			}
			this.removeChild(icon);
			icon = null;
		}
		// запускает экран загрузки
		public function clicked(e:MouseEvent):void {
			trace("start level №" + level);
			LevelSelectionMC.remove();
			LevelDirector.createLevel(level);
			//Platformer.needToStartLevel = level;
			/*LevelDirector.removeScreen = false;
			LevelDirector.screen.gotoAndPlay(1);
			LevelDirector.screen.visible = true;
			needToStartLevel = level;
			CameraManager._cameraLoading.addEventListener(Event.ENTER_FRAME, LevelDirector.setLoadingScreen);*/
		}
	}
}
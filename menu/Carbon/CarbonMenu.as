package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CarbonMenu extends MovieClip {
		public static var levelList:LevelList;
		public static var levelCursor:LevelCursor;
		public static var levelInfo:LevelInfo;
		public static var carbonMenu:CarbonMenu;
		private var watermelons:WatermelonsBG;
		
		public static var playingLevel:Point;
		
		private static var globalOffset:int = 0;
		public var left:Boolean = false;
		public var right:Boolean = false;
		public var up:Boolean = false;
		public var down:Boolean = false;
		
		private static var loadingLayer:MovieClip;
		
		public function CarbonMenu(parent:DisplayObjectContainer) {
			parent.addChild(this);
			loadingLayer = new MovieClip();
			watermelons = new WatermelonsBG(this);
			carbonMenu = this;
			levelList = new LevelList(this);
			levelList.addRow();
			levelInfo = new LevelInfo(this);
			levelCursor = new LevelCursor(levelList);
			playingLevel = levelCursor.location.clone();
			MainMenu.getStage().addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			MainMenu.getStage().addEventListener(KeyboardEvent.KEY_UP, keyUp);
			addEventListener(Event.ENTER_FRAME, update);
			LevelInfoLoader.loadLevel();
			CameraManager.loadingScreen.addChild(loadingLayer);
		}
		
		private function update(e:Event):void {
			if (globalOffset > 0) {
				levelList.y += 0.1 * globalOffset;
				globalOffset -= 0.1 * globalOffset;
			} else if (globalOffset < 0) {
				levelList.y += 0.1 * globalOffset;
				globalOffset -= 0.1 * globalOffset;
			} else if (globalOffset == 0) {
				levelCursor.update();
			}
			if (levelList.y > 0) {
				levelList.y = 0;
			}
			 else if (levelList.y < -400) {
			   levelList.y = -400;
			}
			watermelons.update(levelList.y);
		}
		
		public static function slide(offset:Number):void {
			globalOffset -= offset;
		}
		
		public static function playLevel():void {
			if (levelList.getLevelAt(levelCursor.location).getStateStr() != "LevelStateClosed") {
				carbonMenu.disallowControls();
				playingLevel = levelCursor.location.clone();
				Platformer.menu.clouds.visible = true;
				Platformer.menu.clouds.appear(load);
			}
		}
		
		private static function load():void {
			LevelLoader.loadLevel(levelList.getLevelAt(levelCursor.location).fileName, onLoad);
			addLoading();
		}
		
		private static function addLoading():void {
			var text:String = "Loading...";
			var itemText:TextField = new TextField();
			itemText.text = text;
			itemText.x = 20;
			itemText.y = 50;
			itemText.visible = true;
			itemText.selectable = false;
			//var mytf:TextFormat = new TextFormat("Zorque-Regular");
			var mytf:TextFormat = new TextFormat();
			var fk:Font = new Kavoon();
			mytf.font = fk.fontName;
			mytf.bold = true;
			mytf.size = 40;
			mytf.align = TextFormatAlign.CENTER;
			itemText.setTextFormat(mytf);
			itemText.defaultTextFormat = mytf;
			itemText.embedFonts = true;
			itemText.width = 600;
			itemText.height = 100;
			itemText.textColor = 0xFFFFFF;
			itemText.multiline = true;
			itemText.wordWrap = true;
			var itemShadow:TextField = new TextField();
			itemShadow.text = text;
			itemShadow.x = itemText.x + 4;
			itemShadow.y = itemText.y + 4;
			itemShadow.visible = true;
			itemShadow.selectable = false;
			itemShadow.setTextFormat(mytf);
			itemShadow.defaultTextFormat = mytf;
			itemShadow.embedFonts = true;
			itemShadow.width = 600;
			itemShadow.height = 100;
			itemShadow.textColor = 0x000000;
			itemShadow.multiline = true;
			itemShadow.wordWrap = true;
			loadingLayer.addChild(itemShadow);
			loadingLayer.addChild(itemText);
		}
		
		private static function removeLoading():void {
			loadingLayer.removeChildren();
		}
		
		private static function onLoad():void {
			removeLoading();
			ButtonBack.hide();
			carbonMenu.hide();
			Platformer.menu.resume(null);
			Platformer.activation(null);
			SoundMusic.stopMenu();
			Platformer.menu.clouds.disappear(SoundMusic.playInGame);
		}
		
		private function keyDown(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case 37: //left
					levelCursor.moveLeft();
					left = true;
					break;
				case 38: //up
					levelCursor.moveUp();
					up = true;
					break;
				case 39: //right
					levelCursor.moveRight();
					right = true;
					break;
				case 40: //down
					levelCursor.moveDown();
					down = true;
					break;
				case 189: //-
					//levelList.getLevelAt(levelCursor.location).advance();
					//levelCursor.removeCurrentRow();
					break;
				case 187: //+=
					///levelList.addRow();
					break;
				case 109: //num-
					///levelCursor.removeCurrentRow();
					break;
				case 107: //num+
					///levelList.addRow();
					break;
				case 13: //enter
					playLevel();
					break;
				default:
			}
		}
		
		private function keyUp(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case 37: //left
					left = false;
					break;
				case 38: //up
					up = false;
					break;
				case 39: //right
					right = false;
					break;
				case 40: //down
					down = false;
					break;
				default: 
			}
		}
		
		public function show():void {
			visible = true;
			MainMenu.getStage().addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			MainMenu.getStage().addEventListener(KeyboardEvent.KEY_UP, keyUp);
			addEventListener(Event.ENTER_FRAME, update)
		}
		
		public function hide():void {
			if (visible) {
				visible = false;
				removeEventListener(Event.ENTER_FRAME, update)
			}
		}
		
		public function disallowControls():void {
			MainMenu.getStage().removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			MainMenu.getStage().removeEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
	}
}
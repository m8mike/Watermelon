package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CompletedScreen extends BigWM {
		private var next:MovieClip;
		private var reload:MovieClip;
		private var levelSelect:MovieClip;
		
		public function CompletedScreen(parent:DisplayObjectContainer) {
			super(parent);
		}
		
		override public function onIn():void {
			addScreen();
		}
		
		private function addScreen():void {
			addText("Level " + (CarbonMenu.levelCursor.location.y + 1) + "-" +
							   (CarbonMenu.levelCursor.location.x + 1) + ": " + 
							   CarbonMenu.levelList.getLevelAt(CarbonMenu.levelCursor.location).name + " completed");
			addText("");
			addText("Popped " + LevelInfo.bubblesPopped + "/" + LevelInfo.numBubbles + " bubbles");
			addText("Collected " + LevelInfo.diamondsCollected + "/" + LevelInfo.numDiamonds + " diamonds");
			//addText("Found 0/3 secrets");
			addButtons();
			if (Platformer._player) {
				Platformer._player.remove();
			}
			Platformer.levelsToComplete.push(CarbonMenu.levelCursor.location.clone());
			SoundMusic.stopInGame();
			SoundMusic.playMenu();
			MainMenu.getStage().addEventListener(KeyboardEvent.KEY_DOWN, handler);
		}
		
		private function handler(e:KeyboardEvent):void {
			//trace(e.keyCode);//"m"77 "-"109
			switch (e.keyCode) {
				case 8: //backspace
					toLevelSelect(null);
					break;
				case 27: //esc
					toLevelSelect(null);
					break;
				case 13: //enter
					toNextLevel(null);
					break;
				case 32: //space
					toNextLevel(null);
					break;
				case 82: //r
					toReloadLevel(null);
					break;
			}
		}
		
		override public function onOut():void {
			Platformer.menu.clouds.disappear();
			removeScreen();
		}
		
		private function addButtons():void {
			next = new button_next();
			next.x = 500;
			next.y = 400;
			next.scaleX = 0.5;
			next.scaleY = next.scaleX;
			
			reload = new button_restart();
			reload.x = 330;
			reload.y = 400;
			reload.scaleX = next.scaleX;
			reload.scaleY = next.scaleX;
			
			levelSelect = new button_levels();
			levelSelect.x = 160;
			levelSelect.y = 400;
			levelSelect.scaleX = next.scaleX;
			levelSelect.scaleY = next.scaleX;
			
			addChild(next);
			addChild(reload);
			addChild(levelSelect);
			
			next.addEventListener(MouseEvent.CLICK, toNextLevel);
			reload.addEventListener(MouseEvent.CLICK, toReloadLevel);
			levelSelect.addEventListener(MouseEvent.CLICK, toLevelSelect);
		}
		
		private function whenLoaded():void {
			removeChildren(1);
			hide();
			SoundMusic.stopMenu();
			SoundMusic.playInGame();
		}
		
		private function removeScreen():void {
			if (next.parent) {	
				next.removeEventListener(MouseEvent.CLICK, toNextLevel);
				reload.removeEventListener(MouseEvent.CLICK, toReloadLevel);
				levelSelect.removeEventListener(MouseEvent.CLICK, toLevelSelect);
				removeChild(next);
				removeChild(reload);
				removeChild(levelSelect);
				removeChildren(1);
				addText("Loading...");
			}
			MainMenu.getStage().removeEventListener(KeyboardEvent.KEY_DOWN, handler);
		}
		
		private function toReloadLevel(e:MouseEvent):void {
			removeScreen();
			LevelLoader.reloadLevel(CarbonMenu.levelList.getLevelAt(CarbonMenu.levelCursor.location).fileName, whenLoaded);
		}
		
		private function toNextLevel(e:MouseEvent):void {
			var loc:Point = CarbonMenu.levelCursor.location.clone();
			if (loc.x == 2) {
				loc.y++;
				loc.x = 0;
			} else {
				loc.x++;
			}
			CarbonMenu.levelCursor.moveTo(loc.x, loc.y);
			removeScreen();
			LevelLoader.loadLevel(CarbonMenu.levelList.getLevelAt(loc).fileName, whenLoaded);
		}
		
		private function toLevelSelect(e:MouseEvent):void {
			hide();
			Platformer.menu.toLevelSelect(null);
			while (Platformer.levelsToComplete.length) {
				CarbonMenu.levelList.getLevelAt(Platformer.levelsToComplete[0]).complete();
				Platformer.levelsToComplete.splice(0, 1);
			}
			var loc:Point = Platformer.levelsToComplete[Platformer.levelsToComplete.length].clone();
			if (loc.x == 2) {
				loc.y++;
				loc.x = 0;
			} else {
				loc.x++;
			}
			CarbonMenu.levelList.getLevelAt(loc).open();
		}
		
		public function addText(text:String):void {
			var itemText:TextField = new TextField();
			itemText.text = text;
			itemText.x = 20;
			itemText.y = 20 + 30 * this.numChildren;
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
			addChild(itemShadow);
			addChild(itemText);
		}
	}
}
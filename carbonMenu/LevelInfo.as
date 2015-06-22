package {
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelInfo {
		private var parent:DisplayObjectContainer;
		private var fileNameTF:TextField;
		private var levelNameTF:TextField;
		private var levelCommentTF:TextField;
		private var saveButtonTF:TextField;
		private var loadButtonTF:TextField;
		private var index:Point;
		
		public function LevelInfo(parent:DisplayObjectContainer) {
			this.parent = parent;
			addFileName("fileName");
			addLevelName("Just a level name");
			addLevelComment("Comment");
			addSaveButton();
			addLoadButton();
		}
		
		public function setLevelInfo(fileName:String, name:String, comment:String, loc:Point):void {
			fileNameTF.text = fileName;
			levelNameTF.text = name;
			levelCommentTF.text = comment;
			index = loc.clone();
		}
		
		private function addFileName(name:String):void {
			fileNameTF = new TextField();
			fileNameTF.text = name;
			fileNameTF.x = 300;
			fileNameTF.y = 0;
			fileNameTF.visible = true;
			fileNameTF.selectable = true;
			fileNameTF.type = TextFieldType.INPUT;
			var mytf:TextFormat = new TextFormat("Arial");
			mytf.size = 18;
			mytf.align = TextFormatAlign.CENTER;
			fileNameTF.setTextFormat(mytf);
			fileNameTF.defaultTextFormat = mytf;
			fileNameTF.width = 240;
			fileNameTF.height = 40;
			fileNameTF.textColor = 0x80FFFF;
			fileNameTF.background = true;
			fileNameTF.backgroundColor = 0x000000;
			fileNameTF.alpha = 0.9;
			fileNameTF.maxChars = 30;
			fileNameTF.wordWrap = true;
			parent.addChild(fileNameTF);
			fileNameTF.addEventListener(FocusEvent.FOCUS_IN, focusIn);
			fileNameTF.addEventListener(FocusEvent.FOCUS_OUT, focusOut);
		}
		
		private function addLevelName(name:String):void {
			levelNameTF = new TextField();
			levelNameTF.text = name;
			levelNameTF.x = 300;
			levelNameTF.y = 50;
			levelNameTF.visible = true;
			levelNameTF.selectable = true;
			levelNameTF.type = TextFieldType.INPUT;
			var mytf:TextFormat = new TextFormat("Zorque-Regular");
			mytf.size = 22;
			mytf.align = TextFormatAlign.CENTER;
			levelNameTF.setTextFormat(mytf);
			levelNameTF.defaultTextFormat = mytf;
			levelNameTF.width = 240;
			levelNameTF.height = 100;
			levelNameTF.textColor = 0xFF8080;
			levelNameTF.background = true;
			levelNameTF.backgroundColor = 0x8080FF;
			levelNameTF.multiline = true;
			levelNameTF.maxChars = 50;
			levelNameTF.wordWrap = true;
			parent.addChild(levelNameTF);
			levelNameTF.addEventListener(FocusEvent.FOCUS_IN, focusIn);
			levelNameTF.addEventListener(FocusEvent.FOCUS_OUT, focusOut);
		}
		
		private function focusIn(e:FocusEvent):void {
			CarbonMenu.levelCursor.disallowMoving();
		}
		
		private function focusOut(e:FocusEvent):void {
			CarbonMenu.levelList.getLevelAt(index).fileName = fileNameTF.text;
			CarbonMenu.levelList.getLevelAt(index).name = levelNameTF.text;
			CarbonMenu.levelList.getLevelAt(index).comment = levelCommentTF.text;
			CarbonMenu.levelCursor.allowMoving();
		}
		
		private function addLevelComment(comment:String):void {
			levelCommentTF = new TextField();
			levelCommentTF.text = comment;
			levelCommentTF.x = 300;
			levelCommentTF.y = 160;
			levelCommentTF.visible = true;
			levelCommentTF.selectable = true;
			levelCommentTF.type = TextFieldType.INPUT;
			var mytf:TextFormat = new TextFormat("Arial");
			mytf.size = 18;
			mytf.align = TextFormatAlign.CENTER;
			levelCommentTF.setTextFormat(mytf);
			levelCommentTF.defaultTextFormat = mytf;
			levelCommentTF.width = 240;
			levelCommentTF.height = 160;
			levelCommentTF.textColor = 0x000000;
			levelCommentTF.background = true;
			levelCommentTF.backgroundColor = 0xC0C0C0;
			levelCommentTF.alpha = 0.9;
			levelCommentTF.multiline = true;
			levelCommentTF.maxChars = 150;
			levelCommentTF.wordWrap = true;
			parent.addChild(levelCommentTF);
			levelCommentTF.addEventListener(FocusEvent.FOCUS_IN, focusIn);
			levelCommentTF.addEventListener(FocusEvent.FOCUS_OUT, focusOut);
		}
		
		private function addSaveButton():void {
			saveButtonTF = new TextField();
			saveButtonTF.text = "Save";
			saveButtonTF.x = 310;
			saveButtonTF.y = 340;
			saveButtonTF.visible = true;
			saveButtonTF.selectable = false;
			var mytf:TextFormat = new TextFormat("Zorque-Regular");
			mytf.size = 22;
			mytf.align = TextFormatAlign.CENTER;
			saveButtonTF.setTextFormat(mytf);
			saveButtonTF.defaultTextFormat = mytf;
			saveButtonTF.width = 100;
			saveButtonTF.height = 30;
			saveButtonTF.textColor = 0x80FF80;
			saveButtonTF.background = true;
			saveButtonTF.backgroundColor = 0x008000;
			saveButtonTF.multiline = true;
			saveButtonTF.maxChars = 150;
			saveButtonTF.wordWrap = true;
			saveButtonTF.addEventListener(MouseEvent.CLICK, saveLevelInfo);
			parent.addChild(saveButtonTF);
		}
		
		private function addLoadButton():void {
			loadButtonTF = new TextField();
			loadButtonTF.text = "Load";
			loadButtonTF.x = 430;
			loadButtonTF.y = 340;
			loadButtonTF.visible = true;
			loadButtonTF.selectable = false;
			var mytf:TextFormat = new TextFormat("Zorque-Regular");
			mytf.size = 22;
			mytf.align = TextFormatAlign.CENTER;
			loadButtonTF.setTextFormat(mytf);
			loadButtonTF.defaultTextFormat = mytf;
			loadButtonTF.width = 100;
			loadButtonTF.height = 30;
			loadButtonTF.textColor = 0x80FF80;
			loadButtonTF.background = true;
			loadButtonTF.backgroundColor = 0x008000;
			loadButtonTF.multiline = true;
			loadButtonTF.maxChars = 150;
			loadButtonTF.wordWrap = true;
			loadButtonTF.addEventListener(MouseEvent.CLICK, loadInfo);
			parent.addChild(loadButtonTF);
		}
		
		private function loadInfo(e:MouseEvent):void {
			LevelInfoLoader.loadLevel();
		}
		
		private function saveLevelInfo(e:MouseEvent):void {
			CarbonMenu.levelList.save();
		}
	}
}
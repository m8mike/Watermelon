package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Credits extends BigWM {
		private var itemText:TextField;
		private var itemShadow:TextField;
		
		public function Credits(parent:DisplayObjectContainer) {
			super(parent);
		}
		
		override public function onIn():void {
			addScreen();
		}
		
		override public function onOut():void {
			removeScreen();
		}
		
		private function addScreen():void {
			if (itemText) {
				itemText.visible = true;
				itemShadow.visible = true;
			} else {
				addText("Author: Mike\nm8m8ke@gmail.com\nFeel free to email me");
			}
		}
		
		private function removeScreen():void {
			itemText.visible = false;
			itemShadow.visible = false;
		}
		
		public function addText(text:String):void {
			itemText = new TextField();
			itemText.text = text;
			itemText.x = 20;
			itemText.y = 120 + 30 * this.numChildren;
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
			itemText.height = 200;
			itemText.textColor = 0xFFFFFF;
			itemText.multiline = true;
			itemText.wordWrap = true;
			itemShadow = new TextField();
			itemShadow.text = text;
			itemShadow.x = itemText.x + 5;
			itemShadow.y = itemText.y + 5;
			itemShadow.visible = true;
			itemShadow.selectable = false;
			itemShadow.setTextFormat(mytf);
			itemShadow.defaultTextFormat = mytf;
			itemShadow.embedFonts = true;
			itemShadow.width = 600;
			itemShadow.height = 200;
			itemShadow.textColor = 0x000000;
			itemShadow.multiline = true;
			itemShadow.wordWrap = true;
			addChild(itemShadow);
			addChild(itemText);
		}
	}
}
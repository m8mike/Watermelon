package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Credits extends MovieClip {
		private var bigWM:MovieClip;
		private var letItOut:Boolean = false;
		private var itemText:TextField;
		private var itemShadow:TextField;
		
		public function Credits(parent:DisplayObjectContainer) {
			bigWM = new loadingBackground();
			parent.addChild(this);
			addChild(bigWM);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function addScreen():void {
			if (itemText) {
				itemText.visible = true;
				itemShadow.visible = true;
			} else {
				addText("lal");
			}
		}
		
		private function update(e:Event):void {
			trace("updating");
			if (bigWM) {
				trace(bigWM.currentFrame);
				if (bigWM.currentFrame == 51) {
					bigWM.gotoAndStop(52);
					addScreen();
				} else if (bigWM.currentFrame == 52) {
					if (letItOut) {
						bigWM.gotoAndPlay(53);
					}
				} else if (bigWM.currentFrame >= 70) {
					letItOut = false;
					bigWM.stop();
					bigWM.visible = false;
					remove();
				}
			}
		}
		
		private function remove():void {
			removeEventListener(Event.ENTER_FRAME, update);
			itemText.visible = false;
			itemShadow.visible = false;
		}
		
		public function hide():void {
			for (var i:int = 0; i < numChildren; i++) {
				getChildAt(i).visible = false;
			}
			bigWM.visible = true;
			letItOut = true;
		}
		
		public function show():void {
			for (var i:int = 0; i < numChildren; i++) {
				getChildAt(i).visible = true;
			}
			itemText.visible = false;
			itemShadow.visible = false;
			bigWM.gotoAndPlay(1);
			bigWM.visible = true;
			visible = true;
			letItOut = false;
			if (!hasEventListener(Event.ENTER_FRAME)) {
				addEventListener(Event.ENTER_FRAME, update);
			}
		}
		
		public function addText(text:String):void {
			itemText = new TextField();
			itemText.text = text;
			itemText.x = 20;
			itemText.y = 120 + 30 * this.numChildren;
			itemText.visible = true;
			itemText.selectable = false;
			var mytf:TextFormat = new TextFormat("Zorque-Regular");
			mytf.size = 40;
			mytf.align = TextFormatAlign.CENTER;
			itemText.setTextFormat(mytf);
			itemText.defaultTextFormat = mytf;
			itemText.width = 600;
			itemText.height = 100;
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
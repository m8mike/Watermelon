package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class ScrollBar {
		private var bar:MovieClip;
		private var point:MovieClip;
		private var x:Number;
		private var parent:DisplayObjectContainer;
		private var itemText:TextField;
		private var itemShadow:TextField;
		private var _selected:Boolean = false;
		private var onChange:Function;
		
		public function ScrollBar(parent:DisplayObjectContainer, x:Number, y:Number, text:String) {
			this.x = x;
			this.parent = parent;
			
			addText(text, x - 200, y - 20);
			
			bar = new scroll_bar();
			bar.x = x;
			bar.y = y;
			bar.scaleX = 0.2;
			bar.scaleY = 0.2;
			parent.addChild(bar);
			point = new scroll_point();
			point.x = x + 309;
			point.y = y + 10;
			point.scaleX = 0.15;
			point.scaleY = 0.15;
			parent.addChild(point);
			show();
			if (text == "Music") {
				onChange = SoundMusic.setVolume;
			} else if (text == "Sound") {
				onChange = SoundMusic.setSoundVolume;
			}
		}
		
		private function getValue():Number {
			var val:Number = (point.x - (x + 10)) / (x + 310 - (x + 10));
			if (val < 0) {
				val = 0;	
			}
			return val;
		}
		
		private function moveOnArrows(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case 37: //left
					if (point.x > x + 10) {
						point.x -= 10;
						onChange(getValue());
					}
					break;
				case 39: //right
					if (point.x < x + 301) {
						point.x += 10;
						onChange(getValue());
					}
					break;
			}
		}
		
		public function select():void {
			itemText.textColor = 0x00FF00;
			itemShadow.textColor = 0xFF0000;
			_selected = true;
			MainMenu.getStage().addEventListener(KeyboardEvent.KEY_DOWN, moveOnArrows);
		}
		
		public function diselect():void {
			itemText.textColor = 0xFFFFFF;
			itemShadow.textColor = 0x000000;
			_selected = false;
			MainMenu.getStage().removeEventListener(KeyboardEvent.KEY_DOWN, moveOnArrows);
		}
		
		private function up(e:MouseEvent):void {
			MainMenu.getStage().removeEventListener(MouseEvent.MOUSE_MOVE, scroll);
		}
		
		private function down(e:MouseEvent):void {
			if (!MainMenu.getStage().hasEventListener(MouseEvent.MOUSE_MOVE)) {	
				MainMenu.getStage().addEventListener(MouseEvent.MOUSE_MOVE, scroll);
			}
		}
		
		private function scroll(e:MouseEvent):void {
			if (e.stageX > x && e.stageX < x + 310) {	
				point.x = e.stageX;
				onChange(getValue());
			} else if (e.stageX >= x + 310) {
				point.x = x + 309;
				onChange(getValue());
			} else if (e.stageX <= x) {
				point.x = x + 1;
				onChange(getValue());
			}
		}
		
		private function addText(text:String, x:Number, y:Number):void {
			itemText = new TextField();
			itemText.text = text;
			itemText.x = x;
			itemText.y = y;
			itemText.visible = true;
			itemText.selectable = false;
			//var mytf:TextFormat = new TextFormat("Zorque-Regular");
			var mytf:TextFormat = new TextFormat();
			var fk:Font = new Kavoon();
			mytf.font = fk.fontName;
			mytf.bold = true;
			mytf.size = 40;
			itemText.setTextFormat(mytf);
			itemText.defaultTextFormat = mytf;
			itemText.embedFonts = true;
			itemText.width = 600;
			itemText.height = 100;
			itemText.textColor = 0xFFFFFF;
			itemText.multiline = true;
			itemText.wordWrap = true;
			itemShadow = new TextField();
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
			parent.addChild(itemShadow);
			parent.addChild(itemText);
		}
		
		public function show():void {
			point.addEventListener(MouseEvent.MOUSE_DOWN, down);
			MainMenu.thisIs.addEventListener(MouseEvent.MOUSE_UP, up);
			bar.addEventListener(MouseEvent.CLICK, scroll);
			bar.addEventListener(MouseEvent.MOUSE_DOWN, down);
			MainMenu.thisIs.addEventListener(Event.DEACTIVATE, up);
		}
		
		public function hide():void {
			if (MainMenu.getStage().hasEventListener(MouseEvent.MOUSE_MOVE)) {
				MainMenu.getStage().removeEventListener(MouseEvent.MOUSE_MOVE, scroll);
			}
			point.removeEventListener(MouseEvent.MOUSE_DOWN, down);
			MainMenu.thisIs.removeEventListener(MouseEvent.MOUSE_UP, up);
			bar.removeEventListener(MouseEvent.CLICK, scroll);
			bar.removeEventListener(MouseEvent.MOUSE_DOWN, down);
			MainMenu.thisIs.removeEventListener(Event.DEACTIVATE, up);
		}
		
		public function get selected():Boolean {
			return _selected;
		}
	}
}
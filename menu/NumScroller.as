package {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class NumScroller extends MovieClip {
		private var heightChanger:TextField;
		private var num:int;
		private var current:int;
		private var text:String;
		
		public var asset:Array;
		
		//private var assetY:Number;
		
		public function NumScroller(parent:DisplayObjectContainer, asset:Array, text:String = "") {
			parent.addChild(this);
			this.text = text + ": ";
			this.asset = asset;
			//assetY = asset.y;
			addHeightChanger(onDown);
		}
		
		private function addHeightChanger(handler:Function):void {
			heightChanger = new TextField();
			heightChanger.x = 150;
			heightChanger.y = 50 + EditorBackground._numScrollers.length * 20;
			heightChanger.visible = true;
			heightChanger.selectable = false;
			heightChanger.text = text + "00";
			var mytf:TextFormat = new TextFormat("Courier New");
			heightChanger.setTextFormat(mytf);
			heightChanger.defaultTextFormat = mytf;
			heightChanger.width = 140;
			heightChanger.height = 20;
			heightChanger.background = true;
			heightChanger.backgroundColor = 0x000000;
			//heightChanger.alpha = 0.9;
			heightChanger.textColor = 0xFF0000;
			heightChanger.addEventListener(MouseEvent.MOUSE_DOWN, handler);
			addChild(heightChanger);
		}
		
		private function onDown(e:MouseEvent):void {
			stage.addEventListener(MouseEvent.MOUSE_MOVE, change);
			stage.addEventListener(MouseEvent.MOUSE_UP, onUp);
			num = e.stageY;
			current = parseInt(heightChanger.text.substr(text.length));
		}
		
		private function onUp(e:MouseEvent):void {
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, change);
			stage.removeEventListener(MouseEvent.MOUSE_UP, onUp);
		}
		
		private function change(e:MouseEvent):void {
			heightChanger.text = text + String(current + num - e.stageY);
			//asset.y = assetY + parseInt(heightChanger.text.substr(text.length));
			for each (var costume:AnimationCostume in asset) {
				costume.animation.bitmap.y = parseInt(heightChanger.text.substr(text.length));
			}
		}
	}
}
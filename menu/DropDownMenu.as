package {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class DropDownMenu extends MovieClip {
		private var items:Array = [];
		private var location:Point;
		public var selectedItem:MenuItem;
		
		public function DropDownMenu(loc:Point, parent:DisplayObjectContainer) {
			location = loc;
			parent.addChild(this);
			addEventListener(MouseEvent.CLICK, dropDown);
		}
		
		public function pushItem(text:String) {
			var loc:Point = new Point(location.x, location.y + items.length * 20);
			var item:MenuItem = new MenuItem(text, loc, this);
			if (items.length == 0) {
				selectedItem = item;
			} else {
				item.visible = false;
			}
			items.push(item);
		}
		
		private function dropDown(e:MouseEvent):void {
			selectedItem.unselect();
			removeEventListener(MouseEvent.CLICK, dropDown);
			addEventListener(MouseEvent.ROLL_OUT, rollOut);
			addEventListener(MouseEvent.CLICK, select);
			setVisible(true);
		}
		
		private function setVisible(vis:Boolean):void {
			for each (var item:MenuItem in items) {
				if (selectedItem != item) {
					item.visible = vis;
				}
			}
		}
		
		private function show():void {
		}
		
		private function select(e:MouseEvent):void {
			selectedItem = MenuItem(DisplayObject(e.target).parent);
			selectedItem.select(location);
			setVisible(false);
			removeEventListener(MouseEvent.ROLL_OUT, rollOut);
			removeEventListener(MouseEvent.CLICK, select);
			addEventListener(MouseEvent.CLICK, dropDown);
		}
		
		private function rollOut(e:MouseEvent):void {
			selectedItem.select(location);
			setVisible(false);
			removeEventListener(MouseEvent.ROLL_OUT, rollOut);
			removeEventListener(MouseEvent.CLICK, select);
			addEventListener(MouseEvent.CLICK, dropDown);
		}
		
		public function remove():void {
			for each (var item:MenuItem in items) {
				item.remove();
				items.splice(items.indexOf(item), 1);
			}
			if (this.hasEventListener(MouseEvent.ROLL_OUT)) {
				removeEventListener(MouseEvent.ROLL_OUT, rollOut);
				removeEventListener(MouseEvent.CLICK, select);
			} else if (hasEventListener(MouseEvent.CLICK)) {
				removeEventListener(MouseEvent.CLICK, dropDown);
			}
		}
	}
}
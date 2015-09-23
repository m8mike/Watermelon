package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Workspace extends MovieClip {
		private var select:Function;
		private var create:Function;
		private var remove:Function;
		
		public function Workspace(select:Function, create:Function, remove:Function) {
			this.select = select;
			this.create = create;
			this.remove = remove;
			graphics.beginFill(0x000000, 0);
			graphics.drawRect( -1000, -1000, 5000, 5000);
			graphics.endFill();
			CameraManager.invisibleButtons.addChild(this);
		}
		
		public function setVisibility(vis:Boolean):void {
			visible = vis;
		}
		
		public function resetMode():void {
			removeEventListener(MouseEvent.CLICK, select);
			removeEventListener(MouseEvent.CLICK, create);
			removeEventListener(MouseEvent.CLICK, remove);
		}
		
		public function setModeToCreate():void {
			resetMode();
			setVisibility(true);
			addEventListener(MouseEvent.CLICK, create);
			addEventListener(MouseEvent.CLICK, remove);
		}
		
		public function setModeToSelect():void {
			resetMode();
			setVisibility(true);
			addEventListener(MouseEvent.CLICK, select);
		}
	}
}
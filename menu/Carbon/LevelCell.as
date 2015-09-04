package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.getQualifiedClassName;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelCell {
		private var _state:LevelState;
		private var _location:Point;
		private var _parent:DisplayObjectContainer;
		private var icon:MovieClip;
		
		public var fileName:String = "default";
		public var name:String = "default";
		public var comment:String = "default";
		
		public function LevelCell(state:LevelState, location:Point, parent:DisplayObjectContainer) {
			_state = state;
			_location = location;
			_parent = parent;
			icon = _state.getSprite(LevelList.OFFSET_X + location.x * LevelList.OFFSET_BETWEEN_LEVELS, 
												  LevelList.OFFSET_Y + location.y * LevelList.OFFSET_BETWEEN_LEVELS);
			var shadow:MovieClip = new MovieClip();
			shadow.graphics.beginFill(0x00FF80, 0.6);
			shadow.graphics.drawRoundRect(0, 0, 200, 200, 80);
			shadow.graphics.endFill();
			shadow.x = location.x - 30;
			shadow.y = location.y - 30;
			icon.addChildAt(shadow, 0);
			icon.addEventListener(MouseEvent.CLICK, moveCursor);
			parent.addChild(icon);
		}
		
		public function open():void {
			if (_state is LevelStateClosed) {
				icon.removeChildAt(icon.numChildren - 1);
				icon.removeChildAt(icon.numChildren - 1);
				icon.removeChildAt(icon.numChildren - 1);
				_state.remove();
				_state = new LevelStateOpen();
				icon.addChildAt(LevelStateOpen(_state).getAnotherSprite(), 1);
				icon.addChild(_state.getAnimation(LevelList.OFFSET_X + location.x * LevelList.OFFSET_BETWEEN_LEVELS,
												  LevelList.OFFSET_Y + location.y * LevelList.OFFSET_BETWEEN_LEVELS));
				_parent.addChild(icon);
			}
		}
		
		public function complete():void {
			if (_state is LevelStateOpen) {
				icon.removeChildAt(icon.numChildren - 1);
				//icon.removeChildAt(icon.numChildren - 1);
			} else if (_state is LevelStateClosed) {
				icon.removeChildAt(icon.numChildren - 1);
				icon.removeChildAt(icon.numChildren - 1);
				icon.removeChildAt(icon.numChildren - 1);
			} else {
				return void;
			}
			_state.remove();
			_state = new LevelStateFinished();
			icon.addChildAt(LevelStateFinished(_state).getAnotherSprite(), 1);
			icon.addChild(_state.getAnimation(LevelList.OFFSET_X + location.x * LevelList.OFFSET_BETWEEN_LEVELS,
											  LevelList.OFFSET_Y + location.y * LevelList.OFFSET_BETWEEN_LEVELS));
			_parent.addChild(icon);
		}
		/*
		public function advance():void {
			if (_state is LevelStateClosed) {
				icon.removeChildAt(icon.numChildren - 1);
				//icon.removeChildAt(icon.numChildren - 1);
				_state.remove();
				_state = new LevelStateOpen();
				icon.addChildAt(LevelStateOpen(_state).getAnotherSprite(), 1);
				icon.addChild(_state.getAnimation(LevelList.OFFSET_X + location.x * LevelList.OFFSET_BETWEEN_LEVELS,
												  LevelList.OFFSET_Y + location.y * LevelList.OFFSET_BETWEEN_LEVELS));
				_parent.addChild(icon);
			} else if (_state is LevelStateOpen) {
				icon.removeChildAt(icon.numChildren - 1);
				//icon.removeChildAt(icon.numChildren - 1);
				_state.remove();
				_state = new LevelStateFinished();
				icon.addChildAt(LevelStateFinished(_state).getAnotherSprite(), 1);
				icon.addChild(_state.getAnimation(LevelList.OFFSET_X + location.x * LevelList.OFFSET_BETWEEN_LEVELS,
												  LevelList.OFFSET_Y + location.y * LevelList.OFFSET_BETWEEN_LEVELS));
				_parent.addChild(icon);
			}
		}
		*/
		private function moveCursor(e:MouseEvent):void {
			CarbonMenu.levelCursor.allowMoving();
			CarbonMenu.levelCursor.moveTo(_location.x, _location.y);
		}
		
		public function getStateStr():String {
			return getQualifiedClassName(_state);
		}
		
		public function remove():void {
			if (_state) {
				_state.remove();
			}
			if (_location) {
				_location = null;
			}
		}
		
		public function moveUp():void {
			_state.moveUp();
		}
		
		public function getXMLStr():String {
			var stateID:int;
			if (_state is LevelStateFinished) {
				stateID = 0;
			} else if (_state is LevelStateOpen) {
				stateID = 1;
			} else if (_state is LevelStateClosed) {
				stateID = 2;
			}
			var str:String = "<level><fileName>";
			str += fileName;
			str += "</fileName>";
			str += "<levelName>";
			str += name;
			str += "</levelName>";
			str += "<comment>";
			str += comment;
			str += "</comment>";
			str += "<state>";
			str += stateID;
			str += "</state></level>";
			return str;
		}
		
		public function get location():Point {
			return _location;
		}
	}
}
package {
	import flash.display.MovieClip;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelSelectionMC {
		public static var _levSelMCs:Array = [];
		
		public static function add(beaten:int):void {
			for (var x:int = 0; x < setupClass.totalLevels; x++) {
				_levSelMCs.push(new levelSelectMc(x, (x <= beaten)));
			}
			for each (var lev:levelSelectMc in _levSelMCs) {
				CameraManager.menu.addChild(lev);
			}
		}
		
		/*public function reinit(beaten:int):void
		   {
		   for each(var lev:levelSelectMc in _levSelMCs) {
		   lev.remEvLis();
		   }
		   _levSelMCs = [];
		   for (var x:int = 0; x < setupClass.totalLevels; x++) {
		   var levelSelect:levelSelectMc = new levelSelectMc(x, (x <= beaten));
		   addChild(levelSelect);
		   _levSelMCs.push(levelSelect);
		   }
		}*/ /*public function setup(beaten:int):void
		   {
		   for (var x:int = 0; x < setupClass.totalLevels; x++) {
		   if (levelSelectMc.nums < 81) {
		   var levelSelect:levelSelectMc = new levelSelectMc(x, (x <= beaten));
		   addChild(levelSelect);
		   _levSelMCs.push(levelSelect);
		   }
		}*/
		
		/*for (var x:int = 0; x < setupClass.totalLevels; x++) {
		   _levSelMCs[x].visible = true;
		   if (x <= beaten){
		   _levSelMCs[x].setType(levelSelectMc.UNLOCKED);
		   } else {
		   _levSelMCs[x].setType(levelSelectMc.LOCKED);
		   }
		}*/
		//}
		
		public static function remove():void {
			for each (var lev:levelSelectMc in _levSelMCs) {
				lev.remove();
				CameraManager.menu.removeChild(lev);
				lev = null;
			}
			_levSelMCs = [];
		}
	}
}
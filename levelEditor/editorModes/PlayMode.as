package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class PlayMode extends EditorMode {
		
		public function PlayMode() {
			super();
		}
		
		override protected function nextMode():EditorMode {
			return new EditMode();
		}
		
		override public function show():void {
			HUD.editorStateTF.text = "PLAY";
			PhysiVals.spriteToDebugDraw.visible = false;
		}
		
		override public function remove():void {
			
		}
	}
}
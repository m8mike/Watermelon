package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class EditMode extends EditorMode {
		
		public function EditMode() {
			super();
		}
		
		override protected function nextMode():EditorMode {
			return new CreateMode();
		}
		
		override public function show():void {
			HUD.editorStateTF.text = "EDIT";
			HUD.setInfoVisibility(true);
			HUD.workspace.setModeToSelect();
			PhysiVals.spriteToDebugDraw.visible = true;
			HUD.showEdit();
		}
		
		override public function remove():void {
			HUD.setInfoVisibility(false);
		}
	}
}
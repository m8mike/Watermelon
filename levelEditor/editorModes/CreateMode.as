package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CreateMode extends EditorMode {
		
		public function CreateMode() {
			super();
		}
		
		override protected function nextMode():EditorMode {
			return new PlayMode();
		}
		
		override public function show():void {
			HUD.editorStateTF.text = "CREATE";
			HUD.actorType.visible = true;
			HUD.workspace.setModeToCreate();
			HUD.showCreate();
			EditorSpawn.respawnButton.visible = true;
		}
		
		override public function remove():void {
			HUD.setInfoVisibility(false);
			HUD.actorType.visible = false;
		}
	}
}
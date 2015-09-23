package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class EditorMode {
		public static var current:EditorMode;
		
		public function EditorMode() {
			show();
		}
		
		public static function change():void {
			if (current) {	
				current.remove();
				current = current.nextMode();
			} else {
				current = new PlayMode();
			}
			current.show();
		}
		
		protected function nextMode():EditorMode {
			return null;
		}
		
		public function show():void {
			
		}
		
		public function remove():void {
			
		}
	}
}
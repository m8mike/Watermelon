package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class HUD {
		public static var _changes:Array = [];
		public static var _simpleButtons:Array = [];
		public static var _teleportTo:Array = [];
		public static var _moveTo:Array = [];
		
		public static var workspace:Workspace;
		public static var reloadPlatformButton:MovieClip;
		
		public static var visible:Boolean = true;
		public static var condition:int = 1;
		
		public static var actorToAdd:int = 0;
		
		public static var editorStateTF:TextField;
		public static var actorType:DropDownMenu;
		/*
		private static const characterList:Array = ["CrateBox", "Diminishing", "Dummy", "DummyCircle", 
														"DummySplitter", "Ghost", "Player"];
		private static const collectableList:Array = ["BazookaBonus", "BubbleBonus", "JetpackBonus", "Key", 
														"SnowGunBonus", "UmbrellaBonus", "DiamondBonus"];
		public static const platformList:Array = ["Cloud", "Door", "JumpThrough", "Spikes", "SpringBush", 
													"Standard", "Teleproter", "EndLevel", "TopHat", "Wooden", "Fan"];
		*/
		public function HUD() {
			
		}
		
		public static function getActorText():String {
			return actorType.selectedItem.getText();
		}
		
		public static function setToPlayState():void {
			hide();
			while (!(EditorMode.current is PlayMode)) {
				EditorMode.change();
			}
		}
		
		public static function toggleInfo(e:MouseEvent = null):void {
			hide();
			EditorMode.change();
		}
		
		private static function hide():void {
			if (!EditorMode.current) {
				EditorMode.current = new EditMode();
			}
			EditorMode.current.remove();
		}
		
		public static function showEdit():void {
			for each (var tf4:TextField in _teleportTo) {
				tf4.visible = false;
			}
		}
		
		public static function showCreate():void {
			LevelEditor.spawn.setVisibility(true);
			/*for each (var tf3:TextField in _spawn) {
				tf3.visible = true;
			}*/
			for each (var tf2:TextField in _simpleButtons) {
				tf2.visible = true;
			}
			LevelEditor.background.setNumScrollersVisibility(true);
			for each (var tf1:TextField in _moveTo) {
				tf1.visible = false;
			}
			for each (var tf0:TextField in _teleportTo) {
				tf0.visible = false;
			}
		}
		
		public static function setInfoVisibility(vis:Boolean):void {
			LevelEditor.bodyProperties.setInfoVisibility(vis);
			LevelEditor.spawn.setVisibility(vis);
			/*for each (var tf3:TextField in _spawn) {
				tf3.visible = vis;
			}*/
			for each (var tf4:TextField in _simpleButtons) {
				tf4.visible = vis;
			}
			LevelEditor.background.setNumScrollersVisibility(vis);
			for each (var tf5:TextField in _moveTo) {
				tf5.visible = vis;
			}
			for each (var tf6:TextField in _teleportTo) {
				tf6.visible = vis;
			}
			for each (var cb:MyCheckBox in _changes) {
				vis?cb.show():cb.hide();
			}
			workspace.setVisibility(vis);
			reloadPlatformButton.visible = vis;
		}
		
		public static function addSimpleButton(x:Number, y:Number, text:String, onClick:Function):void {
			var simpleButton:TextField = new TextField();
			simpleButton.x = x;
			simpleButton.y = y;
			simpleButton.visible = true;
			simpleButton.selectable = false;
			simpleButton.text = text;
			var mytf:TextFormat = new TextFormat("Courier New");
			simpleButton.setTextFormat(mytf);
			simpleButton.defaultTextFormat = mytf;
			simpleButton.width = 100;
			simpleButton.height = 20;
			simpleButton.background = true;
			simpleButton.backgroundColor = 0x000000;
			simpleButton.textColor = 0xFF0000;
			CameraManager.hud.addChild(simpleButton);
			simpleButton.addEventListener(MouseEvent.CLICK, onClick);
			_simpleButtons.push(simpleButton);
		}
		
		public static function addReloadButton():void {
			reloadPlatformButton = new hat02();
			reloadPlatformButton.x = 500;
			reloadPlatformButton.y = 18 * 20;
			reloadPlatformButton.scaleX = 0.1;
			reloadPlatformButton.scaleY = 0.1;
			reloadPlatformButton.visible = true;
			CameraManager.hud.addChild(reloadPlatformButton);
			reloadPlatformButton.addEventListener(MouseEvent.CLICK, reloadPlatform);
		}
		
		public static function addCheckBox(enabled:Boolean, num:int):void {
			var cb:MyCheckBox = new MyCheckBox(enabled, num);
			_changes.push(cb);
		}
		
		public static function addMoveToText(text:String):void {
			var tf:TextField = new TextField();
			tf.x = 520;
			tf.y = 20 * (16 + _moveTo.length);
			tf.visible = true;
			//tf.selectable = true;
			//tf.type = TextFieldType.INPUT;
			tf.text = text;
			var mytf:TextFormat = new TextFormat("Courier New");
			tf.setTextFormat(mytf);
			tf.defaultTextFormat = mytf;
			tf.width = 50;
			tf.height = 20;
			tf.background = true;
			tf.backgroundColor = 0x000000;
			tf.alpha = 0.7;
			tf.textColor = 0xFF0000;
			_moveTo.push(tf);
			CameraManager.hud.addChild(tf);	
		}
		
		public static function addTeleportToText(text:String):void {
			var tf:TextField = new TextField();
			tf.x = 520;
			tf.y = 20 * (19 + _teleportTo.length);
			tf.visible = false;
			//tf.selectable = true;
			//tf.type = TextFieldType.INPUT;
			tf.text = text;
			var mytf:TextFormat = new TextFormat("Courier New");
			tf.setTextFormat(mytf);
			tf.defaultTextFormat = mytf;
			tf.width = 50;
			tf.height = 20;
			tf.background = true;
			tf.backgroundColor = 0x000000;
			tf.alpha = 0.7;
			tf.textColor = 0xFF0000;
			_teleportTo.push(tf);
			CameraManager.hud.addChild(tf);	
		}
		
		public static function reloadPlatform(e:MouseEvent):void {
			var x:Number = LevelEditor.bodyProperties.getX();
			var y:Number = LevelEditor.bodyProperties.getY();
			var w:Number = LevelEditor.bodyProperties.getW();
			var h:Number = LevelEditor.bodyProperties.getH();
			var angle:Number = LevelEditor.bodyProperties.getAngle();
			LevelEditor.currentPlatform.location.x = x;
			LevelEditor.currentPlatform.location.y = y;
			if (LevelEditor.currentPlatform is Standard) {
				Standard(LevelEditor.currentPlatform).width = w;
				Standard(LevelEditor.currentPlatform).height = h;
			} else if (LevelEditor.currentPlatform is JumpThrough) {
				JumpThrough(LevelEditor.currentPlatform).width = w;
				JumpThrough(LevelEditor.currentPlatform).height = h;
			} else if (LevelEditor.currentPlatform is Spikes) {
				Spikes(LevelEditor.currentPlatform).width = w;
				Spikes(LevelEditor.currentPlatform).height = h;
			} else if (LevelEditor.currentPlatform is Teleporter) {
				Teleporter(LevelEditor.currentPlatform).width = w;
				Teleporter(LevelEditor.currentPlatform).height = h;
				Teleporter(LevelEditor.currentPlatform).setSpawnPoint(Number(TextField(_teleportTo[0]).text) * 20, 
																	(Number(TextField(_teleportTo[1]).text) - 3) * 20);
			} else if (LevelEditor.currentPlatform is GroundBelow) {
				GroundBelow(LevelEditor.currentPlatform).width = w;
				GroundBelow(LevelEditor.currentPlatform).height = h;
			} else if (LevelEditor.currentPlatform is GroundZero) {
				GroundZero(LevelEditor.currentPlatform).width = w;
				GroundZero(LevelEditor.currentPlatform).height = h;
			}
			if (TextField(_moveTo[0]).text != "") {
				LevelEditor.currentPlatform.setMovingTo(parseFloat(TextField(_moveTo[0]).text), parseFloat(TextField(_moveTo[1]).text));
			}
			LevelEditor.currentPlatform.reload();
			LevelEditor.currentPlatform.setAngle(angle);
		}
		
		public static function addEditorState():void {
			editorStateTF = new TextField();
			editorStateTF.x = 300;
			editorStateTF.y = 20;
			editorStateTF.visible = true;
			editorStateTF.selectable = false;
			editorStateTF.text = "EDIT";
			var mytf:TextFormat = new TextFormat("Courier New");
			editorStateTF.setTextFormat(mytf);
			editorStateTF.defaultTextFormat = mytf;
			editorStateTF.width = 50;
			editorStateTF.height = 20;
			editorStateTF.background = true;
			editorStateTF.backgroundColor = 0x000000;
			editorStateTF.alpha = 0.9;
			editorStateTF.textColor = 0xFF0000;
			editorStateTF.addEventListener(MouseEvent.CLICK, toggleInfo);
			CameraManager.hud.addChild(editorStateTF);
		}
		
		public static function addActorType():void {
			actorType = new DropDownMenu(new Point(450, 0), CameraManager.hud);
			actorType.pushItem("Standard");
			
			actorType.pushItem("TreeZero");
			actorType.pushItem("TreeBelow");
			actorType.pushItem("GroundZero");
			actorType.pushItem("GroundBelow");
			actorType.pushItem("TutorialBoard");
			actorType.pushItem("TutorialDown");
			actorType.pushItem("TutorialUp");
			actorType.pushItem("TutorialSponsor");
			actorType.pushItem("TutorialWall");
			
			/*actorType.pushItem("CrateBox");
			actorType.pushItem("Diminishing");
			actorType.pushItem("Dummy");
			actorType.pushItem("DummyCircle");
			actorType.pushItem("DummySplitter");*/
			actorType.pushItem("Ghost");
			actorType.pushItem("Player");
			
			//actorType.pushItem("BazookaBonus");
			actorType.pushItem("BubbleBonus");
			actorType.pushItem("JetpackBonus");
			actorType.pushItem("HatBonus");
			//actorType.pushItem("Key");
			//actorType.pushItem("SnowGunBonus");
			actorType.pushItem("UmbrellaBonus");
			actorType.pushItem("DiamondBonus");
			actorType.pushItem("Heart");
			
			actorType.pushItem("Cloud");
			//actorType.pushItem("Door");
			actorType.pushItem("JumpThrough");
			actorType.pushItem("Spikes");
			actorType.pushItem("SpringBush");
			actorType.pushItem("Teleproter");
			actorType.pushItem("EndLevel");
			actorType.pushItem("TopHat");
			actorType.pushItem("Fan");
			
			actorType.visible = false;
		}
	}
}
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
		public static var _info:Array = [];
		public static var _edit:Array = [];
		public static var _changes:Array = [];
		public static var _spawn:Array = [];
		public static var _simpleButtons:Array = [];
		public static var _numScrollers:Array = [];
		public static var _teleportTo:Array = [];
		public static var _moveTo:Array = [];
		
		public static var invisibleEditButton:MovieClip;
		public static var invisibleCreateButton:MovieClip;
		public static var selectActorButton:MovieClip;
		public static var reloadPlatformButton:MovieClip;
		public static var respawnButton:MovieClip;
		
		public static var visible:Boolean = true;
		public static var condition:int = 1;
		
		public static var actorToAdd:int = 0;
		
		public static const PLAY:int = 0;
		public static const EDIT:int = 1;
		public static const CREATE:int = 2;
		private static var editorStateTF:TextField;
		static private var actorType:DropDownMenu;
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
			condition = PLAY;
			show();
		}
		
		public static function toggleInfo(e:MouseEvent = null):void {
			hide();
			incrementCondition();
			show();
		}
		
		private static function incrementCondition():void {
			if (condition < 2) {
				condition++;
			} else {
				condition = 0;
			}
		}
		
		private static function hide():void {
			switch (condition) {
				case PLAY:
					
				break;
				case EDIT:
					setInfoVisibility(false);
				break;
				case CREATE:
					setInfoVisibility(false);
					actorType.visible = false;
				break;
				default:
			}
		}
		
		private static function show():void {
			switch (condition) {
				case PLAY:
					editorStateTF.text = "PLAY";
					PhysiVals.spriteToDebugDraw.visible = false;
				break;
				case EDIT:
					editorStateTF.text = "EDIT";
					setInfoVisibility(true);
					invisibleCreateButton.visible = false;
					PhysiVals.spriteToDebugDraw.visible = true;
					for each (var tf4:TextField in _teleportTo) {
						tf4.visible = false;
					}
				break;
				case CREATE:
					editorStateTF.text = "CREATE";
					actorType.visible = true;
					invisibleCreateButton.visible = true;
					for each (var tf3:TextField in _spawn) {
						tf3.visible = true;
					}
					for each (var tf2:TextField in _simpleButtons) {
						tf2.visible = true;
					}
					for each (var numScroller:NumScroller in _numScrollers) {
						numScroller.visible = true;
					}
					for each (var tf1:TextField in _moveTo) {
						tf1.visible = false;
					}
					for each (var tf0:TextField in _teleportTo) {
						tf0.visible = false;
					}
					respawnButton.visible = true;
				break;
				default:
			}
		}
		
		private static function setInfoVisibility(vis:Boolean):void {
			for each (var tf1:TextField in _info) {
				tf1.visible = vis;
			}
			for each (var tf2:TextField in _edit) {
				tf2.visible = vis;
			}
			for each (var tf3:TextField in _spawn) {
				tf3.visible = vis;
			}
			for each (var tf4:TextField in _simpleButtons) {
				tf4.visible = vis;
			}
			for each (var numScroller:NumScroller in _numScrollers) {
				numScroller.visible = vis;
			}
			for each (var tf5:TextField in _moveTo) {
				tf5.visible = vis;
			}
			for each (var tf6:TextField in _teleportTo) {
				tf6.visible = vis;
			}
			for each (var cb:MyCheckBox in _changes) {
				vis?cb.show():cb.hide();
			}
			invisibleEditButton.visible = vis;
			invisibleCreateButton.visible = vis;
			reloadPlatformButton.visible = vis;
			respawnButton.visible = vis;
		}
		
		public static function addNumScrollers():void {
			_numScrollers.push(new NumScroller(CameraManager.hud, Hills.line1, "hills01"));
			_numScrollers.push(new NumScroller(CameraManager.hud, Hills.line2, "hills02"));
			_numScrollers.push(new NumScroller(CameraManager.hud, Hills.line3, "hills03"));
			_numScrollers.push(new NumScroller(CameraManager.hud, Hills.line4, "hills04"));
			_numScrollers.push(new NumScroller(CameraManager.hud, BigConiferous.coniferous, "coniferous"));
			_numScrollers.push(new NumScroller(CameraManager.hud, BigMountains.funkyMountains, "mountains"));
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
		
		public static function addRespawnButton():void {
			respawnButton = new hat03();
			respawnButton.x = 100;
			respawnButton.y = 30;
			respawnButton.scaleX = 0.1;
			respawnButton.scaleY = 0.1;
			respawnButton.visible = true;
			CameraManager.hud.addChild(respawnButton);
			respawnButton.addEventListener(MouseEvent.CLICK, respawn);
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
		
		public static function addInvisibleButtons():void {
			invisibleEditButton = new MovieClip();
			invisibleEditButton.graphics.beginFill(0x000000, 0);
			invisibleEditButton.graphics.drawRect( -1000, -1000, 5000, 5000);
			invisibleEditButton.graphics.endFill();
			CameraManager.invisibleButtons.addChild(invisibleEditButton);
			invisibleCreateButton = new MovieClip();
			invisibleCreateButton.graphics.beginFill(0x000000, 0);
			invisibleCreateButton.graphics.drawRect( -1000, -1000, 5000, 5000);
			invisibleCreateButton.graphics.endFill();
			CameraManager.invisibleButtons.addChild(invisibleCreateButton);
			invisibleCreateButton.visible = false;
		}
		
		public static function addCheckBox(enabled:Boolean, num:int):void {
			var cb:MyCheckBox = new MyCheckBox(enabled, num);
			_changes.push(cb);
		}
		
		public static function addInfoText(text:String):void {
			var tf:TextField = new TextField();
			tf.x = 500;
			tf.y = 20 * _info.length;
			tf.visible = true;
			tf.selectable = false;
			tf.text = text;
			var mytf:TextFormat = new TextFormat("Courier New");
			tf.setTextFormat(mytf);
			tf.defaultTextFormat = mytf;
			tf.width = 200;
			tf.height = 20;
			tf.background = true;
			tf.backgroundColor = 0x000000;
			tf.alpha = 0.9;
			tf.textColor = 0xFF0000;
			_info.push(tf);
			CameraManager.hud.addChild(tf);
		}
		
		public static function addEditText(text:String, num:int):void {
			var tf:TextField = new TextField();
			tf.x = 450;
			tf.y = 20 * num;
			tf.visible = true;
			tf.selectable = true;
			tf.type = TextFieldType.INPUT;
			tf.addEventListener(Event.CHANGE, changeText);
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
			_edit.push(tf);
			CameraManager.hud.addChild(tf);	
		}
		
		public static function addRespawnText(text:String):void {
			var tf:TextField = new TextField();
			tf.x = 20;
			tf.y = 80 + 20 * _spawn.length;
			tf.visible = true;
			tf.selectable = true;
			tf.type = TextFieldType.INPUT;
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
			_spawn.push(tf);
			CameraManager.hud.addChild(tf);	
		}
		
		public static function addMoveToText(text:String):void {
			var tf:TextField = new TextField();
			tf.x = 520;
			tf.y = 20 * (16 + _moveTo.length);
			tf.visible = true;
			tf.selectable = true;
			tf.type = TextFieldType.INPUT;
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
			tf.selectable = true;
			tf.type = TextFieldType.INPUT;
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
		
		private static function changeText(e:Event):void {
			if (!LevelEditor.currentPlatform) {
				return void;
			}
			var value:Number = Number(TextField(e.target).text);
			var index:int = _edit.indexOf(TextField(e.target));
			switch (index) {
				case 0:
					
				break;
				case 1:
					
				break;
				case 2:
					
				break;
				case 3:
					
				break;
				case 5:
					LevelEditor.currentPlatform.bodyBuilder.density = value;
				break;
				case 6:
					LevelEditor.currentPlatform.bodyBuilder.friction = value;
				break;
				case 7:
					LevelEditor.currentPlatform.bodyBuilder.restitution = value;
				break;
				default:
			}
		}
		
		public static function respawn(e:MouseEvent):void {
			Platformer._player.hide();
			Platformer._player.invincibilityTime = 10000;
			Platformer._player.spawnPoint.x = Number(TextField(_spawn[0]).text);
			Platformer._player.spawnPoint.y = Number(TextField(_spawn[1]).text);
		}
		
		public static function reloadPlatform(e:MouseEvent):void {
			var x:Number = Number(TextField(_edit[0]).text);
			var y:Number = Number(TextField(_edit[1]).text);
			var w:Number = Number(TextField(_edit[2]).text) / PhysiVals.MIN_SQARE;
			var h:Number = Number(TextField(_edit[3]).text) / PhysiVals.MIN_SQARE;
			var angle:Number = Number(TextField(_edit[4]).text);
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
			actorType = new DropDownMenu(new Point(450, 20), CameraManager.hud);
			actorType.pushItem("CrateBox");
			actorType.pushItem("Diminishing");
			actorType.pushItem("Dummy");
			actorType.pushItem("DummyCircle");
			actorType.pushItem("DummySplitter");
			actorType.pushItem("Ghost");
			actorType.pushItem("Player");
			
			actorType.pushItem("BazookaBonus");
			actorType.pushItem("BubbleBonus");
			actorType.pushItem("JetpackBonus");
			actorType.pushItem("Key");
			actorType.pushItem("SnowGunBonus");
			actorType.pushItem("UmbrellaBonus");
			actorType.pushItem("DiamondBonus");
			actorType.pushItem("Heart");
			
			actorType.pushItem("Cloud");
			actorType.pushItem("Door");
			actorType.pushItem("JumpThrough");
			actorType.pushItem("Spikes");
			actorType.pushItem("SpringBush");
			actorType.pushItem("Standard");
			actorType.pushItem("Teleproter");
			actorType.pushItem("EndLevel");
			actorType.pushItem("TopHat");
			actorType.pushItem("Fan");
			actorType.visible = false;
		}
	}
}
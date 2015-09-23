package {
	import Box2D.Dynamics.b2Body;
	import flash.display.Sprite;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.system.System;
	import flash.text.TextField;
	/**
	* ...
	* @author Mad Mike
	*/
	public class Platformer extends Sprite {
		public static var thisIs:Platformer;
		
		public static var _player:Player;
		
		public static var platforms:Array = [];
		public static var characters:Array = [];
		public static var collectables:Array = [];
		public static var decorations:Array = [];
		
		public static var levelsToComplete:Array = [];
		
		public static var _bodiesToRemove:Array = [];
		
		public static var deleteAll:Boolean = false;
		public static var removeCollectables:Boolean = false;
		
		public static var controls:Controls;
		public static var menu:MainMenu;
		public static var dummyPlayer:DummyPlayer;
		
		public function Platformer() {
			new MyFont();
			thisIs = this;
			//new Costumer();
			CameraManager.initCameras();
			new StartScreen();
		}
		
		public static function startGame():void {
			Raster.cacheBackground();
			PhysiVals.setupPhysicsWorld();
			PhysiVals.setupTimers();
			CameraManager.hud.visible = false;
			new LevelEditor();
			menu = new MainMenu(thisIs);
			//LevelDirector.createLevel(0);
			//LevelSelectionMC.add(33);
			//LevelDirector.createLevel(1);
			//setupDebugDraw();
			thisIs.addEventListener(Event.ENTER_FRAME, thisIs.newEventListener);
			thisIs.stage.addEventListener(Event.DEACTIVATE, deactivation);
			thisIs.stage.addEventListener(Event.ACTIVATE, activation);
			controls = new Controls();
		}
		
		private function newEventListener(e:Event):void {
			++PhysiVals.periods;
			PhysiVals.world.Step(1 / PhysiVals.fps, 10);
			if (removeCollectables) {
				if (collectables.length) {
					Collectable(collectables[0]).remove();
				} else {
					if (_player) {	
						_player.remove();
					}
					removeCollectables = false;
					if (LevelLoader.xmlToLoad) {
						LevelLoader.reloadXml();
					}
				}
			} else if (deleteAll) {
				if (platforms.length) {
					Platform(platforms[0]).remove();
					trace("removing platforms");
				} else if (collectables.length) {
					trace("removing collectables");
					Collectable(collectables[0]).remove();
				} else if (characters.length) {
					trace("removing characters");
					Character(characters[0]).remove();
				} else if (decorations.length) {
					trace("removing decorations");
					Decor(decorations[0]).remove();
				} else {
					trace("deleted");
					deleteAll = false;
					if (LevelLoader.xmlToLoad) {
						LevelLoader.loadXml();
						do {	
							EditorBackground.toggleBackground(null);
						} while (!EditorBackground.enabled)
					}
				}
			}
			for each (var platform:Platform in platforms) {
				if (platform is Teleporter) {
					Teleporter(platform).check();
				} else if (platform is SpringBush) {
					platform.updateNow();
				}
				if (platform.behavior) {
					platform.updateNow();
				}
			}
			for each (var decor:Decor in decorations) {
				decor.updateNow();
			}
			for each (var collectable:Collectable in collectables) {
				collectable.updateNow();
			}
			for each (collectable in collectables) {
				if (collectable.needBody) {
					collectable.createBodies();
					break;
				}
			}
			var ghostCount:int = 0;
			for each (var character:Actor in characters) {
				character.updateNow();
				if (character is Ghost) {
					ghostCount++;
				} else if (character is Diminishing) {
					if (Diminishing(character).needBody) {
						Diminishing(character).initBody();
					}
				} else if (character is DummySplitter) {
					if (DummySplitter(character).needBody) {
						DummySplitter(character).initBody();
					}
				}
			}
			/*if (ghostCount == 0) {
				new Ghost(30, -10);
				//countPixels(thisIs);
				//trace("<end>");
			}*/
			reallyRemoveActors();
			if (Controls.zoom) {
				CameraManager.zoomKoef *= 1.1;
			} else if (Controls.unzoom) {
				CameraManager.zoomKoef /= 1.1;
			}
			if (_player) {
				if (!_player.deleted){
					CameraManager.zoomCameras(CameraUpdater.getCameraSection());
					if (_player.getSpriteLoc().y > 3000) {
						CameraManager.freePoint = CameraUpdater.getCameraSection();
						_player.hide();
						_player.changeSpawnPoint(10, -10);
						_player.spawn();
						//_player.startSplash();
					}
				} else {
					CameraManager.zoomCameras(CameraManager.freePoint);
					if (_player.invincibilityTime > 1000) {
						//_player.setSpawnPoint(new Point(2 * 20, -6 * 20));
						if (_player.carryingItem) {	
							_player.carryingItem.remove();
							_player.carryingItem = null;
						}
						/*while (_player.inventory._lifes.length < 3) {	
							_player.inventory.addLife();
						}*/
						LevelLoader.reloadLevel(CarbonMenu.levelList.getLevelAt(CarbonMenu.levelCursor.location).fileName);
					}
				}
			} else {
				if (dummyPlayer) {
					dummyPlayer.init();
					dummyPlayer = null;
				}
				if (Controls.freeDown) {
					CameraManager.freePoint.y += 10;
				} else if (Controls.freeUp) {
					CameraManager.freePoint.y -= 10;
				}
				if (Controls.freeLeft) {
					CameraManager.freePoint.x -= 10;
				} else if (Controls.freeRight) {
					CameraManager.freePoint.x += 10;
				}
				CameraManager.zoomCameras(CameraManager.freePoint);
			}
		}
		
		// Mark an actor to be removed later
		public static function safeRemoveBody(bodyToRemove:b2Body):void {
			if (_bodiesToRemove.indexOf(bodyToRemove) < 0) {
				_bodiesToRemove.push(bodyToRemove);
			}
		}
		// Actually remove an actors that have been marked for deletion
		// in my removeActor function
		private function reallyRemoveActors():void {
			for each (var removeMe:b2Body in _bodiesToRemove) {
				PhysiVals.world.DestroyBody(removeMe);
			}
			_bodiesToRemove = [];
		}
		
		public static function activation(e:Event):void {
			PhysiVals.fps = 30.0;
			Controls.allowControls();
		}
		
		public static function deactivation(e:Event):void {
			PhysiVals.fps = Infinity;
			Controls.disallowControls();
		}
		
		public static function setFullScreen():void {
			thisIs.stage.displayState = StageDisplayState.FULL_SCREEN;
		}
	}
}
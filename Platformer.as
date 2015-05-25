package {
	import actors.Character;
	import actors.Collectable;
	import actors.Decor;
	import Box2D.Collision.b2AABB;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2World;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.system.System;
	import flash.text.TextField;
	import flash.utils.Timer;
	import menu.LevelSelectionMC;
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
		
		public static var _bodiesToRemove:Array = [];
		
		public static var deleteAll:Boolean = false;
		
		//public static var controls:Controls;
		
		public function Platformer() {
			thisIs = this;
			CameraManager.initCameras();
			Raster.cacheBackground();
			PhysiVals.setupPhysicsWorld();
			PhysiVals.setupTimers();
			new LevelEditor();
			LevelSelectionMC.add(33);
			//LevelDirector.createLevel(1);
			addEventListener(Event.ENTER_FRAME, newEventListener);
			stage.addEventListener(Event.DEACTIVATE, deactivation);
			stage.addEventListener(Event.ACTIVATE, activation);
			//setupDebugDraw();
		}
		
		private function newEventListener(e:Event):void {
			++PhysiVals.periods;
			PhysiVals.world.Step(1 / PhysiVals.fps, 10);
			if (deleteAll) {
				if (platforms.length) {
					Platform(platforms[0]).remove();
				} else if (collectables.length) {
					Collectable(collectables[0]).remove();
				} else if (characters.length) {
					Character(characters[0]).remove();
				} else if (decorations.length) {
					Decor(decorations[0]).remove();
				} else {
					trace("deleted");
					deleteAll = false;
					if (LevelLoader.xmlToLoad) {
						LevelLoader.loadXml();
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
					if (_player.getSpriteLoc().y > 5000) {
						CameraManager.freePoint = CameraUpdater.getCameraSection();
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
						while (_player.inventory._lifes.length < 3) {	
							_player.inventory.addLife();
						}
						_player.spawn();
					}
				}
			} else {
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
		
		/*private static function deleteAll():void {
			//trace(System.totalMemory / 1024);
			NewContactListener.handleContacts = false;
			controls.disallowControls();
			for each (var a:Actor in _allActors) {
				if (a is ArbiStaticActor) {
					safeRemoveActor(a);
				}
			}
			CameraManager.cleanCameras();
			//needToStartLevel = 2;
			for each (var b:Bitmap in Raster._levelPieces) {
				b.bitmapData.dispose();
				if (b.parent) {
					b.parent.removeChild(b);
				}
				b = null;
			}
			Raster._levelPieces = [];
			//PhysiVals.world.GetBodyList().
			trace(PhysiVals.world.GetBodyCount().toString()+ " bodies");
			//System.gc();
			thisIs.countChildren(thisIs);
			LevelSelectionMC.add(++Platformer.levelsOpen);
		}*/
		
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
		
		private function activation(e:Event):void {
			PhysiVals.fps = 30.0;
			Controls.allowControls();
		}
		
		private function deactivation(e:Event):void {
			PhysiVals.fps = Infinity;
			Controls.disallowControls();
		}
		
		public static function setFullScreen():void {
			thisIs.stage.displayState = StageDisplayState.FULL_SCREEN;
		}
	}
}
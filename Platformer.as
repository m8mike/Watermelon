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
	import flash.display.PixelSnapping;
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
		public static var objectCounter:int = 0;
		
		//public static var controls:Controls;
		
		public function Platformer() {
			thisIs = this;
			Raster.cacheBackground();
			PhysiVals.setupPhysicsWorld();
			CameraManager.initCameras();
			PhysiVals.setupTimers();
			LevelDirector.createLevel(1);
			addEventListener(Event.ENTER_FRAME, newEventListener);
			stage.addEventListener(Event.DEACTIVATE, deactivation);
			stage.addEventListener(Event.ACTIVATE, activation);
			setupDebugDraw();
		}
		
		private function setupDebugDraw():void {
			var artistForHire:b2DebugDraw = new b2DebugDraw();
			artistForHire.m_sprite = CameraManager._dynamicLayer;
			artistForHire.m_drawScale = PhysiVals.RATIO;
			artistForHire.SetFlags(b2DebugDraw.e_shapeBit);
			artistForHire.m_lineThickness = 2.0;
			artistForHire.m_fillAlpha = 0.8;
			PhysiVals.world.SetDebugDraw(artistForHire);
		}
		
		private function newEventListener(e:Event):void {
			++PhysiVals.periods;
			PhysiVals.world.Step(1 / PhysiVals.fps, 10);
			/*for each (var platform:Platform in platforms) {
				if (!platform._body.IsStatic()) {
					platform.updateNow();
				}
			}
			for each (var decor:Decor in decorations) {
				if (!decor._body.IsStatic()) {
					decor.updateNow();
				}
			}*/
			for each (var decor:Decor in decorations) {
				decor.updateNow();
			}
			for each (var collectable:Collectable in collectables) {
				collectable.updateNow();
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
			if (ghostCount == 0) {
				new Ghost(4, -30);
			}
			reallyRemoveActors();
			if (_player) {
				CameraManager.zoomCameras(CameraManager.getCameraSection());
				if (_player.getSpriteLoc().y > 5000) {
					CameraManager.freePoint = CameraManager.getCameraSection();
					//_player.startSplash();
				}
			} else {
				CameraManager.zoomCameras(CameraManager.freePoint);
			}
		}
		
		public static function countPixels(object:DisplayObject):int {
			var pixelCounter:int = 0;
			if (object is DisplayObjectContainer) {
				for (var i:int = 0; i < DisplayObjectContainer(object).numChildren; i++) {
					pixelCounter += countPixels(DisplayObjectContainer(object).getChildAt(i));
				}
			} else if (object is Bitmap) {
				pixelCounter += Bitmap(object).bitmapData.height * Bitmap(object).bitmapData.width;
			}
			objectCounter++;
			return pixelCounter;
		}
		
		public static function traceParent(child:DisplayObject):void {
			if (child.parent) {
				trace(child.parent.toString());
				traceParent(child.parent);
			}
		}
		
		private static function deleteAll():void {
			//trace(System.totalMemory / 1024);
			/*NewContactListener.handleContacts = false;
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
			LevelSelectionMC.add(++Platformer.levelsOpen);*/
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
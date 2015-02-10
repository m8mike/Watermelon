package 
{
	import bodyBuilder.DynamicBodyBuilder;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.display.Bitmap;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Player extends Character {
		public var removeLiveTime:int = 0;
		/*
		private const LAUNCH_POINT:Point = new Point(500, 100);
		private const LAUNCH_POINT2:Point = new Point(1000, 100);
		public static var LAUNCH_POINT_PLAYER:Point = new Point(80, -50); //300, 100);//16*30
		private const LAUNCH_POINT_PLAYER2:Point = new Point(200, 10);
		*/
		public var direction:Boolean = false; //направление (вправо - true)
		
		public var _lifes:Array = [];
		public var _keys:Array = [];
		public static const MAX_LIFES:int = 5;
		public static const MAX_KEYS:int = 3;
		
		public var carryingItem:Item;
		public var hatIndex:int = 11;// + Platformer.characters.length * 2;
		public var stripeIndex:int = 24;
		public var characterIndex:int = 0;
		public var shoesIndex:int = 1;
		public var handsIndex:int = 0;
		
		//cache animation with
		public var animationMode:int = 0;
		public static const NO_ITEMS:int = 0;
		public static const UMBRELLA_IN_RIGHT_HAND:int = 1;
		public static const NO_HANDS:int = 2;
		
		public function Player(x:int, y:int, controls:Controls) {
			bodyManager = new PlayerBodyManager(new Point(x * 20, y * 20), this);
			PlayerBodyManager(bodyManager).controls = controls;
			costumeManager = new PlayerCostumeManager(this);
			PlayerCostumeManager(costumeManager).controls = controls;
		}
		
		public function itemGet(item:Item):void {
			if (carryingItem) {
				if (carryingItem.toString() != item.toString()) {
					carryingItem.remove();
					carryingItem = item;
				}
			} else {
				carryingItem = item;
			}
		}
		
		public function kill():void {
			PlayerCostumeManager(costumeManager).startSplash();
		}
		/*public function spawn(x:int, y:int):void {
			
		}*/
		
		public function isOnGround():Boolean {
			return PlayerBodyManager(bodyManager).canJump;
		}
		
		public function timer200():void {
			PlayerBodyManager(bodyManager).reduceJumpTime();
		}
		
		public function getBody():b2Body {
			return bodyManager.body;
		}
		
		override public function updateNow():void {
			/*if (Platformer.stopLevel) {
			   return void;
			}*/
			if (removeLiveTime > 0) {
				removeLiveTime--;
			}
			CameraManager.renderLess();
			//Body.m_sweep.a = 0;//This is what stops the player from rotating
			super.updateNow();
		}
		
		override protected function cleanUpBeforeRemoving():void {
			if (carryingItem) {
				carryingItem.remove();
			}
			if (Platformer._player == this) {
				Platformer._player = null;
			}
			super.cleanUpBeforeRemoving();
		}
		
		override public function getSpriteLoc():Point {
			var worldCenter:b2Vec2 = getBody().GetWorldCenter();
			return new Point(worldCenter.x * PhysiVals.RATIO, 
							 worldCenter.y * PhysiVals.RATIO);
		}
		
		public function addLife():void {
			if (_lifes.length < MAX_LIFES) {
				var hpHeart:MovieClip = new heart();
				hpHeart.x = 60 + _lifes.length * 40;
				hpHeart.y = 420;
				hpHeart.scaleX = 0.5;
				hpHeart.scaleY = 0.5;
				CameraManager.gui.addChild(hpHeart);
				_lifes.push(hpHeart);
			}
		}
		
		public function removeLife():void {
			if (removeLiveTime <= 0) {
				removeLiveTime = 100;
				if (_lifes.length > 0) {
					for (var i:int = CameraManager.gui.numChildren - 1; i > 0; i--) {
						if (CameraManager.gui.getChildAt(i) is heart) {
							CameraManager.gui.removeChildAt(i);
							break;
						}
					}
					_lifes.splice(_lifes.length - 1, 1);
				}
			}
		}
		
		public function addKey():void {
			if (_keys.length < MAX_KEYS) {
				var key:MovieClip = new key1();
				key.x = 500 + _keys.length * 40;
				key.y = 40;
				key.scaleX = 0.5;
				key.scaleY = 0.5;
				CameraManager.gui.addChild(key);
				_keys.push(key);
			}
		}
		
		public function removeKey():void {
			if (_keys.length > 0) {
				for (var i:int = CameraManager.gui.numChildren - 1; i > 0; i--) {
					if (CameraManager.gui.getChildAt(i) is key1) {
						CameraManager.gui.removeChildAt(i);
						break;
					}
				}
				_keys.splice(_keys.length - 1, 1);
			}
		}
		
		public function impulseUp():void {
			PlayerBodyManager(bodyManager).impulseUp();
		}
		
		public function allowJumps(normal:b2Vec2):void {
			PlayerBodyManager(bodyManager).allowJumps(normal.x, normal.y);
		}
		
		public function disallowJumps():void {
			PlayerBodyManager(bodyManager).disallowJumps();
		}
	}
}
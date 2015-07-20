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
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Player extends Character {
		public var invincibilityTime:int = 0;
		private var invincibilityKoef:Number = 2;
		/*
		private const LAUNCH_POINT:Point = new Point(500, 100);
		private const LAUNCH_POINT2:Point = new Point(1000, 100);
		public static var LAUNCH_POINT_PLAYER:Point = new Point(80, -50); //300, 100);//16*30
		private const LAUNCH_POINT_PLAYER2:Point = new Point(200, 10);
		*/
		public var direction:Boolean = false; //направление (вправо - true)
		
		public var carryingItem:Item;
		public var hatIndex:int = 11;// + Platformer.characters.length * 2;
		public var stripeIndex:int = 24;
		public var characterIndex:int = 0;
		public var shoesIndex:int = 1;
		public var handsIndex:int = 0;
		
		public var inCloud:Boolean = false;
		public var inFan:Boolean = false;
		
		//cache animation with
		public var animationMode:int = 0;
		public static const NO_ITEMS:int = 0;
		public static const UMBRELLA_IN_RIGHT_HAND:int = 1;
		public static const NO_HANDS:int = 2;
		public static const ROCKETS:int = 3;
		public static const UMBRELLA_GO:int = 4;
		
		private var controls:Controls;
		public var inventory:Inventory;
		public var spawnPoint:Point;
		
		public function Player(x:int, y:int, controls:Controls) {
			bodyManager = new PlayerBodyManager(new Point(x * 20, y * 20), this);
			PlayerBodyManager(bodyManager).controls = controls;
			costumeManager = new PlayerCostumeManager(this);
			PlayerCostumeManager(costumeManager).controls = controls;
			PlayerCostumeManager(costumeManager).show();
			this.controls = controls;
			controls.player = this;
			inventory = new Inventory();
			inventory.addLife();
			inventory.addLife();
			inventory.addLife();
			spawnPoint = new Point(x * 20, y * 20);
			super(x, y);
		}
		
		public function itemGet(id:String):void {
			if (carryingItem) {
				if (getQualifiedClassName(carryingItem) != id) {
					if (getQualifiedClassName(carryingItem) == "Jetpack") {
						inventory.hideJetpackTime();
					}
					carryingItem.remove();
					carryingItem = new (getDefinitionByName(id))();
				}
			} else {
				carryingItem = new (getDefinitionByName(id))();
			}
			if (id == "Jetpack") {
				PlayerBodyManager(bodyManager).jetpackTime = 100;
				inventory.addJetpackTime();
			}
		}
		
		public function diamondGet():void {
			inventory.addDiamond();
		}
		
		public function changeHat(index:int):void {
			deleted = true;
			costumeManager.removeCostumes();
			hatIndex = index;
			setSpawnPoint(new Point(getBody().GetWorldCenter().x * 30, getBody().GetWorldCenter().y * 30));
			costumeManager = new PlayerCostumeManager(this);
		}
		
		public function hit():void {
			if (invincibilityTime <= 0 && PlayerCostumeManager(costumeManager).condition != PlayerCostumeManager.STUNNED) {
				PlayerCostumeManager(costumeManager).startZapp();
				invincibilityTime = 50;
				invincibilityKoef = 2;
			}
		}
		
		public function kill():void {
			invincibilityKoef = 2;
			//invincibilityTime = 0;
			Controls.disallowControls();
			bodyManager.body.SetLinearVelocity(new b2Vec2(0, 0));
		}
		
		public function hide():void {
			PlayerBodyManager(bodyManager).removeBodies();
			deleted = true;
			PlayerCostumeManager(costumeManager).hide();
		}
		
		public function spawn(vel:b2Vec2 = null):void {
			invincibilityTime = 0;
			PlayerBodyManager(bodyManager).initBody(spawnPoint, controls, vel);
			deleted = false;
			PlayerCostumeManager(costumeManager).condition = PlayerCostumeManager.STAY_RIGHT;
			PlayerCostumeManager(costumeManager).show();
			Controls.allowControls();
		}
		
		public function changeSpawnPoint(x:Number, y:Number):void {
			spawnPoint.x += x;
			spawnPoint.y += y;
		}
		
		public function setSpawnPoint(point:Point):void {
			spawnPoint = new Point(point.x, point.y);
		}
		
		public function isOnGround():Boolean {
			return PlayerBodyManager(bodyManager).canJump;
		}
		
		public function timer200():void {
			PlayerBodyManager(bodyManager).reduceJumpTime();
		}
		
		public function getBody():b2Body {
			return bodyManager.body;
		}
		
		public function cloudJump():void {
			PlayerBodyManager(bodyManager).cloudJump();
		}
		
		public function setJumpThrough(platform:JumpThrough):void {
			PlayerBodyManager(bodyManager).jumpThrough = platform;
		}
		
		override public function updateNow():void {
			/*if (Platformer.stopLevel) {
			   return void;
			}*/
			if (!deleted && invincibilityTime >= 0) {
				invincibilityTime--;
				
				if (invincibilityTime % Math.round(invincibilityKoef)) {
					PlayerCostumeManager(costumeManager).show();
				} else {
					if (PlayerCostumeManager(costumeManager).condition != PlayerCostumeManager.ZAPPED) {
						PlayerCostumeManager(costumeManager).hide();
					}
					invincibilityKoef += 0.2;
				}
			}
			if (inFan) {
				if ((PlayerCostumeManager(costumeManager).condition == PlayerCostumeManager.UMBRELLA_GO_LEFT) ||
					(PlayerCostumeManager(costumeManager).condition == PlayerCostumeManager.UMBRELLA_GO_RIGHT) ||
					(PlayerCostumeManager(costumeManager).condition == PlayerCostumeManager.UMBRELLA_LEFT) ||
					(PlayerCostumeManager(costumeManager).condition == PlayerCostumeManager.UMBRELLA_RIGHT)) {
					getBody().ApplyForce(new b2Vec2(0, -5), getBody().GetWorldCenter());
				}
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
			while (inventory._lifes.length) {
				inventory.removeLife();
			}
			inventory.removeJetpackTime();
			inventory.removeDiamonds();
			controls.player = null;
			controls = null;
			Controls.allowControls();
			inventory = null;
			super.cleanUpBeforeRemoving();
		}
		
		override public function getSpriteLoc():Point {
			if (deleted) {
				return spawnPoint;
			} else {
				var worldCenter:b2Vec2 = getBody().GetWorldCenter();
				return new Point(worldCenter.x * PhysiVals.RATIO, 
								 worldCenter.y * PhysiVals.RATIO);
			}
		}
		
		public function impulseUp():void {
			PlayerBodyManager(bodyManager).impulseUp();
		}
		
		public function allowJumps(normal:b2Vec2, walls:Boolean = true):void {
			PlayerBodyManager(bodyManager).allowJumps(normal.x, normal.y, walls);
		}
		
		public function disallowJumps():void {
			PlayerBodyManager(bodyManager).disallowJumps();
		}
		
		public function getLifesNum():int {
			return inventory._lifes.length;
		}
	}
}
package {
	import Box2D.Collision.b2ContactPoint;
	import Box2D.Collision.Shapes.b2FilterData;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2ContactListener;
	import Box2D.Dynamics.Contacts.b2Contact;
	import Box2D.Dynamics.Contacts.b2ContactResult;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class NewContactListener extends b2ContactListener {
		private var ballForce:b2Vec2 = new b2Vec2(0, -3.5);
		private var bulletForce:b2Vec2 = new b2Vec2(0, -0.5);
		
		public function NewContactListener() {
		
		}
		
		override public function Add(point:b2ContactPoint):void {
			var actor1:Actor = point.shape1.GetBody().GetUserData();
			var actor2:Actor = point.shape2.GetBody().GetUserData();
			if (actor1 is Player && actor2 is Platform) {
				playerHitsPlatform(Player(actor1), Platform(actor2), point);
			} else if (actor2 is Player && actor1 is Platform) {
				playerHitsPlatform(Player(actor2), Platform(actor1), point);
			} else if (actor1 is Player && actor2 is Collectable) {
				collect(Player(actor1), Collectable(actor2));
			} else if (actor2 is Player && actor1 is Collectable) {
				collect(Player(actor2), Collectable(actor1));
			} else if (actor1 is Bullet) {
				shotSomebody(Bullet(actor1), actor2, point);
			} else if (actor2 is Bullet) {
				shotSomebody(Bullet(actor2), actor1, point);
			}
			super.Add(point);
		}
		
		private function shotSomebody(bullet:Bullet, actor1:Actor, point:b2ContactPoint):void {
			if (!(actor1 is Player)) {	
				bullet.remove();
				new Dust(10, new Point(point.position.x, point.position.y), Dust.FLINDERS);
			}
			if (actor1 is Ghost) {
				actor1.remove();
			}
		}
		
		private function collect(player:Player, collectable:Collectable):void {
			collectable.pick(player);
		}
		
		override public function Persist(point:b2ContactPoint):void {
			var actor1:Actor = point.shape1.GetBody().GetUserData();
			var actor2:Actor = point.shape2.GetBody().GetUserData();
			if (actor1 is Player && actor2 is Platform) {
				playerHitsPlatform(Player(actor1), Platform(actor2), point);
			} else if (actor2 is Player && actor1 is Platform) {
				playerHitsPlatform(Player(actor2), Platform(actor1), point);
			} else if (actor1 is Player && actor2 is Collectable) {
				collect(Player(actor1), Collectable(actor2));
			} else if (actor2 is Player && actor1 is Collectable) {
				collect(Player(actor2), Collectable(actor1));
			} else if (actor1 is Player && actor2 is Ghost) {
				playerHitsGhost(Player(actor1), Ghost(actor2), point);
			} else if (actor2 is Player && actor1 is Ghost) {
				playerHitsGhost(Player(actor2), Ghost(actor1), point);
			} else if (actor1 is Player && actor2 is Character) {
				playerHitsCharacter(Player(actor1), Character(actor2), point);
			} else if (actor2 is Player && actor1 is Character) {
				playerHitsCharacter(Player(actor2), Character(actor1), point);
			}
			super.Persist(point);
		}
		
		private function playerHitsGhost(player:Player, ghost:Ghost, point:b2ContactPoint):void {
			if (point.normal.y < -0.7) {
				ghost.remove();
				player.impulseUp();
			}
		}
		
		private function playerHitsCharacter(player:Player, dummy:Character, point:b2ContactPoint):void {
			var jumpToKill:Boolean;
			if (dummy is DummyCircle) {
				jumpToKill = point.normal.y > 0.7;
			} else {
				jumpToKill = point.normal.y < -0.7;
			}
			if (jumpToKill) {
				hitCharacter(player, dummy, point);
			} else {
				hitPlayer(player, dummy, point);
				//player.remove();
			}
		}
		
		private function hitCharacter(player:Player, dummy:Character, point:b2ContactPoint):void {
			if (dummy is Ghost) {
				dummy.remove();
				player.impulseUp();
			} else if (dummy is CrateBox) {
				player.allowJumps(point.normal);
				var vel:Number = player.getBody().GetLinearVelocity().y;
				if (vel > 10) {
					dummy.remove();
				}
			}
		}
		
		private function hitPlayer(player:Player, dummy:Character, point:b2ContactPoint):void {
			
		}
		
		private function playerHitsPlatform(player:Player, platform:Platform, point:b2ContactPoint):void {
			/*if (!player) {
				trace("where he is?");	
			}*/
			if (platform is GroundBelow || platform is GroundZero || platform is TreeBelow || 
			platform is TreeZero || platform is Arrow || platform is TutorialBoard || platform is TutorialSponsor || 
			platform is TutorialDown || platform is TutorialUp || platform is TutorialWall) {
				return void;
			}
			if (!player.isOnGround()) {
				if ((platform is TopHat || platform is Cloud || platform is Spikes) || Platformer._player.carryingItem is Jetpack) {
					player.allowJumps(point.normal, false);
				} else if (!(platform is SpringBush) && !(platform is Teleporter) 
							&& !(platform is EndLevel) && !(platform is Fan)) {
					player.allowJumps(point.normal);
				}
			}
			var vel:Number = player.getBody().GetLinearVelocity().y;
			if (platform is Spikes) {
				player.hit();
			} else if (platform is Door) {
				if (Door(platform).isOpen) {
					Door(platform).remove();
				}
			} else if (platform is Teleporter) {
				if (!player.deleted && player.invincibilityTime != 10000) {	
					Teleporter(platform).teleportPlayer(player);
					Teleporter(platform).point1 = CameraUpdater.getCameraSection();
				}
				return void;
			} else if (platform is EndLevel) {
				if (EditorMode.current is PlayMode) {
					if (Controls.allowed) {
						Controls.allowed = false;
						Controls.disallowControls();
						EndLevel(platform).finish(player);
					}
				}
				return void;
			} else if (platform is Wooden) {
				if (vel > 10) {
					Wooden(platform).hit(vel);
					new Dust(vel, new Point(point.position.x, point.position.y), Dust.FLINDERS);
				}
				return void;
			} else if (platform is SpringBush) {
				SpringBush(platform).hit();
				//new leaves (or dust - delete flinders class)
				return void;
			} else if (platform is Cloud) {
				if (player.getBody().GetLinearVelocity().y >= 0 && player.isOnGround()) {	
					player.getBody().m_linearDamping = 20;
				} else {
					player.getBody().m_linearDamping = 0;
				}
				player.inCloud = true;
			} if (platform is Fan) {
				player.inFan = true;
				return void;
			} else if (platform is TopHat) {
				return void;
			} else if (platform is JumpThrough) {
				player.setJumpThrough(JumpThrough(platform));
			}
			
			if (vel > 10) {
				//new Lightning(vel, new Point(point.position.x, point.position.y));
				if (point.normal.y < -0.7) {
					new Dust(vel, new Point(point.position.x, point.position.y));
				}
				/*var shape:CircleShape = new CircleShape(vel);
				var sprite:Sprite = shape.getSimpleSprite(new Point(point.position.x, point.position.y));
				sprite.x = point.position.x * 30;
				sprite.y = point.position.y * 30;
				CameraManager.belowLayer.addChild(sprite);*/
			}
		}
		
		override public function Remove(point:b2ContactPoint):void {
			var actor1:Actor = point.shape1.GetBody().GetUserData();
			var actor2:Actor = point.shape2.GetBody().GetUserData();
			if (actor1 is Player) {
				Player(actor1).disallowJumps();
				if (actor2 is Cloud) {
					Player(actor1).inCloud = false;
					point.shape1.GetBody().m_linearDamping = 0;
				} else if (actor2 is JumpThrough) {
					Player(actor1).setJumpThrough(null);
				} else if (actor2 is Fan) {
					Player(actor1).inFan = false;
				}
			} else if (actor2 is Player) {
				Player(actor2).disallowJumps();
				if (actor1 is Cloud) {
					Player(actor2).inCloud = false;
					point.shape2.GetBody().m_linearDamping = 0;
				} else if (actor1 is JumpThrough) {
					Player(actor2).setJumpThrough(null);
				} else if (actor1 is Fan) {
					Player(actor2).inFan = false;
				}
			}
			super.Remove(point);
		}
	}
}
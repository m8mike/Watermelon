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
			}
			super.Add(point);
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
				dummy.remove();
				player.impulseUp();
			} else {
				player.remove();
			}
		}
		
		private function playerHitsPlatform(player:Player, platform:Platform, point:b2ContactPoint):void {
			if (!player.isOnGround()) {
				if (platform is TopHat) {
					player.allowJumps(point.normal, false);
				} else {
					player.allowJumps(point.normal);
				}
			}
			if (platform is Spikes) {
				player.kill();
			} else if (platform is Door) {
				if (Door(platform).isOpen) {
					Door(platform).remove();
				}
			} else if (platform is Teleporter) {
				if (!player.deleted){
					Teleporter(platform).teleportPlayer(player);
					Teleporter(platform).point1 = CameraUpdater.getCameraSection();
				}
			}
			var vel:Number = player.getBody().GetLinearVelocity().y;
			
			if (vel > 10) {
				//new Lightning(vel, new Point(point.position.x, point.position.y));
				new Dust(vel, new Point(point.position.x, point.position.y));
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
			} else if (actor2 is Player) {
				Player(actor2).disallowJumps();
			}
			super.Remove(point);
		}
	}
}
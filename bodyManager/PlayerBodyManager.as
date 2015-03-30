package
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class PlayerBodyManager extends BodyManager {
		public var controls:Controls;
		private var parent:Player;
		
		private static const JUMP_TIME:int = 2; //10//true 2
		public var jumpTimeLeft:int = 0;
		public var impulseReducer:int = 0;
		public var jetpackTime:int = 0;
		
		public var canJump:Boolean = false;
		public var leftWallJump:Boolean;
		public var rightWallJump:Boolean;
		private var canOpenUmbrella:Boolean = false;
		private var ballBodyBuilder:DynamicBodyBuilder;
		
		public static const BALL_DIAMETER:int = 20; //12
		public static const JUMP_IMPULSE:b2Vec2 = new b2Vec2(0.0, -0.23); //-0.5);//-0.17); true
		public static const JUMP_IMPULSE_BIGGER:b2Vec2 = new b2Vec2(0.0, -0.5); //test new type of jump (bigger impulse)
		public static const JUMP_FORCE:b2Vec2 = new b2Vec2(0.0, -4.0) //-0.5);//-5.26 true
		public static const LEFT_WALL_IMPULSE:b2Vec2 = new b2Vec2(-0.5 / 1.5, -0.6 / 1.5); //-0.5, -0.6); true
		public static const RIGHT_WALL_IMPULSE:b2Vec2 = new b2Vec2(0.5 / 1.5, -0.6 / 1.5); //0.5, -0.6); true
		
		public function PlayerBodyManager(location:Point, player:Player) {
			parent = player;
			shape = new CircleShape(BALL_DIAMETER / 2);
			ballBodyBuilder = new DynamicBodyBuilder();
			ballBodyBuilder.density = 0.5;
			ballBodyBuilder.friction = 0.3;
			ballBodyBuilder.restitution = 0.3;
			ballBodyBuilder.groupIndex = -3;
			ballBodyBuilder.x = location.x;
			ballBodyBuilder.y = location.y;
			ballBodyBuilder.linearDamping = 0;
			ballBodyBuilder.angularDamping = 1;
			initBody(location);
		}
		
		public function initBody(spawnPoint:Point, contr:Controls = null, vel:b2Vec2 = null):void {
			ballBodyBuilder.x = spawnPoint.x;
			ballBodyBuilder.y = spawnPoint.y;
			_body = ballBodyBuilder.getBody(new Array(shape));
			if (!_body) {
				trace("can't create body");
			}
			canJump = false;
			_body.SetUserData(parent);
			if (vel) {
				_body.ApplyImpulse(vel, _body.GetWorldCenter());
			}
			if (contr) {
				controls = contr;
			}
		}
		
		override public function updateNow():void {
			if (!controls) {
				return void;
			}
			if (canJump && !controls.useJetpack && jetpackTime < 100 && PhysiVals.fps != Infinity) {
				jetpackTime++;
			}
			if (jetpackTime <= 0) {
				controls.useJetpack = false;
			}
			handleControls();
			super.updateNow();
		}
		
		private function handleControls():void { 
			if (canJump) {
				canOpenUmbrella = false;
			}
			if (!controls) {
				return void;
			}
			if (controls.enter) {
				//Platformer._player.destroy();
				return void;
				//startSplash();
			}
			if (controls.left) {
				if (body.GetLinearVelocity().x > -7.0) {
					body.ApplyForce(new b2Vec2(-2.0, 0.0), body.GetWorldCenter()); //-1.0 0.0
				}
			}
			if (controls.right) {
				if (body.GetLinearVelocity().x < 7.0) {
					body.ApplyForce(new b2Vec2(2.0, 0.0), body.GetWorldCenter()); //1.0 0.0
				}
			}
			if (controls.up) {
				jump();
			} else {
				dontJump();
			}
			if (controls.down) {
				body.ApplyImpulse(new b2Vec2(0.0, 0.25), body.GetWorldCenter());
			}
			if (controls.useJetpack) {
				if (PhysiVals.fps > 0 && PhysiVals.fps != Infinity) {
					if (jetpackTime > 0) {
						jetpackTime--;
						body.ApplyForce(new b2Vec2(0.0, -3.8), body.GetWorldCenter()); ///-1.8
					} else {
						body.m_linearDamping = 3;
					}
					var bodyCenter:b2Vec2 = body.GetWorldCenter();
					var offset:Number;
					if (body.GetLinearVelocity().x >= 0) {
						offset = -0.3;
					} else {
						offset = 0.3;
					}
					var smokePoint:Point = new Point(bodyCenter.x + offset, bodyCenter.y);
					new RocketSmoke(smokePoint);
				}
			} else {
				if (Player(body.GetUserData()).carryingItem is Jetpack) {
					body.m_linearDamping = 0;
				}
			}
			if (controls.useUmbrella && Player(body.GetUserData()).carryingItem is Umbrella && !canJump) {
				body.m_linearDamping = 3;
			} else {
				if (Player(body.GetUserData()).carryingItem is Umbrella) {
					body.m_linearDamping = 0;
				}
			}
			var notPressedAnyButton:Boolean = !controls.up && !controls.left && !controls.right && !controls.down && !controls.useJetpack;
			var speedIsSmall:Boolean = (body.GetLinearVelocity().x < 9) && (body.GetLinearVelocity().x > -9);
			if (notPressedAnyButton && canJump && speedIsSmall) {
				body.PutToSleep();
			}
			if (notPressedAnyButton) {
				controls.useUmbrella = false;
			}
		}
		
		public function reduceJumpTime():void {
			if (jumpTimeLeft > 0) {
				jumpTimeLeft--;
			}
		}
		
		private function dontJump():void {
			if (jumpTimeLeft) {
				jumpTimeLeft = 0;
			}
			if (impulseReducer > 0) {
				impulseReducer = 0;
			}
			if (!canJump) {
				canOpenUmbrella = true;
			}
		}
		
		private function jump():void {
			if (canJump) {
				shortJump();
			} else if (jumpTimeLeft) {
				longJump();
			} else {
				if (!controls.up) {
					canOpenUmbrella = true;
				}
				if (canOpenUmbrella && Player(body.GetUserData()).carryingItem is Umbrella){
					controls.useUmbrella = true;
				} else if (canOpenUmbrella && Player(body.GetUserData()).carryingItem is Jetpack) {
					controls.useJetpack = true;
				}
			}
			if (leftWallJump) {
				body.ApplyImpulse(LEFT_WALL_IMPULSE, body.GetWorldCenter()); //-0.2 -0.27
			} else if (rightWallJump) {
				body.ApplyImpulse(RIGHT_WALL_IMPULSE, body.GetWorldCenter()); //0.2 -0.27
			}
		}
		
		private function shortJump():void {
			body.ApplyImpulse(JUMP_IMPULSE, body.GetWorldCenter()); //0.0  -0.27 jumpImpulse
			jumpTimeLeft = JUMP_TIME;
			impulseReducer = 0;
		}
		
		private function longJump():void {
			if (impulseReducer < 0) {
				impulseReducer = 0;
			}
			var jumpForceReduced:b2Vec2 = new b2Vec2(JUMP_FORCE.x, JUMP_FORCE.y + 0.3 * impulseReducer); //0.3
			body.ApplyForce(jumpForceReduced, body.GetWorldCenter()); //выполнится <= 12 раз
			impulseReducer++;
		}
		
		public function allowJumps(x:Number, y:Number, walls:Boolean = true):void {
			if (x > -0.72 && x < 0.72 && y < 0) {
				if (!leftWallJump && !rightWallJump) {
					canJump = true;
				}
			} else if (walls) {
				if (y > -0.72 && y < 0.72) {
					if (x < 0) {
						leftWallJump = true;
					}
					else if (x > 0) {
						rightWallJump = true;
					}
				}
			}
		}
		
		public function impulseUp():void {
			body.ApplyImpulse(JUMP_IMPULSE_BIGGER,body.GetWorldCenter());
		}
		
		public function disallowJumps():void {
			canJump = false;
			rightWallJump = false;
			leftWallJump = false;
		}
		
		override public function removeBodies():void {
			//controls.remove(); //разобраться со временем создания и удаления контролов
			controls = null;
			super.removeBodies();
		}
	}
}
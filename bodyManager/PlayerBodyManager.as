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
		private var ballBodyBuilder:DynamicBodyBuilder;
		
		private static const JUMP_TIME:int = 2; //10//true 2
		public var jumpIterations:int = 0;
		public var jumpTimeLeft:int = 0;
		public var impulseReducer:int = 0;
		public var jetpackTime:int = 0;
		
		public var canJump:Boolean = false;
		public var leftWallJump:Boolean;
		public var rightWallJump:Boolean;
		private var canOpenUmbrella:Boolean = false;
		private var cloudJumping:Boolean = false;
		
		public var jumpThrough:JumpThrough;
		
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
			if (body.GetLinearVelocity().y >= 0) {
				cloudJumping = false;
			}
			if (parent.carryingItem is Jetpack) {
				if (canJump && !controls.useJetpack && jetpackTime < 100 && PhysiVals.fps != Infinity) {
					jetpackTime++;
					parent.inventory.setJetpackTime(jetpackTime);
				}
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
			if (controls.down) {
				if (jumpThrough) {
					parent.hide();
					parent.setSpawnPoint(new Point(body.GetWorldCenter().x * 30, body.GetWorldCenter().y * 30));
					parent.changeSpawnPoint(0, 10);
					parent.spawn();
					jumpThrough = null;
				} else if (!canJump) {
					body.ApplyImpulse(new b2Vec2(0.0, 0.15), body.GetWorldCenter());
				}
			} else if (controls.up) {
				jump();
			} else {
				dontJump();
			}
			if (controls.useJetpack) {
				if (PhysiVals.fps > 0 && PhysiVals.fps != Infinity) {
					if (jetpackTime > 0) {
						jetpackTime--;
						parent.inventory.setJetpackTime(jetpackTime);
						body.ApplyForce(new b2Vec2(0.0, -3.8), body.GetWorldCenter()); ///-1.8
					} else {
						body.m_linearDamping = 3;
					}
					var bodyCenter:b2Vec2 = body.GetWorldCenter();
					var offset1:Number;
					var offset2:Number;
					if (body.GetLinearVelocity().x >= 0) {
						offset1 = -0.3;
						offset2 = -0.1;
					} else {
						offset1 = 0.3;
						offset2 = 0.1;
					}
					var smokePoint1:Point = new Point(bodyCenter.x + offset1, bodyCenter.y);
					var smokePoint2:Point = new Point(bodyCenter.x + offset2, bodyCenter.y);
					new RocketSmoke(smokePoint1);
					new RocketSmoke(smokePoint2);
				}
			} else {
				/*if (Player(body.GetUserData()).carryingItem is Jetpack) {
					body.m_linearDamping = 0;
				}*/
				if (body.m_linearDamping) {
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
			var speedIsSmall:Boolean = (body.GetLinearVelocity().x < 4) && (body.GetLinearVelocity().x > -4);
			var speedIsAverage:Boolean = (body.GetLinearVelocity().x < 9) && (body.GetLinearVelocity().x > -9);
			if (notPressedAnyButton && canJump && !parent.inCloud) {
				if (speedIsSmall) {
					body.PutToSleep();
				} else if (speedIsAverage) {
					body.m_linearDamping = 2;
				}
			}
			if (!controls.up) {
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
				//trace("short");
				jumpIterations = 7;
			} else if (jumpIterations > 0) {
				longJump();
				jumpIterations--;
				//trace("i " + jumpIterations);
			} else {
				jumpIterations = 0;
				//trace("no jump time left");
				if (!controls.up) {
					canOpenUmbrella = true;
				}
				if (canOpenUmbrella && Player(body.GetUserData()).carryingItem is Umbrella && body.GetLinearVelocity().y > 0){
					controls.useUmbrella = true;
				} else if (canOpenUmbrella && Player(body.GetUserData()).carryingItem is Jetpack) {
					controls.useJetpack = true;
				}
			}
			if (leftWallJump && !canJump && jumpIterations < 3) {
				body.ApplyImpulse(LEFT_WALL_IMPULSE, body.GetWorldCenter()); //-0.2 -0.27
			} else if (rightWallJump && !canJump && jumpIterations < 3) {
				body.ApplyImpulse(RIGHT_WALL_IMPULSE, body.GetWorldCenter()); //0.2 -0.27
			}
		}
		
		private function shortJump():void {
			body.ApplyImpulse(JUMP_IMPULSE, body.GetWorldCenter()); //0.0  -0.27 jumpImpulse
			jumpTimeLeft = JUMP_TIME;
			impulseReducer = 0;
			SoundMusic.playJump();
		}
		
		private function longJump():void {
			if (impulseReducer < 0) {
				impulseReducer = 0;
			}
			var jumpForceReduced:b2Vec2 = new b2Vec2(JUMP_FORCE.x, JUMP_FORCE.y + 0.3 * impulseReducer); //0.3
			body.ApplyForce(jumpForceReduced, body.GetWorldCenter()); //выполнится <= 12 раз
			impulseReducer++;
		}
		
		public function cloudJump():void {
			if (!cloudJumping) {
				cloudJumping = true;
				body.ApplyImpulse(new b2Vec2(0, -2), body.GetWorldCenter());
			}
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
package {
	import Box2D.Common.Math.b2Vec2;
	import flash.text.TextField;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class PlayerCostumeManager extends CostumeManager {
		public var controls:Controls;
		public var condition:Costume;
		private var visible:Boolean = true;
		private var animStopped:Boolean = false;
		
		private var parent:Player;
		
		private var stayRight:CharacterAnimation;
		private var stayLeft:CharacterAnimation;
		private var goRight:CharacterAnimation;
		private var goLeft:CharacterAnimation;
		private var jumpRight:CharacterAnimation;
		private var jumpLeft:CharacterAnimation;
		private var fallRight:CharacterAnimation;
		private var fallLeft:CharacterAnimation;
		private var walljumpRight:CharacterAnimation;
		private var walljumpLeft:CharacterAnimation;
		private var umbrellaRight:CharacterAnimation;
		private var umbrellaLeft:CharacterAnimation;
		private var umbrellaGoRight:CharacterAnimation;
		private var umbrellaGoLeft:CharacterAnimation;
		
		private var redSplash:AnimationCostume;
		private var zappedAnim:AnimationCostume;
		private var stunnedAnim:AnimationCostume;
		
		public function PlayerCostumeManager(player:Player) {
			parent = player;
			createCostumes();
			changeCondition(stayRight);
			show();
			parent.deleted = false;
		}
		
		private function stopAnim():void {
			animStopped = true;
			condition.stop();
		}
		
		private function checkCondition():void {
			var vel:b2Vec2 = parent.getBody().GetLinearVelocity();
			var xVel:Number = vel.x;
			var yVel:Number = vel.y;
			var openUmbrella:Boolean = controls.useUmbrella && parent.carryingItem is Umbrella;
			var speedIsSmall:Boolean = Math.abs(xVel) <= 0.05;
			var falling:Boolean = yVel >= 0;
			var sleeping:Boolean = parent.getBody().IsSleeping();
			if (sleeping) {
				changeCondition(stayRight, stayLeft);
			} else if (openUmbrella) {
				if (parent.isOnGround()) {
					changeCondition(umbrellaGoRight, umbrellaGoLeft);
				} else {
					changeCondition(umbrellaRight, umbrellaLeft);
				}
			} else if (parent.isOnGround()) {
				if (speedIsSmall) {
					changeCondition(stayRight, stayLeft);
				} else {
					changeCondition(goRight, goLeft);
				}
			} else {
				if (falling) {
					if (animStopped) {
						changeCondition(fallRight, fallLeft);
						animStopped = false;
					}
				} else {
					if (parent.isOnWall()) {
						changeCondition(walljumpRight, walljumpLeft);
					} else {
						changeCondition(jumpRight, jumpLeft);
					}
				}
			}
		}
		
		override public function updateNow():void {
			CameraUpdater.camKoefRed();
			setCoords();
			checkCondition();
			super.updateNow();
		}
		
		private function createCostumes():void {
			_costumes.push(stayRight = new CharacterAnimation(new stay_right()));
			_costumes.push(stayLeft = new CharacterAnimation(new stay_left()));
			_costumes.push(goRight = new CharacterAnimation(new go_right()));
			_costumes.push(goLeft = new CharacterAnimation(new go_left()));
			_costumes.push(jumpRight = new CharacterAnimation(new jump_right(), stopAnim));
			_costumes.push(jumpLeft = new CharacterAnimation(new jump_left(), stopAnim));
			_costumes.push(fallRight = new CharacterAnimation(new fall_right()));
			_costumes.push(fallLeft = new CharacterAnimation(new fall_left()));
			_costumes.push(walljumpRight = new CharacterAnimation(new walljump_right(), stopAnim));
			_costumes.push(walljumpLeft = new CharacterAnimation(new walljump_left(), stopAnim));
			_costumes.push(umbrellaRight = new CharacterAnimation(new umbrella_right()));
			_costumes.push(umbrellaLeft = new CharacterAnimation(new umbrella_left()));
			_costumes.push(umbrellaGoRight = new CharacterAnimation(new go_right()));
			_costumes.push(umbrellaGoLeft = new CharacterAnimation(new go_left()));
			_costumes.push(redSplash = new AnimationCostume("red_splash", CameraManager.pLayer, parent.remove));
			_costumes.push(zappedAnim = new AnimationCostume("zapped", CameraManager.pLayer, zapp));
			_costumes.push(stunnedAnim = new AnimationCostume("birds", CameraManager.pLayer, stun));
			goRight.startFrame = 16;
			goLeft.startFrame = 16;
			
			stayLeft.flipRight(false);
			goLeft.flipRight(false);
			jumpLeft.flipRight(false);
			fallLeft.flipRight(false);
			walljumpLeft.flipRight(false);
			umbrellaLeft.flipRight(false);
			umbrellaGoLeft.flipRight(false);
		}
		
		public function splash():void {
			if (condition != redSplash) {
				changeAnimation(redSplash);
				redSplash.play();
			}
		}
		
		public function startZapp():void {
			if (condition != zappedAnim) {
				changeAnimation(zappedAnim);
				parent.inventory.removeLife();
				zappedAnim.play();
			}
		}
		
		private function zapp():void {
			if (parent.getLifesNum() > 0) {	
				changeCondition(stayRight);
			} else {
				parent.kill();
				changeCondition(stunnedAnim);
			}
		}
		
		private function stun():void {
			//parent.setSpawnPoint(parent.getSpriteLoc());
			if (EditorSpawn._spawn.length) {
				if (TextField(EditorSpawn._spawn[0]).text != "" && TextField(EditorSpawn._spawn[1]).text != "") {
					parent.spawnPoint.x = Number(TextField(EditorSpawn._spawn[0]).text);
					parent.spawnPoint.y = Number(TextField(EditorSpawn._spawn[1]).text);
				} else {
					parent.spawnPoint.x = 2 * 20;
					parent.spawnPoint.y = -6 * 20;
				}
			} else {
				parent.spawnPoint.x = 2 * 20;
				parent.spawnPoint.y = -6 * 20;
			}
			parent.invincibilityTime = 10000;
			parent.hide();
		}
		
		private function changeCondition(condRight:Costume, condLeft:Costume = null):void {
			var xVel:Number = parent.getBody().GetLinearVelocity().x;
			var directionRight:Boolean = xVel >= 0;
			if (!condLeft) {
				if (condition != condRight) {
					changeAnimation(condRight);
					parent.direction = directionRight;
				}
			} else if ((condition != condRight) && directionRight) {
				changeAnimation(condRight);
				parent.direction = directionRight;
			} else if ((condition != condLeft) && !directionRight) {
				changeAnimation(condLeft);
				parent.direction = directionRight;
			}
		}
		
		private function setCoords():void {
			var x:Number = parent.getBody().GetPosition().x * PhysiVals.RATIO - 19.6818;
			var xLeft:Number = parent.getBody().GetPosition().x * PhysiVals.RATIO + 19.6818;
			var y:Number = parent.getBody().GetPosition().y * PhysiVals.RATIO - 26.37;
			for each (var costume:Costume in _costumes) {
				if (costume.id.indexOf("right") != -1) {
					costume.setLocation(x, y);
				} else {
					costume.setLocation(xLeft, y);
				}
			}
			if (parent.carryingItem is Bazooka) {
				Bazooka(parent.carryingItem).setCoords(xLeft - 14, y + 20);
			} else if (parent.carryingItem is SnowGun) {
				SnowGun(parent.carryingItem).setCoords(xLeft - 14, y + 20);
			}
		}
		
		private function changeAnimation(cond:Costume):void {
			hideCostumes();
			condition = cond;
			trace(cond.animation.clip + " " + int(Math.random()*100));
			if (visible) {
				condition.play();
			}
		}
		
		private function hideCostumes():void {
			for each (var s:Costume in _costumes) {
				s.hide();
			}
		}
		
		public function hide():void {
			if (visible) {	
				visible = false;
				hideCostumes();
			}
		}
		
		public function show():void {
			if (!visible) {
				visible = true;
				condition.show();
			}
		}
		
		override public function removeCostumes():void {
			controls = null;
			super.removeCostumes();
		}
		
		public function conditionIsZapped():Boolean {
			if (condition == zappedAnim) {
				return true;
			}
			return false;
		}
		
		public function conditionIsStunned():Boolean {
			if (condition == stunnedAnim) {
				return true;
			}
			return false;
		}
		
		public function conditionIsUmbrella():Boolean {
			if (condition == umbrellaGoLeft || condition == umbrellaGoRight || 
				condition == umbrellaLeft || condition == umbrellaRight) {
				return true;	
			}
			return false;
		}
	}
}
package {
	import flash.text.TextField;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class PlayerCostumeManager extends CostumeManager {
		public var controls:Controls;
		public var condition:int = 1; //состояние персонажа для анимации и т.д.
		private var changedCondition:Boolean = false;
		private var visible:Boolean = true;
		
		private var parent:Player;
		
		// condition
		public static const STAY_RIGHT:int = 0;
		public static const STAY_LEFT:int = 1;
		public static const GO_RIGHT:int = 2;
		public static const GO_LEFT:int = 3;
		public static const JUMP_RIGHT:int = 4;
		public static const JUMP_LEFT:int = 5;
		public static const FALL_RIGHT:int = 6;
		public static const FALL_LEFT:int = 7;
		public static const WALLJUMP_RIGHT:int = 8;
		public static const WALLJUMP_LEFT:int = 9;
		public static const UMBRELLA_RIGHT:int = 40;
		public static const UMBRELLA_LEFT:int = 41;
		public static const UMBRELLA_GO_RIGHT:int = 42;
		public static const UMBRELLA_GO_LEFT:int = 43;
		public static const RED_SPLASH:int = 44;
		public static const ZAPPED:int = 45;
		public static const STUNNED:int = 46;
		
		public function PlayerCostumeManager(player:Player) {
			parent = player;
			createCostumes();
			changeCondition(0);
			show();
			parent.deleted = false;
		}
		
		override public function updateNow():void {
			if (condition == RED_SPLASH) {
				splash();
			} else if (condition == ZAPPED) {
				zapp();
			} else if (condition == STUNNED) {
				stun();
			} else {
				CameraUpdater.camKoefRed();
				setCoords();
				checkAndStop();
				checkCondition();
			}
			if (changedCondition) { //делаем нужное видимым
				changeAnimation(condition);
				changedCondition = false;
			}
			super.updateNow();
		}
		
		private function createCostumes():void {
			parent.animationMode = Player.NO_ITEMS;
			Raster.cachePlayer(parent);
			pushCostumesToArray();
			parent.animationMode = Player.UMBRELLA_IN_RIGHT_HAND;
			Raster.cachePlayer(parent);
			pushCostumesToArray();
			parent.animationMode = Player.NO_HANDS;
			Raster.cachePlayer(parent);
			pushCostumesToArray();
			parent.animationMode = Player.ROCKETS;
			Raster.cachePlayer(parent);
			pushCostumesToArray();
			parent.animationMode = Player.NO_ITEMS;
			Raster.cachePlayerOnce(parent);
			_costumes.push(new AnimationCostume("umbrella_right", CameraManager.pLayer, 0.128, 0.14285714285714288, 5));
			_costumes.push(new AnimationCostume("umbrella_left", CameraManager.pLayer, -0.1264822134387352, 0.14092140921409216, 5));
			parent.animationMode = Player.UMBRELLA_GO;
			Raster.cachePlayer(parent);
			_costumes.push(new AnimationCostume("go_right", CameraManager.pLayer, 0.128, 0.14285714285714288));
			_costumes.push(new AnimationCostume("go_left", CameraManager.pLayer, -0.1264822134387352, 0.14092140921409216));
			_costumes.push(new AnimationCostume("red_splash", CameraManager.pLayer, -0.028268551236749116, 0.024916943521594685));
			_costumes.push(new AnimationCostume("zapped", CameraManager.pLayer, 0.128, 0.14285714285714288, 8));
			_costumes.push(new AnimationCostume("birds", CameraManager.pLayer, 0.07, 0.07, 80));
		}
		
		private function pushCostumesToArray():void {
			_costumes.push(new AnimationCostume("stay_right", CameraManager.pLayer, 0.13297532284874056, 0.14102241249055653));
			_costumes.push(new AnimationCostume("stay_left", CameraManager.pLayer, -0.12759170653907495, 0.13876930868574325));
			_costumes.push(new AnimationCostume("go_right", CameraManager.pLayer, 0.13389121338912133, 0.1415929203539823));
			_costumes.push(new AnimationCostume("go_left", CameraManager.pLayer, -0.13278008298755187, 0.13994169096209913));
			_costumes.push(new AnimationCostume("jump_right", CameraManager.pLayer, 0.13168724279835392, 0.14117647058823532, 8));
			_costumes.push(new AnimationCostume("jump_left", CameraManager.pLayer, -0.1322314049586777, 0.13913043478260873, 8));
			_costumes.push(new AnimationCostume("fall_right", CameraManager.pLayer, 0.128, 0.14285714285714288, 5));
			_costumes.push(new AnimationCostume("fall_left", CameraManager.pLayer, -0.1264822134387352, 0.14092140921409216, 5));
			_costumes.push(new AnimationCostume("walljump_right", CameraManager.pLayer, 0.128, 0.14285714285714288, 8));
			_costumes.push(new AnimationCostume("walljump_left", CameraManager.pLayer, -0.1264822134387352, 0.14092140921409216, 8));
		}
		
		public function startSplash():void {
			if (condition != RED_SPLASH) {
				condition = RED_SPLASH;
				changedCondition = true;
				for each (var costume:AnimationCostume in _costumes) {
					if (costume.id.indexOf("red_splash") != -1) {
						costume.play();
					}
				}
			}
		}
		
		private function splash():void {
			AnimationCostume(_costumes[RED_SPLASH]).setCoords(parent.getBody().GetPosition().x * PhysiVals.RATIO + 19.6818/2, 
															  parent.getBody().GetPosition().y * PhysiVals.RATIO - 26.37/2);
			AnimationCostume(_costumes[RED_SPLASH]).animation.visible = true;
			if (AnimationCostume(_costumes[RED_SPLASH]).animation.currentFrame >= 15) {
				parent.remove();
			}
		}
		
		public function startZapp():void {
			if (condition != ZAPPED) {
				condition = ZAPPED;
				changedCondition = true;
				parent.inventory.removeLife();
				for each (var costume:AnimationCostume in _costumes) {
					if (costume.id.indexOf("zapped") != -1) {
						costume.play();
					}
				}
			}
		}
		
		private function zapp():void {
			AnimationCostume(_costumes[ZAPPED]).setCoords(parent.getBody().GetPosition().x * PhysiVals.RATIO - 19.6818, 
														  parent.getBody().GetPosition().y * PhysiVals.RATIO - 26.37);
			AnimationCostume(_costumes[ZAPPED]).animation.visible = true;
			if (AnimationCostume(_costumes[ZAPPED]).animation.currentFrame >= 8) {
				if (parent.getLifesNum() > 0) {	
					changeCondition(STAY_RIGHT);
				} else {
					parent.kill();
					changeCondition(STUNNED);
				}
			}
		}
		
		private function stun():void {
			AnimationCostume(_costumes[STUNNED]).setCoords(parent.getBody().GetPosition().x * PhysiVals.RATIO, 
														   parent.getBody().GetPosition().y * PhysiVals.RATIO + 5);
			AnimationCostume(_costumes[STUNNED]).animation.visible = true;
			if (AnimationCostume(_costumes[STUNNED]).animation.currentFrame >= 80) {
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
		}
		
		private function changeCondition(cond:int):void {
			if (condition != cond) {
				condition = cond;
				if (cond % 2) {
					parent.direction = true;
				} else {
					parent.direction = false;
				}
				changedCondition = true;
			}
		}
		
		private function checkCondition():void {
			if (controls.useUmbrella && parent.carryingItem is Umbrella) {
				if (parent.isOnGround()) {
					if (parent.getBody().GetLinearVelocity().x >= 0) {
						changeCondition(UMBRELLA_GO_RIGHT);
					} else {
						changeCondition(UMBRELLA_GO_LEFT);
					}
				} else if (parent.getBody().GetLinearVelocity().x >= 0) {
					changeCondition(UMBRELLA_RIGHT);
				} else {
					changeCondition(UMBRELLA_LEFT);
				}
			} else if (parent.isOnGround()) {
				if (parent.getBody().GetLinearVelocity().x > 0.05) {
					changeCondition(GO_RIGHT);
				} else if (parent.getBody().GetLinearVelocity().x < -0.05) {
					changeCondition(GO_LEFT);
				} else if (condition == GO_LEFT || condition == JUMP_LEFT || condition == FALL_LEFT) {
					changeCondition(STAY_LEFT);
				} else if (condition != STAY_LEFT) {
					changeCondition(STAY_RIGHT);
				}
			} else if (!parent.isOnGround()) {
				if (parent.getBody().GetLinearVelocity().y < 0) {
					if (parent.getBody().GetLinearVelocity().x >= 0) {
						if (parent.isOnWall()) {
							changeCondition(WALLJUMP_RIGHT);
						} else if (!(condition == WALLJUMP_LEFT || condition == WALLJUMP_RIGHT)) {	
							changeCondition(JUMP_RIGHT);
						}
					} else {
						if (parent.isOnWall()) {
							changeCondition(WALLJUMP_LEFT);
						} else if (!(condition == WALLJUMP_LEFT || condition == WALLJUMP_RIGHT)) {	
							changeCondition(JUMP_LEFT);
						}
					}
				} else if (parent.getBody().GetLinearVelocity().x >= 0) {
					if (AnimationCostume(_costumes[JUMP_RIGHT]).animation.currentFrame == 8 || condition == FALL_LEFT) { //20
						changeCondition(FALL_RIGHT);
					}
					if (AnimationCostume(_costumes[WALLJUMP_RIGHT]).animation.currentFrame == 8 || condition == FALL_LEFT) { //20
						changeCondition(FALL_RIGHT);
					}
				} else if (AnimationCostume(_costumes[JUMP_LEFT]).animation.currentFrame == 8 || condition == FALL_RIGHT) { //20
					changeCondition(FALL_LEFT);
				} else if (AnimationCostume(_costumes[WALLJUMP_LEFT]).animation.currentFrame == 8 || condition == FALL_RIGHT) { //20
					changeCondition(FALL_LEFT);
				}
			}
			if (parent.getBody().IsSleeping()) {
				if (condition == FALL_LEFT || condition == JUMP_LEFT || condition == GO_LEFT) {
					changeCondition(STAY_LEFT);
				} else if (condition == FALL_RIGHT || condition == JUMP_RIGHT || condition == GO_RIGHT) {
					changeCondition(STAY_RIGHT);
				}
			}
		}
		
		private function checkAndStop():void {
			for each (var costume:AnimationCostume in _costumes) {
				costume.checkAndStop();
			}
		}
		
		private function setCoords():void {
			var x:Number = parent.getBody().GetPosition().x * PhysiVals.RATIO;// - 19.6818;
			var x2:Number = parent.getBody().GetPosition().x * PhysiVals.RATIO;// + 19.6818;
			var y:Number = parent.getBody().GetPosition().y * PhysiVals.RATIO;// - 26.37;
			for each (var costume:AnimationCostume in _costumes) {
				if (costume.id.indexOf("right") != -1) {
					costume.setCoords(x, y);
				} else {
					costume.setCoords(x2, y);
				}
			}
			if (parent.carryingItem is Bazooka) {
				Bazooka(parent.carryingItem).setCoords(x2 - 14, y + 20);
			} else if (parent.carryingItem is SnowGun) {
				SnowGun(parent.carryingItem).setCoords(x2 - 14, y + 20);
			}
		}
		
		private function changeAnimation(spriteIndex:int):void {
			hideCostumes();
			var index:int = spriteIndex;
			if (parent.carryingItem is Umbrella && index < 24) {
				index += 10;
			} else if ((parent.carryingItem is Bazooka || parent.carryingItem is SnowGun) && index < 28) {
				index += 20;
			} else if (parent.carryingItem is Jetpack && index < 39) {
				index += 30;
			}
			if (visible) {	
				AnimationCostume(_costumes[index]).play();
			}
		}
		
		private function hideCostumes():void {
			for each (var s:AnimationCostume in _costumes) {
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
				var index:int = condition;
				if (parent.carryingItem is Umbrella && index < 24) {
					index += 10;
				} else if ((parent.carryingItem is Bazooka || parent.carryingItem is SnowGun) && index < 28) {
					index += 20;
				} else if (parent.carryingItem is Jetpack && index < 39) {
					index += 30;
				}
				AnimationCostume(_costumes[index]).animation.visible = true;
			}
		}
		
		override public function removeCostumes():void {
			controls = null;
			super.removeCostumes();
		}
	}
}
package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class PlayerCostumeManager extends CostumeManager {
		public var controls:Controls;
		private var condition:int = 1; //состояние персонажа для анимации и т.д.
		private var changedCondition:Boolean = false;
		
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
		public static const UMBRELLA_RIGHT:int = 32;
		public static const UMBRELLA_LEFT:int = 33;
		public static const UMBRELLA_GO_RIGHT:int = 34;
		public static const UMBRELLA_GO_LEFT:int = 35;
		public static const RED_SPLASH:int = 36;
		
		public function PlayerCostumeManager(player:Player) {
			parent = player;
			createCostumes();
			changeCondition(0);
		}
		
		override public function updateNow():void {
			if (condition == RED_SPLASH) {
				splash();
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
						changeCondition(JUMP_RIGHT);
					} else {
						changeCondition(JUMP_LEFT);
					}
				} else if (parent.getBody().GetLinearVelocity().x >= 0) {
					if (AnimationCostume(_costumes[JUMP_RIGHT]).animation.currentFrame == 8 || condition == FALL_LEFT) { //20
						changeCondition(FALL_RIGHT);
					}
				} else if (AnimationCostume(_costumes[JUMP_LEFT]).animation.currentFrame == 8 || condition == FALL_RIGHT) { //20
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
			var x:Number = parent.getBody().GetPosition().x * PhysiVals.RATIO - 19.6818;
			var x2:Number = parent.getBody().GetPosition().x * PhysiVals.RATIO + 19.6818;
			var y:Number = parent.getBody().GetPosition().y * PhysiVals.RATIO - 26.37;
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
			for each (var s:AnimationCostume in _costumes) {
				s.hide();
			}
			var index:int = spriteIndex;
			if (parent.carryingItem is Umbrella && index < 20) {
				index += 8;
			} else if ((parent.carryingItem is Bazooka || parent.carryingItem is SnowGun) && index < 24) {
				index += 16;
			} else if (parent.carryingItem is Jetpack && index < 33) {
				index += 24;
			}
			AnimationCostume(_costumes[index]).play();
		}
		
		public function hide():void {
			for each (var s:AnimationCostume in _costumes) {
				s.hide();
			}
		}
		
		override public function removeCostumes():void {
			controls = null;
			super.removeCostumes();
		}
	}
}
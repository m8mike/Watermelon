package {
	import flash.geom.Point;
	
	public class LevelDirector {
		
		public function LevelDirector() {
		
		}
		
		public static function createLevel(level:int):void {
			switch (level) {
				case 0: 
					createLevel1();
					break;
				case 1: 
					createLevel1();
					break;
				case 2: 
					createLevel2();
					break;
				case 3: 
					createLevel3();
					break;
				case 4: 
					createLevel2();
					break;
				case 5: 
					//createLevel6();
					break;
				case 6: 
					//createLevel7();
					break;
				case 7: 
					//createLevel8();
					break;
				case 10:
					
					break;
				default: 
					createLevel9();
			}
			//LoadingScreen.removeScreen = true;
			//NewContactListener.handleContacts = true;
		}
		
		private static function createLevel1():void {
			//create standard platform
			var standardPlatform:Standard = new Standard(0, 0, 60, 30);
			var standardPlatform2:Standard = new Standard(0, -60, 1, 60);
			var standardPlatform3:Standard = new Standard(12, -2, 1, 1);
			var teleporter1:Teleporter = new Teleporter(8.6, -3, 3.3, 0.5, new Point(20 * 20, -3 * 20));	
			var teleporter2:Teleporter = new Teleporter(18.6, -1, 3.3, 0.5, new Point(10 * 20, -5 * 20));	
			//var standardPlatform3:Standard = new Standard(3, -3, 3, 3);
			//var spikes:Spikes = new Spikes(10, -3, 3, 3);
			/*var door:Door = new Door(20, -3);
			var key:Key = new Key(15, -2, door);
			var door1:Door = new Door(25, -3);
			var key1:Key = new Key(14, -2, door1);
			var door2:Door = new Door(30, -3);
			var key2:Key = new Key(15, -1, door2);
			var door3:Door = new Door(35, -3);
			var key3:Key = new Key(16, -3, door3);*/
			var umbrella1:UmbrellaBonus = new UmbrellaBonus(16, -2);
			var jetpack1:JetpackBonus = new JetpackBonus(27, -2);
			/*var bazooka1:BazookaBonus = new BazookaBonus(4, -25);
			var b2:BazookaBonus = new BazookaBonus(4, -33);
			var b3:BazookaBonus = new BazookaBonus(4, -40);*//*
			var snowGun1:SnowGunBonus = new SnowGunBonus(4, -33);
			var snowGun2:SnowGunBonus = new SnowGunBonus(4, -40);*/
			/*var jumpThrough1:JumpThrough = new JumpThrough(3, -3, 3, 0.1);
			var jumpThrough2:JumpThrough = new JumpThrough(3, -7, 3, 0.1);
			var jumpThrough3:JumpThrough = new JumpThrough(3, -12, 3, 0.1);
			var jumpThrough4:JumpThrough = new JumpThrough(3, -17, 3, 0.1);
			var jumpThrough5:JumpThrough = new JumpThrough(3, -23, 3, 0.1);
			var jumpThrough6:JumpThrough = new JumpThrough(3, -30, 3, 0.1);
			var jumpThrough7:JumpThrough = new JumpThrough(3, -37, 3, 0.1);*/
			var hat1:TopHat = new TopHat(10, -2);
			var hat2:TopHat = new TopHat(20, 0);
		//var standardPlatform5:Standard = new Standard(-4, -4, 1, 1);
		//var standardPlatform6:Standard = new Standard(-3, 2, 1, 1);
			//create player with controls
			var controls:Controls = new Controls();
			Platformer._player = new Player(2, -6, controls);
			var hills:Hills = new Hills();
			//var clouds:BigClouds = new BigClouds();
			/*new Dummy(10, -40, 20);
			new Dummy(11, -50, 30);
			new Dummy(12, -50, 40);
			new Dummy(14, -10, 60);
			new Dummy(17, -50, 80);*/
			/*new Diminishing(10, -40, 20);
			new Diminishing(11, -50, 30);
			new Diminishing(12, -50, 40);
			new Diminishing(14, -10, 60);
			new Diminishing(17, -50, 80);
			new DummySplitter(10, -50, 20);
			new DummySplitter(11, -20, 30);
			new DummySplitter(12, -30, 40);
			new DummySplitter(14, -30, 60);
			new DummySplitter(17, -10, 80);*/
			var coniferous:BigConiferous = new BigConiferous();
			var mountains:BigMountains = new BigMountains();
			new Ghost(4, -6);
		}
		
		private static function createLevel2():void {
			
		}
		
		private static function createLevel3():void {
			
		}
		
		private static function createLevel4():void {
			
		}
		
		private static function createLevel7():void {
			
		}
		
		private static function createLevel8():void {
			
		}
		
		private static function createLevel9():void {
		
		}
	}
}
package {
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	
	public class LevelDirector {
		public static var coniferous:BigConiferous;
		public static var mountains:BigMountains;
		public static var hills:Hills;
		
		public function LevelDirector() {
			
		}
		
		public static function createLevel(level:int):void {
			switch (level) {
				case 0: 
					createLevel1();
					break;
				case 1: 
					LevelLoader.loadLevel("dungeon");
					break;
				case 2: 
					LevelLoader.loadLevel("hills1");
					break;
				case 3:
					LevelLoader.loadLevel("test0");
					break;
				case 4:
					LevelLoader.loadLevel("test1");
					break;
				case 5:
					LevelLoader.loadLevel("test-1");
					break;
				case 6:
					LevelLoader.loadLevel("test1_1");
					break;
				case 7:
					LevelLoader.loadLevel("test2");
					break;
				case 8:
					LevelLoader.loadLevel("test3");
					break;
				case 9:
					LevelLoader.loadLevel("test3_1");
					break;
				case 10:
					LevelLoader.loadLevel("test3_2");
					break;
				case 11:
					LevelLoader.loadLevel("test4");
					break;
				case 12:
					LevelLoader.loadLevel("test4_1");
					break;
				case 13:
					LevelLoader.loadLevel("test4_2");
					break;
				case 14:
					LevelLoader.loadLevel("test5");
					break;
				case 15:
					LevelLoader.loadLevel("test5_1");
					break;
				case 16:
					LevelLoader.loadLevel("test5_2");
					break;
				case 17:
					LevelLoader.loadLevel("test6");
					break;
				case 18:
					LevelLoader.loadLevel("test6_1");
					break;
				case 19:
					LevelLoader.loadLevel("test7");
					break;
				case 20:
					LevelLoader.loadLevel("test7_1");
					break;
				case 21:
					LevelLoader.loadLevel("test7_2");
					break;
				case 22:
					LevelLoader.loadLevel("test7_3");
					break;
				case 23:
					LevelLoader.loadLevel("test7_4");
					break;
				case 24:
					LevelLoader.loadLevel("test8");
					break;
				case 25:
					LevelLoader.loadLevel("test9");
					break;
				case 26:
					LevelLoader.loadLevel("test9_1");
					break;
				case 27:
					LevelLoader.loadLevel("test9_2");
					break;
				case 28:
					LevelLoader.loadLevel("test9_3");
					break;
				case 29:
					LevelLoader.loadLevel("test10");
					break;
				case 30:
					LevelLoader.loadLevel("test10_1");
					break;
				case 31:
					LevelLoader.loadLevel("test10_2");
					break;
				case 32:
					LevelLoader.loadLevel("test11");
					break;
				default: 
					trace("wrong number");
			}
			//LoadingScreen.removeScreen = true;
			//NewContactListener.handleContacts = true;
		}
		
		private static function createLevel1():void {
			//var loader:LoadingBig = new LoadingBig();
			var standardPlatform:Standard = new Standard(1, 0, 200, 1);
			var standardPlatform2:Standard = new Standard(0, -60, 1, 60);
			var standardPlatform3:Standard = new Standard(5, -20, 20, 1);
			new Cloud(1, -15);
			new JumpThrough(5, -10, 10, 0.1);
			new SpringBush(18, -1);
			new SpringBush(13, -1);
			new Wooden(15, -2);
			new Fan(10, -10);
			new TopHat(22, 0);
			new EndLevel(22, 0);
			/*new TopHat(30, -5);
			new Teleporter(22, 0, 30, -5);
			new Teleporter(30, -5, 22, 0);*/
			new Spikes(24, -5, 10, 5);
			
			/*new BubbleBonus(6, -1 - 20);
			new BazookaBonus(8, -2 - 20);
			new JetpackBonus(10, -1 - 20);
			new SnowGunBonus(11, -1 - 20);
			new UmbrellaBonus(12, -2 - 20);*/
			new DiamondBonus(6, -1 - 20);
			new DiamondBonus(8, -2 - 20);
			new DiamondBonus(10, -1 - 20);
			new DiamondBonus(11, -1 - 20);
			new DiamondBonus(12, -2 - 20);
			/*new HatBonus(6, -1 - 20, 8);
			new HatBonus(8, -2 - 20, 9);
			new HatBonus(10, -1 - 20, 18);
			new HatBonus(11, -1 - 20, 19);
			new HatBonus(12, -2 - 20, 21);*/
			
			/*coniferous = new BigConiferous();
			mountains = new BigMountains();
			hills = new Hills();*/
			
			new Ghost(4, -6, new Point(1, 0));
			new Ghost(6, -2);
			
			var controls:Controls = new Controls();
			Platformer._player = new Player(2, -6, controls);
			
			//new LevelEditor();
			//loader.setLoaded();
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
			/*var standardPlatform3:Standard = new Standard(12, -2, 1, 1);*/
			/*var teleporter1:Teleporter = new Teleporter(8.6, -3, 3.3, 0.5, new Point(20 * 20, -3 * 20));	
			var teleporter2:Teleporter = new Teleporter(18.6, -1, 3.3, 0.5, new Point(10 * 20, -5 * 20));*/
			/*var hat1:TopHat = new TopHat(10, -2);
			var hat2:TopHat = new TopHat(20, 0);
			var wooden:Wooden = new Wooden(3, -3);
			var crateBox1:CrateBox = new CrateBox(18, -12);
			var crateBox2:CrateBox = new CrateBox(20, -5);
			var crateBox3:CrateBox = new CrateBox(21, -18);
			var crateBox4:CrateBox = new CrateBox(19, -22);
			var crateBox5:CrateBox = new CrateBox(25, -2);*/
			/*var springBush1:SpringBush = new SpringBush(10, -1);
			var springBush2:SpringBush = new SpringBush(14, -1);*/
			/*var springBush3:SpringBush = new SpringBush(20, -1);
			var springBush4:SpringBush = new SpringBush(30, -1);
			var springBush5:SpringBush = new SpringBush(50, -1);
			var springBush6:SpringBush = new SpringBush(65, -1);*/
			//var cloud1:Cloud = new Cloud(10, -10);
			/*var cloud2:Cloud = new Cloud(20, -15);
			var cloud3:Cloud = new Cloud(30, -20);
			var cloud4:Cloud = new Cloud(50, -30);
			var cloud5:Cloud = new Cloud(65, -50);*/
			//var standardPlatform3:Standard = new Standard(3, -3, 3, 3);
			//var spikes:Spikes = new Spikes(50, -3, 3, 3);
			/*var door:Door = new Door(20, -3);
			var key:Key = new Key(15, -2, door);
			var door1:Door = new Door(25, -3);
			var key1:Key = new Key(14, -2, door1);
			var door2:Door = new Door(30, -3);
			var key2:Key = new Key(15, -1, door2);
			var door3:Door = new Door(35, -3);
			var key3:Key = new Key(16, -3, door3);*/
			/*var umbrella1:UmbrellaBonus = new UmbrellaBonus(16, -2);
			var jetpack1:JetpackBonus = new JetpackBonus(27, -2);*/
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
			//var standardPlatform5:Standard = new Standard(-4, -4, 1, 1);
			//var standardPlatform6:Standard = new Standard(-3, 2, 1, 1);
			//var hills:Hills = new Hills();
			/*var clouds:BigClouds = new BigClouds();
			new Dummy(10, -40, 20);
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
			/*var zap:AnimationCostume = new AnimationCostume("zapped", CameraManager.pLayer, 0.128, 0.14285714285714288, 8);
			zap.setCoords(0, 0);
			zap.play();*/
		}
		
		private static function createLevel9():void {
			/*Shape params
			 * body
			 * special
			 * behavior
			 * */
			/*Standard
			 * SpringBush
			 * Wooden
			 * CrateBox
			 * Cloud
			 * TopHat Teleporter
			 * Key Door
			 * JumpThrough
			 * Ghost
			 * Spikes
			 * */
			/*Static
			 * Dynamic
			 * Kinematic AB*/
			/*
			 * location
			 * shape
			 * body
			 * costume
			 * x:Number = 0;
			y:Number = 0;
			w:Number
			h:Number
			density:Number = 0;
			friction:Number = 0.2;
			restitution:Number = 0.3;
			groupIndex:int = 0;
			isSensor:Boolean = false;
			linearDamping:Number = 0;
			angularDamping:Number = 0;
			jumpThrough:Boolean = false;
			fixedRotation:Boolean = false;
			bullet:Boolean = false;*/
		}
	}
}
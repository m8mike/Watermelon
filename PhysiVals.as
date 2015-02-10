package  
{
	import Box2D.Collision.b2AABB;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2World;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class PhysiVals 
	{
		public static const RATIO:Number = 30;
		public static var fps:Number = 30.0;
		private static var _world:b2World;
		public static var gravity:b2Vec2 = new b2Vec2(0.0, 10);
		
		public static var jetpackTime:int = 0;
		public static var removeLiveTime:int = 0;
		public static var myTimer:Timer;
		private static var time:int;
		public static var periods:int = 0;
		
		public function PhysiVals() 
		{
			
		}
		
		static public function get world():b2World 
		{
			return _world;
		}
		
		static public function set world(value:b2World):void 
		{
			_world = value;
		}
		
		public static function setupPhysicsWorld():void {
			var worldBounds:b2AABB = new b2AABB();
			worldBounds.lowerBound.Set(-50000 / RATIO, -50000 / RATIO);
			worldBounds.upperBound.Set(50000 / RATIO, 50000 / RATIO);
			
			var allowSleep:Boolean = true;
			
			world = new b2World(worldBounds, gravity, allowSleep);
			world.SetContactListener(new NewContactListener());
		}
		
		public static function setupTimers():void {
			myTimer = new Timer(200);
			myTimer.addEventListener(TimerEvent.TIMER, timerListener);
			time = 0;
			function timerListener(e:TimerEvent):void {
				time += 0.2;
				//timeNumbText.text = time.toString();
				for each (var player:Character in Platformer.characters) {
					if (player is Player) {
						Player(player).timer200();
					}
				}
			}
			
			var timeNumbText:TextField = new TextField();
			timeNumbText.x = 0;
			timeNumbText.y = 0;
			timeNumbText.visible = true;
			timeNumbText.scaleX = 2;
			timeNumbText.scaleY = 2;
			timeNumbText.selectable = false;
			timeNumbText.text = "0"; // Platformer.childCounter.toString();
			CameraManager.gui.addChild(timeNumbText);
			myTimer.start();
			
			var timer:Timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, function(... args):void {
					timeNumbText.text = periods.toString();
					//timeNumbText.text = PlayerCanJump.toString();
					//timeNumbText.text = jetpackTime.toString();
					//timeNumbText.text = CircleStaticActor.keysCount.toString();
					//timeNumbText.text = RandomMap.playerIcon.x + " " + RandomMap.playerIcon.y;
					//timeNumbText.text = Player.renderArea.x.toString() + " " + Player.renderArea.y.toString();
					periods = 0;
				});
			timer.start();
		}
	}
}
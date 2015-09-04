package {
	import Box2D.Collision.b2AABB;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2World;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class PhysiVals {
		private static var _world:b2World;
		private static var time:int;
		
		public static const RATIO:Number = 30;
		public static const MIN_SQARE:int = 20; //размер минимального квадрата
		public static var fps:Number = 30.0;
		public static const gravity:b2Vec2 = new b2Vec2(0.0, 10);
		
		public static var jetpackTime:int = 0;
		public static var removeLiveTime:int = 0;
		public static var myTimer:Timer;
		public static var timeNumbText:TextField;
		public static var spriteToDebugDraw:Sprite;
		public static var periods:int = 0;
		public static var objectCounter:int = 0;
		
		public static var str:String = "";
		
		public function PhysiVals() {
		
		}
		
		public static function setupDebugDraw():void {
			spriteToDebugDraw = new Sprite();
			var artistForHire:b2DebugDraw = new b2DebugDraw();
			artistForHire.m_sprite = spriteToDebugDraw;
			artistForHire.m_drawScale = RATIO;
			artistForHire.SetFlags(b2DebugDraw.e_shapeBit);
			artistForHire.m_lineThickness = 2.0;
			artistForHire.m_fillAlpha = 0.8;
			PhysiVals.world.SetDebugDraw(artistForHire);
			CameraManager._dynamicLayer.addChild(spriteToDebugDraw);
		}
		
		static public function get world():b2World {
			return _world;
		}
		
		static public function set world(value:b2World):void {
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
		
		public static function cleanChildren(mc:DisplayObjectContainer):void {
			while (mc.numChildren) {
				if (mc.getChildAt(0) is DisplayObjectContainer) {
					cleanChildren(DisplayObjectContainer(mc.getChildAt(0)));
				}
				mc.removeChildAt(0);
			}
		}
		
		public static function countPixels(object:DisplayObject):int {
			var pixelCounter:int = 0;
			if (object is DisplayObjectContainer) {
				for (var i:int = 0; i < DisplayObjectContainer(object).numChildren; i++) {
					pixelCounter += countPixels(DisplayObjectContainer(object).getChildAt(i));
				}
			} else if (object is Bitmap) {
				pixelCounter += Bitmap(object).bitmapData.height * Bitmap(object).bitmapData.width;
			}
			/*if (object is Shape || object is Camera || object is JetpackBonus || object is BubbleBonus || object is TextField || object is DropDownMenu) {
				pixelCounter += 1;
			}*/
			objectCounter++;
			if (pixelCounter.toString() != "0") {
				str += object.toString() +": " + pixelCounter.toString() + "\n";
			}
			/*if (pixelCounter.toString() == "0") {
				if (object.parent) {	
					object.parent.removeChild(object);
				}
			}*/
			return pixelCounter;
		}
		
		public static function traceParent(child:DisplayObject):void {
			if (child.parent) {
				trace(child.parent.toString());
				traceParent(child.parent);
			}
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
			
			timeNumbText = new TextField();
			timeNumbText.x = 0;
			timeNumbText.y = 0;
			timeNumbText.visible = true;
			timeNumbText.scaleX = 2;
			timeNumbText.scaleY = 2;
			timeNumbText.selectable = false;
			timeNumbText.text = "0"; // Platformer.childCounter.toString();
			CameraManager.hud.addChild(timeNumbText);
			myTimer.start();
			
			var timer:Timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, function(... args):void {
					//timeNumbText.text = periods.toString();
					
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
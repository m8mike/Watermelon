package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Teleporter extends Platform {
		private var body:b2Body;
		public var mask:Sprite;
		private var spawnPoint:Point;
		private const IMPULSE:b2Vec2 = new b2Vec2(0, -1);
		private var player:Player;
		private var framesToMoveCameraLeft:int = -1;
		public var point1:Point;//для более плавного движения камеры в момент запрыгивания в шляпу
		
		public var width:Number;
		public var height:Number;
		
		public function Teleporter(x:Number, y:Number, x1:Number = 0, y1:Number = 0) {
			super();
			location = new Point((x - 1.4) * PhysiVals.MIN_SQARE, (y - 1) * PhysiVals.MIN_SQARE);
			width = 3.3;
			height = 0.5;
			spawnPoint = new Point(x1 * 20, (y1 - 3) * 20);
			super.reload();
			super.init(body, mask);
		}
		
		public function setSpawnPoint(x:Number, y:Number):void {
			spawnPoint = new Point(x, y);
		}
		
		public function getSpawnPoint():Point {
			return spawnPoint;
		}
		
		override public function reload():void {
			super.reload();
			super.init(body, mask);
		}
		
		public function teleportPlayer(player:Player):void {
			this.player = player;
		}
		
		public function check():void {
			if (player) {
				if (framesToMoveCameraLeft == -1) {
					framesToMoveCameraLeft = 80;
					player.hide();
					player.setSpawnPoint(spawnPoint);
				} else if (framesToMoveCameraLeft == 0) {
					framesToMoveCameraLeft = -1;
					player.spawn(IMPULSE);
					//trace((player.getBody().GetWorldCenter().x - spawnPoint.x) + " " + (player.getBody().GetWorldCenter().y - spawnPoint.y));
					player = null;
				} else {
					if (framesToMoveCameraLeft > 60) {
						CameraManager.freePoint = CameraUpdater.getCameraPoint(point1, location, framesToMoveCameraLeft-60, 20);
					} else {
						CameraManager.freePoint = CameraUpdater.getCameraPoint(location, spawnPoint, framesToMoveCameraLeft, 60);
					}
					framesToMoveCameraLeft--;
				}
			}
		}
		
		override protected function createShapes():void {
			shape = new RectShape(width * PhysiVals.MIN_SQARE, height * PhysiVals.MIN_SQARE);
			mask = shape.getSimpleSprite(location);
			CameraManager._staticLayer.addChild(mask);
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {	
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0;
				bodyBuilder.restitution = 0.3;
				bodyBuilder.isSensor = true;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
	}
}
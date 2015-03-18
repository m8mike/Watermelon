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
		private var shape:RectShape;
		private var spawnPoint:Point;
		private const IMPULSE:b2Vec2 = new b2Vec2(0, -1);
		private var player:Player;
		private var framesToMoveCameraLeft:int = -1;
		public var point1:Point;//для более плавного движения камеры в момент запрыгивания в шляпу
		
		public function Teleporter(x:Number, y:Number, w:Number, h:Number, point:Point) {
			spawnPoint = point;
			location = new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			shape = new RectShape(w * PhysiVals.MIN_SQARE, h * PhysiVals.MIN_SQARE);
			mask = shape.getSimpleSprite(location);
			CameraManager._staticLayer.addChild(mask);
			
			createBodies();
			super(body, mask);
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
					trace((player.getBody().GetWorldCenter().x - spawnPoint.x) + " " + (player.getBody().GetWorldCenter().y - spawnPoint.y));
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
		
		private function createBodies():void {
			var standardBodyBuilder:StaticBodyBuilder = new StaticBodyBuilder();
			standardBodyBuilder.density = 0;
			standardBodyBuilder.restitution = 0.3;
			standardBodyBuilder.isSensor = true;
			standardBodyBuilder.x = location.x;
			standardBodyBuilder.y = location.y;
			body = standardBodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
	}
}
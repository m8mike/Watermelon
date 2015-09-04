package {
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CameraUpdater {
		
		public static var camKoef:Number = 1;
		public static var camKoef2:Number = 1;
		public static var previousVelocities:Array = [];
		
		public function CameraUpdater() {
		
		}
		
		public static function getCameraPoint(pointFrom:Point, pointTo:Point, framesLeft:int, totalFrames:int):Point {
			var offset:Point = new Point(pointTo.x - pointFrom.x, pointTo.y - pointFrom.y);
			//var totalFrames:int = 60;
			var currentFrame:int = totalFrames - framesLeft;
			var x:Number = cubic(currentFrame, pointFrom.x, offset.x, totalFrames);
			var y:Number = quintic(currentFrame, pointFrom.y, offset.y, totalFrames);
			if (totalFrames == 20) {
				y=cubic(currentFrame, pointFrom.y, offset.y, totalFrames);
			}
			return new Point(x, y);
		}
		
		public static function cubic(t:Number, b:Number, c:Number, d:Number):Number {
			var ts:Number = (t /= d) * t;
			var tc:Number = ts * t;
			return b + c * (-2 * tc + 3 * ts);
		}
		
		public static function quintic(t:Number, b:Number, c:Number, d:Number):Number {
			var ts:Number = (t /= d) * t;
			var tc:Number = ts * t;
			return b + c * (6 * tc * ts + -15 * ts * ts + 10 * tc);
		}
		
		public static function getCameraSection():Point {
			if (Platformer._player) {
				if (Platformer._player.deleted) {
					return CameraManager.freePoint;
				} else {
					return getOnePlayerSection();
				}
			} else return CameraManager.freePoint;
		}
		
		public static function getOnePlayerSection():Point {
			var spriteLoc:Point = Platformer._player.getSpriteLoc();
			var goldenSection:Point;
			var goldenY:Number = spriteLoc.y - 18.144;
			var lastY:Number;
			var currentY:Number;
			var middleY:Number;
			if (Platformer._player.isOnGround()) {
				if (currentY != goldenY) {
					lastY = goldenY;
					currentY = goldenY;
					camKoef2 = 1;
				} else {
					if (lastY < goldenY) {
						lastY += Math.abs(lastY - goldenY) * camKoef2;
					} else {
						lastY -= Math.abs(lastY - goldenY) * camKoef2;
					}
					if (camKoef2 > 0.02) {
						camKoef2 -= 0.01;
					} else {
						camKoef2 = 0;
					}
				}
				middleY = goldenY + Math.abs(lastY - goldenY) * camKoef;
			} else {
				if (lastY < goldenY) {
					lastY += Math.abs(lastY - goldenY) * camKoef2;
				} else {
					lastY -= Math.abs(lastY - goldenY) * camKoef2;
				}
				if (camKoef2 > 0.02) {
					camKoef2 -= 0.001;
				} else {
					camKoef2 = 0;
				}
				middleY = goldenY + Math.abs(currentY - goldenY) * camKoef;
			}
			goldenSection = new Point(spriteLoc.x, middleY);
			for (var i:int = 5; i > 0; i--) {
				if (previousVelocities[i - 1]) {
					previousVelocities[i] = b2Vec2(previousVelocities[i - 1]).Copy();
				}
			}
			previousVelocities[0] = Platformer._player.getBody().GetLinearVelocity().Copy();
			var previous:Point = new Point(0, 0);
			for each(var vel:b2Vec2 in previousVelocities) {
				previous.x += vel.x;
				previous.y += vel.y;
			}
			var groveSection:Point = new Point(
				spriteLoc.x + previous.x / 3, 
				spriteLoc.y + previous.y / 3);
			var purpleSection:Point = new Point(
				spriteLoc.x, 
				spriteLoc.y - previous.y / 3);
			var lazySection:Point = new Point(
				spriteLoc.x - previous.x / 3, 
				spriteLoc.y - previous.y / 3);
			var greenSection:Point = new Point(
				spriteLoc.x, 
				groveSection.y - 18.144);
			var percentage:Number = 0.5;
			if (Platformer._player.getBody().GetLinearVelocity().y >= 0) {
				percentage *= 0.9;
			} else {
				if (percentage < 0.999) {
					percentage *= 1.1;
				}
			}
			var ariSection:Point = new Point(
				//greenSection.x*(1-percentage) + lazySection.x * percentage,
				groveSection.x,
				greenSection.y * percentage + lazySection.y * (1 - percentage));
				
			purpleSection.y  -= 18.144;
			return purpleSection;
			/*if (Platformer._player.getBody().GetLinearVelocity().y >= 0) {
				return greenSection;
			} else 
			return lazySection;//greenSection;*/
		}
		
		public static function camKoefRed():void {
			if (Platformer._player) {	
				if (Platformer._player.getBody().GetLinearVelocity().y <= 0) {
					camKoef = 1;
				} else {
					if (camKoef > 0.0001) {
						camKoef *= 0.97;
					}
				}
			}
		}
		
	}
}
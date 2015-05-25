package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class MoveAB extends Behavior {
		private var vel1:b2Vec2;
		private var vel2:b2Vec2;
		private var k:int = 2;
		
		public var point1:Point;
		public var point2:Point;
		public var direction:int = 1;
		
		public function MoveAB(loc1:Point, loc2:Point) {
			point1 = loc1;
			point2 = loc2;
			setVelocities();
		}
		
		private function setVelocities():void {
			if (point1.x == point2.x) {
				if (point1.y > point2.y) {
					vel1 = new b2Vec2(0, -k);
					vel2 = new b2Vec2(0, k);
				} else if (point1.y < point2.y) {
					vel1 = new b2Vec2(0, k);
					vel2 = new b2Vec2(0, -k);
				}
			} else if (point1.x > point2.x) {
				if (point1.y == point2.y) {
					vel1 = new b2Vec2(-k, 0);
					vel2 = new b2Vec2(k, 0);
				} else
					vel1 = new b2Vec2(k * Math.cos(Math.atan((point1.y - point2.y) / (point1.x - point2.x))), 
									  k * Math.sin(Math.atan((point1.y - point2.y) / (point1.x - point2.x))));
					vel2 = new b2Vec2( -k * Math.cos(Math.atan((point1.y - point2.y) / (point1.x - point2.x))), 
									   -k * Math.sin(Math.atan((point1.y - point2.y) / (point1.x - point2.x))));
					//trace(vel1.x+" x1y "+vel1.y);
					//trace(vel2.x+" x2y "+vel2.y);
			} else if (point1.x < point2.x) {
				if (point1.y == point2.y) {
					vel1 = new b2Vec2(k, 0);
					vel2 = new b2Vec2(-k, 0);
				} else
					vel1 = new b2Vec2(k * Math.cos(Math.atan((point2.y - point1.y) / (point2.x - point1.x))), 
									  k * Math.sin(Math.atan((point2.y - point1.y) / (point2.x - point1.x))));
					vel2 = new b2Vec2( -k * Math.cos(Math.atan((point2.y - point1.y) / (point2.x - point1.x))), 
									   -k * Math.sin(Math.atan((point2.y - point1.y) / (point2.x - point1.x))));
					//trace(vel1.x+" y1x "+vel1.y);
					//trace(vel2.x+" y2x "+vel2.y);
			}
		}
		
		private function findDirection(loc:b2Vec2):void {
			if (point1.x == point2.x) {
				if (point1.y > point2.y) {
					if (loc.y >= point1.y) {
						direction = 1;
					} else if (loc.y <= point2.y) {
						direction = -1;
					}
				}
			} else if (point1.x > point2.x) {
				if (loc.x >= point1.x) {
					direction = 1;
				} else if (loc.x <= point2.x) {
					direction = -1
				}
			} else if (point1.x < point2.x) {
				if (loc.x <= point1.x) {
					direction = 1;
				} else if (loc.x >= point2.x) {
					direction = -1;
				}
			}
		}
		
		override public function update(body:b2Body):void {
			if (point2 != null) {
				findDirection(body.GetWorldCenter());
				/*var vel3:b2Vec2 = new b2Vec2(point1.x-point2.x, point1.y-point2.y);
				var vel4:b2Vec2 = new b2Vec2(-vel3.x, -vel3.y);*/
				if (direction == 1) {
					body.SetLinearVelocity(vel1);
				} else 
				if (direction == -1) {
					body.SetLinearVelocity(vel2);
				}
				body.ApplyForce(new b2Vec2(0.0, -10.0 * body.GetMass()), body.GetWorldCenter());
			}
			super.update(body);
		}
	}
}
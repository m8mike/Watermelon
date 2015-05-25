package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class GhostBodyManager extends BodyManager {
		
		public function GhostBodyManager(location:Point, ghost:Ghost) {
			shape = new RectShape(18, 27);
			var ballBodyBuilder:DynamicBodyBuilder = new DynamicBodyBuilder();
			ballBodyBuilder.density = 0.5;
			ballBodyBuilder.friction = 0.3;
			ballBodyBuilder.restitution = 0.3;
			//ballBodyBuilder.groupIndex = -3;
			ballBodyBuilder.x = location.x;
			ballBodyBuilder.y = location.y;
			ballBodyBuilder.linearDamping = 0;
			ballBodyBuilder.angularDamping = 0;
			
			_body = ballBodyBuilder.getBody(new Array(shape));
			_body.SetUserData(ghost);
		}
		
		override public function updateNow():void {
			if (_body) {
				if (Ghost(_body.GetUserData()).behavior is Rotate) {
					_body.ApplyForce(new b2Vec2(0, -2.7), _body.GetWorldCenter());
				} else {	
					_body.m_sweep.a = 0;
				}
			}
			super.updateNow();
		}
	}
}
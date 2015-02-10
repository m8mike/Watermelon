package {
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class DummyBodyManager extends BodyManager {
		
		public function DummyBodyManager(location:Point, dummy:Character, shape:MyShape) {
			//shape = new RectShape(size, size);
			//shape = new CircleShape(size);
			var bodyBuilder:DynamicBodyBuilder = new DynamicBodyBuilder();
			bodyBuilder.density = 0.5;
			bodyBuilder.friction = 0.3;
			bodyBuilder.restitution = 0.3;
			//ballBodyBuilder.groupIndex = -3;
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			bodyBuilder.linearDamping = 0;
			bodyBuilder.angularDamping = 1;
			
			_body = bodyBuilder.getBody(new Array(shape));
			if (_body) {	
				_body.SetUserData(dummy);
			}
		}
		
		override public function updateNow():void {
			if (_body) {
				_body.m_sweep.a = 0;
			}
			super.updateNow();
		}
	}
}
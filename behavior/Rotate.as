package {
	import Box2D.Dynamics.b2Body;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Rotate extends Behavior {
		public var rotationSpeed:Number;
		
		public function Rotate(speed:Number) {
			rotationSpeed = speed;
		}
		
		override public function update(body:b2Body):void {
			body.SetAngularVelocity(rotationSpeed);
			super.update(body);
		}
	}
}
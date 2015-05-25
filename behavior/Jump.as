package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Jump extends Behavior {
		public var period:int;
		public var power:int;
		private var timeToJump:int;
		
		public function Jump(period:int, power:Number) {
			this.period = period;
			this.power = power;
			timeToJump = 0;
		}
		
		override public function update(body:b2Body):void {
			if (timeToJump > 0) {
				timeToJump--;
			} else {
				timeToJump = period;
				body.ApplyImpulse(new b2Vec2(0, -power), body.GetWorldCenter());
			}
			super.update(body);
		}
	}
}
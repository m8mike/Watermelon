package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Addable extends Decor {
		public var bodyBuilder:StaticBodyBuilder;
		private var body:b2Body;
		
		public function Addable(location:Point) {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0;
				bodyBuilder.friction = 0.2;
				bodyBuilder.restitution = 0.7;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			bodyBuilder.isSensor = true;
			var shape:RectShape = new RectShape(PhysiVals.MIN_SQARE, PhysiVals.MIN_SQARE);
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
	}
}
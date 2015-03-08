package {
	import Box2D.Collision.Shapes.b2CircleDef;
	import Box2D.Collision.Shapes.b2PolygonDef;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2ShapeDef;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import flash.display.DisplayObject;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Platform extends Actor {
		private var _body:b2Body;
		public var _costume:DisplayObject;
		protected var location:Point;
		
		public function Platform(myBody:b2Body, myCostume:DisplayObject) {
			_body = myBody;
			_body.SetUserData(this);
			_costume = myCostume;
			Platformer.platforms.push(this);
			updateCostumes();
		}
		
		override protected function cleanUpBeforeRemoving():void {
			Platformer.platforms.splice(Platformer.platforms.indexOf(this), 1);
			super.cleanUpBeforeRemoving();
		}
		
		override public function destroy():void {
			super.destroy();
		}
		
		override protected function removeBodies():void {
			Platformer.safeRemoveBody(_body);
			super.removeBodies();
		}
		
		override protected function removeCostumes():void {
			/*if (_costume) {
				if (_costume.parent) {
					_costume.parent.removeChild(_costume);
				}
				if (_costume.mask) {
					if (_costume.mask.parent) {
						_costume.mask.parent.removeChild(_costume.mask);
						_costume.mask = null;
					}
				}
			}*/
			if (_costume) {
				if (_costume.parent) {
					_costume.parent.removeChild(_costume);
				}
				_costume = null;
			}
			super.removeCostumes();
		}
		
		public function updateCostumes():void {
			_costume.x = _body.GetPosition().x * PhysiVals.RATIO;
			_costume.y = _body.GetPosition().y * PhysiVals.RATIO;
			_costume.rotation = _body.GetAngle() * 180 / Math.PI;
		}
	}
}
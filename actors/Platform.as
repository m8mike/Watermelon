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
		public var location:Point;
		public var shape:RectShape;
		public var bodyBuilder:StaticBodyBuilder;
		
		public function Platform(myBody:b2Body, myCostume:DisplayObject) {
			init(myBody, myCostume);
			Platformer.platforms.push(this);
			updateCostumes();
		}
		
		protected function init(myBody:b2Body, myCostume:DisplayObject):void {
			_body = myBody;
			_body.SetUserData(this);
			_costume = myCostume;
		}
		
		public function reload(x:Number, y:Number, w:Number, h:Number):void {
			removeBodies();
			removeCostumes();
			location = new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			shape = new RectShape(w * PhysiVals.MIN_SQARE, h * PhysiVals.MIN_SQARE);
			mask = shape.getSimpleSprite(location);
			mask.x = location.x;
			mask.y = location.y;
			CameraManager._staticLayer.addChild(mask);
			createCostumes();
			bounds = new Bounds(x, y, w, h);
			
			createBodies();
			super.init(body, mask);
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
package {
	import Box2D.Dynamics.b2Body;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Door extends Platform {
		public var mask:Sprite;
		private var body:b2Body;
		private var shape:RectShape;
		private var location:Point;
		private var koef:int = 20; //размер минимального квадрата
		
		public var isOpen:Boolean = false;
		
		public function Door(x:Number, y:Number) {
			location = new Point(x * koef, y * koef);
			shape = new RectShape(2 * koef, 3 * koef);
			mask = shape.getSimpleSprite(location);
			CameraManager._staticLayer.addChild(mask);
			//createCostumes();
			createBodies();
			Platformer.platforms.push(this);
			super(body, mask);
		}
		
		public function open():void {
			isOpen = true;
		}
		
		private function createCostumes():void {
			/*var loc:Point = location.clone();
			var loc1:Point = new Point(0, 0);
			var row:MovieClip = new ug2();
			CameraManager._staticLayer.addChildAt(row, 0);
			loc.x -= 30;
			loc.y -= 30;
			row.x = loc.x;
			row.y = loc.y;
			var k:int = 1 + mask.width / (row.width * 0.8);
			var l:int = 1 + mask.height / (row.height * 0.5);
			for (var i:int = 0; i <= l; i++) {
				for (var j:int = 0; j <= k; j++) {
					var undergr:MovieClip = new ug2();
					loc1.x = undergr.width * 0.8 * j;
					loc1.y = undergr.height * 0.5 * i;
					undergr.x = loc1.x;
					undergr.y = loc1.y;
					row.addChild(undergr);
				}
			}
			row.mask = mask;*/
		}
		
		private function createBodies():void {
			var standardBodyBuilder:StaticBodyBuilder = new StaticBodyBuilder();
			standardBodyBuilder.density = 0;
			standardBodyBuilder.friction = 0.2;
			standardBodyBuilder.restitution = 0.3;
			standardBodyBuilder.groupIndex = -2;
			standardBodyBuilder.x = location.x;
			standardBodyBuilder.y = location.y;
			body = standardBodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
		override protected function removeCostumes():void {
			mask.parent.removeChild(mask);
			mask = null;
			super.removeCostumes();
		}
	}

}
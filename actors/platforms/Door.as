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
		
		public var isOpen:Boolean = false;
		
		public function Door(x:Number, y:Number) {
			super();
			location = new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			super.reload();
			super.init(body, mask);
		}
		
		public function open():void {
			isOpen = true;
		}
		
		override public function reload():void {
			super.reload();
			super.init(body, mask);
		}
		
		override protected function createShapes():void {
			shape = new RectShape(2 * PhysiVals.MIN_SQARE, 3 * PhysiVals.MIN_SQARE);
			mask = shape.getSimpleSprite(location);
			CameraManager._staticLayer.addChild(mask);
		}
		
		override protected function createCostumes():void {
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
		
		override protected function cleanUpBeforeRemoving():void {
			Platformer._player.inventory.removeKey();
			super.cleanUpBeforeRemoving();
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {	
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0;
				bodyBuilder.friction = 0.2;
				bodyBuilder.restitution = 0.3;
				bodyBuilder.groupIndex = -2;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
		
		override protected function removeCostumes():void {
			mask.parent.removeChild(mask);
			mask = null;
			super.removeCostumes();
		}
	}
}
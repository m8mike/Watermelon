package 
{
	import bodyBuilder.StaticBodyBuilder;
	import Box2D.Dynamics.b2Body;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Standard extends Platform {
		private var body:b2Body;
		private var costume:MovieClip;
		public var mask:Sprite;
		private var bounds:Bounds;
		public var width:Number;
		public var height:Number;
		private var offsetCostumeFromMask:Point;
		
		public function Standard(x:Number, y:Number, w:Number = 1, h:Number = 1) {
			super();
			location = new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			width = w;
			height = h;
			super.reload();
			bounds = new Bounds(x, y, w, h);
			super.init(body, mask);
		}
		
		override public function reload():void {
			super.reload();
			/*mask.x = location.x * PhysiVals.MIN_SQARE;
			mask.y = location.y * PhysiVals.MIN_SQARE;*/
			bounds = new Bounds(location.x / PhysiVals.MIN_SQARE, location.y / PhysiVals.MIN_SQARE, width, height);
			super.init(body, mask);
		}
		
		public function bodyTrace():void {
			trace(body.GetWorldCenter().x + " " + body.GetWorldCenter().y);
		}
		
		override protected function createShapes():void {
			shape = new RectShape(width * PhysiVals.MIN_SQARE, height * PhysiVals.MIN_SQARE);
			mask = shape.getSimpleSprite(location);
			mask.x = location.x * PhysiVals.MIN_SQARE;
			mask.y = location.y * PhysiVals.MIN_SQARE;
			CameraManager._staticLayer.addChild(mask);
		}
		
		override protected function createCostumes():void {
			var loc:Point = location.clone();
			var loc1:Point = new Point(0, 0);
			costume = new MovieClip();
			costume.addChild(new ug2());
			CameraManager._staticLayer.addChildAt(costume, 0);
			loc.x *= PhysiVals.MIN_SQARE;
			loc.y *= PhysiVals.MIN_SQARE;
			loc.x -= 30;
			loc.y -= 30;
			costume.x = loc.x;
			costume.y = loc.y;
			var k:int = 1 + mask.width / (costume.width * 0.8);
			var l:int = 1 + mask.height / (costume.height * 0.5);
			for (var i:int = 0; i <= l; i++) {
				for (var j:int = 0; j <= k; j++) {
					var undergr:MovieClip = new ug2();
					loc1.x = undergr.width * 0.8 * j;
					loc1.y = undergr.height * 0.5 * i;
					undergr.x = loc1.x;
					undergr.y = loc1.y;
					costume.addChild(undergr);
				}
			}
			costume.mask = mask;
			costume.x = location.x - 30;
			costume.y = location.y - 30;
			offsetCostumeFromMask = new Point(costume.x - mask.x, costume.y - mask.y);
		}
		
		override protected function removeCostumes():void {
			if (costume) {
				if (costume.mask) {
					if (costume.mask.parent) {
						costume.mask.parent.removeChild(costume.mask);
					}
					costume.mask = null;
				}
				if (costume.parent) {
					costume.parent.removeChild(costume);
				}
				PhysiVals.cleanChildren(costume);
				/*while (costume.numChildren) {
					costume.removeChildAt(0);
				}*/
			}
			if (bounds) {
				bounds.remove();
			}
			super.removeCostumes();
		}
		
		override public function updateCostumes():void {
			super.updateCostumes();
			var angle:Number = body.GetAngle() / Math.PI * 180;
			if (bounds) {
				bounds.setAngle(angle);
				bounds.setLoc(body.GetPosition().x * PhysiVals.RATIO, body.GetPosition().y * PhysiVals.RATIO);
			}
			if (mask) {
				mask.rotation = angle;
			}
			if (costume) {
				costume.rotation = angle;
				costume.x = mask.x - 30;
				costume.y = mask.y - 30;
			}
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				StaticBodyBuilder(bodyBuilder).groupIndex = -2;
			}
			StaticBodyBuilder(bodyBuilder).x = location.x;
			StaticBodyBuilder(bodyBuilder).y = location.y;
			body = StaticBodyBuilder(bodyBuilder).getBody(new Array(shape));
		}
	}
}
package {
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class JumpThrough extends Platform {
		public var costume:MovieClip;
		private var body:b2Body;
		public var width:Number;
		public var height:Number;
		
		public function JumpThrough(x:Number, y:Number, w:Number = 1, h:Number = 1) {
			super();
			location = new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			width = w;
			height = h;
			super.reload();
			super.init(body, costume);
		}
		
		override public function reload():void {
			super.reload();
			super.init(body, costume);
		}
		
		override protected function createShapes():void {
			shape = new RectShape(width * PhysiVals.MIN_SQARE, height * PhysiVals.MIN_SQARE);
			/*mask = shape.getSimpleSprite(location);
			CameraManager._staticLayer.addChild(mask);*/
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
			
			var m:int = 1;
			var sectionWidth:Number = 0;
			costume = new MovieClip();
			m = 1;
			sectionWidth = 0;
			while (sectionWidth < width * PhysiVals.MIN_SQARE) {
				sectionWidth = 40 * m - 11 * (m - 1) - 21 + 44.88;
				var ceiling:AnimationCostume = new AnimationCostume("GroundBackground", costume);
				ceiling.setScale(0.15);
				ceiling.setLocation(40 * m - 11 * (m - 1) - 18, 0);
				ceiling.show();
				m++;
			}
			costume.x = location.x;
			costume.y = location.y;
			costume.width = (width+0.3) * PhysiVals.MIN_SQARE;
			CameraManager._staticLayer.addChild(costume);
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
	}

}
package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	import flash.net.FileReference;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Ghost extends Character {
		private var point2:Point;
		public var behavior:Behavior;
		
		public function Ghost(x:int, y:int, offsetToMove:Point = null) {
			bodyManager = new GhostBodyManager(new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE), this);
			costumeManager = new GhostCostumeManager(this);
			super(x, y);
			if (offsetToMove) {
				behavior = new Rotate(3);
				/*var wc:b2Vec2 = bodyManager.body.GetWorldCenter();
				point2 = new Point(wc.x + offsetToMove.x, wc.y + offsetToMove.y);
				behavior = new MoveAB(new Point(wc.x, wc.y), point2);*/
			} else {
				behavior = new Jump(100, 1);
			}
		}
		
		public function getBody():b2Body {
			return bodyManager.body;
		}
		
		override public function updateNow():void {
			if (behavior) {
				behavior.update(bodyManager.body);
			}
			super.updateNow();
		}
		
		override public function destroy():void {
			var wc:b2Vec2 = getBody().GetWorldCenter();
			Item.addRandomItem(wc.x * 1.5, wc.y * 1.5);
			/*PhysiVals.timeNumbText.text = PhysiVals.countPixels(Platformer.thisIs).toString();
			var file:FileReference = new FileReference();
			file.save(PhysiVals.str, "pixels.txt");*/
			super.destroy();
		}
	}
}
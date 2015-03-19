package {
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class JetpackBonus extends BubbleBonus {
		private var costume:MovieClip;
		
		public function JetpackBonus(x:Number, y:Number) {
			costume = new jetpack_bonus();
			costume.x = x * PhysiVals.MIN_SQARE;
			costume.y = y * PhysiVals.MIN_SQARE;
			costume.scaleX = 0.15;
			costume.scaleY = 0.15;
			CameraManager._staticLayer.addChild(costume);
			super(x, y);
		}
		
		override public function pick(player:Player):void {
			player.itemGet("Jetpack");
			super.pick(player);
		}
		
		override protected function cleanUpBeforeRemoving():void {
			if (!costume.parent) {
				trace("error JetpackBonus");
			} else {
				costume.parent.removeChild(costume);
			}
			super.cleanUpBeforeRemoving();
		}
	}
}
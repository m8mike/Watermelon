package {
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class BazookaBonus extends BubbleBonus {
		private var bazooka:MovieClip;
		private var koef:int = 20;
		
		public function BazookaBonus(x:Number, y:Number) {
			bazooka = new bazooka_bonus();
			bazooka.x = x * koef;
			bazooka.y = y * koef;
			bazooka.scaleX = 0.15;
			bazooka.scaleY = 0.15;
			CameraManager._staticLayer.addChild(bazooka);
			super(x, y);
		}
		
		override public function pick(player:Player):void {
			player.itemGet("Bazooka");
			super.pick(player);
		}
		
		override protected function cleanUpBeforeRemoving():void {
			if (!bazooka.parent) {
				trace("error bazookaBonus");
			} else {
				bazooka.parent.removeChild(bazooka);
			}
			super.cleanUpBeforeRemoving();
		}
	}
}
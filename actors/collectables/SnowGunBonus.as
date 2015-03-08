package {
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class SnowGunBonus extends BubbleBonus {
		private var gun:MovieClip;
		private var koef:int = 20;
		
		public function SnowGunBonus(x:Number, y:Number) {
			gun = new snowgun_bonus();
			gun.x = x * koef;
			gun.y = y * koef;
			gun.scaleX = 0.15;
			gun.scaleY = 0.15;
			CameraManager._staticLayer.addChild(gun);
			super(x, y);
		}
		
		override public function pick(player:Player):void {
			player.itemGet("SnowGun");
			super.pick(player);
		}
		
		override protected function cleanUpBeforeRemoving():void {
			if (!gun.parent) {
				trace("error snowGunBonus");
			} else {
				gun.parent.removeChild(gun);
			}
			super.cleanUpBeforeRemoving();
		}
	}
}
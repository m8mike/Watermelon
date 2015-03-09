package {
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class UmbrellaBonus extends BubbleBonus {
		private var umbrella:MovieClip;
		
		public function UmbrellaBonus(x:Number, y:Number) {
			umbrella = new umbrella_bonus();
			umbrella.x = x * PhysiVals.MIN_SQARE;
			umbrella.y = y * PhysiVals.MIN_SQARE;
			umbrella.scaleX = 0.15;
			umbrella.scaleY = 0.15;
			CameraManager._staticLayer.addChild(umbrella);
			super(x, y);
		}
		
		override public function pick(player:Player):void {
			player.itemGet("Umbrella");
			super.pick(player);
			/*trace(Platformer.countPixels(Platformer.thisIs));
			trace(Platformer.objectCounter);*/
		}
		
		override protected function cleanUpBeforeRemoving():void {
			umbrella.parent.removeChild(umbrella);
			super.cleanUpBeforeRemoving();
		}
	}
}
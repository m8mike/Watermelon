package {
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Spikes extends Platform {
		public var mask:Sprite;
		private var body:b2Body;
		public var width:Number;
		public var height:Number;
		private var _costumes:Array;
		private var spikesCostume:MovieClip;
		
		public function Spikes(x:Number, y:Number, w:Number = 1, h:Number = 1) {
			_costumes = [];
			width = w;
			height = h;
			super();
			location = new Point(x * PhysiVals.MIN_SQARE, y * PhysiVals.MIN_SQARE);
			super.reload();
			super.init(body, mask);
		}
		
		override public function reload():void {
			super.reload();
			super.init(body, mask);
		}
		
		override protected function createShapes():void {
			shape = new RectShape(width * PhysiVals.MIN_SQARE, height * PhysiVals.MIN_SQARE);
			mask = shape.getSimpleSprite(location);
			CameraManager._staticLayer.addChild(mask);
			mask.visible = false;
		}
		
		override protected function createCostumes():void {
			spikesCostume = new MovieClip();
			var count:int = int(width);
			while (count >= 1) {
				count--;
				var costume:AnimationCostume = new AnimationCostume("spikes_2", spikesCostume, 0.05, 0.05);
				costume.setCoords(count * PhysiVals.MIN_SQARE, 0);
				costume.animation.visible = true;
				_costumes.push(costume);
			}
			CameraManager._dynamicLayer.addChild(spikesCostume);
		}
		
		override public function updateCostumes():void {
			var x:Number = body.GetPosition().x * PhysiVals.RATIO;
			var y:Number = body.GetPosition().y * PhysiVals.RATIO;
			spikesCostume.rotation = body.GetAngle() / Math.PI * 180;
			spikesCostume.x = x;
			spikesCostume.y = y;
			super.updateCostumes();
		}
		
		override protected function removeCostumes():void {
			while (_costumes.length) {
				AnimationCostume(_costumes[0]).remove();
				_costumes.splice(0, 1);
			}
			spikesCostume.parent.removeChild(spikesCostume);
			super.removeCostumes();
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
package {
	import Box2D.Collision.Shapes.b2ShapeDef;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class MyShape {
		protected var shapeDef:b2ShapeDef;
		
		public function MyShape() {
		
		}
		
		public function getShapeDef():b2ShapeDef {
			return null;
		}
		
		public function getSimpleSprite(location:Point):Sprite {
			return null;
		}
	}

}
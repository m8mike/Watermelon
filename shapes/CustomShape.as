package  
{
	import Box2D.Collision.Shapes.b2PolygonDef;
	import Box2D.Collision.Shapes.b2ShapeDef;
	import Box2D.Common.Math.b2Vec2;
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class CustomShape extends MyShape
	{
		public var _coords:Array;
		
		public function CustomShape(coords:Array) 
		{
			_coords = coords;
		}
		
		override public function getShapeDef():b2ShapeDef 
		{
			shapeDef = new b2PolygonDef();
			var listOfPoints:Array = shape._coords; 
			b2PolygonDef(shapeDef).vertexCount = listOfPoints.length;
			for (var i:int = 0; i < listOfPoints.length; i++) {
				var nextPoint:Point = listOfPoints[i];
				b2Vec2(b2PolygonDef(shapeDef).vertices[i]).Set(nextPoint.x / PhysiVals.RATIO,
															   nextPoint.y / PhysiVals.RATIO);
			}
			return shapeDef;
		}
		
		override public function getSimpleSprite(location:Point):Sprite 
		{
			var sprite = new Sprite();
			sprite.graphics.lineStyle(2, Math.random() * 0x1000000); 
			for each (var listOfPoints:Array in _coords) {
				var firstPoint:Point = listOfPoints[0];
				sprite.graphics.moveTo(firstPoint.x, firstPoint.y);
				sprite.graphics.beginFill(Math.random() * 0x1000000);
				for each (var newPoint:Point in listOfPoints) {
					newSprite.graphics.lineTo(newPoint.x, newPoint.y);
				}
				sprite.graphics.lineTo(firstPoint.x, firstPoint.y);
				sprite.graphics.endFill();
			}
			sprite.x = location.x;
			sprite.y = location.y;
			
		}
	}

}
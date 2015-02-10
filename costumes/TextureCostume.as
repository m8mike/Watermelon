package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class TextureCostume extends Costume {
		public var sprite:Sprite;
		public var texture:MovieClip;
		public var colorStroke:uint;
		public var colorFill:uint;
		public var shape:MyShape;
		
		public function TextureCostume() {
		
		}
		
		private function createSimpleSprite(location:Point, parent:DisplayObjectContainer):void {
			sprite = new Sprite();
			sprite.graphics.lineStyle(2, colorStroke);
			if (shape is CircleShape) {
				sprite.graphics.beginFill(colorFill);
				sprite.graphics.drawCircle(location.x, location.y, CircleShape(shape)._radius);
				sprite.graphics.endFill();
			} else if (shape is RectShape) {
				sprite.graphics.beginFill(colorFill);
				sprite.graphics.drawRect(location.x, location.y, RectShape(shape)._width, RectShape(shape)._height);
				sprite.graphics.endFill();
			} else if (shape is CustomShape) {
				for each (var listOfPoints:Array in CustomShape(shape)._coords) {
					var firstPoint:Point = listOfPoints[0];
					sprite.graphics.moveTo(firstPoint.x, firstPoint.y);
					for each (var newPoint:Point in listOfPoints) {
						sprite.graphics.lineTo(newPoint.x, newPoint.y);
					}
					sprite.graphics.lineTo(firstPoint.x, firstPoint.y);
					sprite.graphics.endFill();
				}
			}
			sprite.x = location.x;
			sprite.y = location.y;
			parent.addChild(sprite);
		}
		
		private function createTexture(location:Point, parent:DisplayObjectContainer):Sprite {
			var loc:Point = location.clone();
			var loc1:Point = new Point(0, 0);
			texture = new ug2();
			parent.addChildAt(texture, 0);
			loc.x -= 30;
			loc.y -= 30;
			texture.x = loc.x;
			texture.y = loc.y;
			var k:int = 1 + newSprite.width / (texture.width * 0.8);
			var l:int = 1 + newSprite.height / (texture.height * 0.5);
			for (var i:int = 0; i <= l; i++) {
				for (var j:int = 0; j <= k; j++) {
					var undergr:MovieClip = new ug2();
					loc1.x = undergr.width * 0.8 * j;
					loc1.y = undergr.height * 0.5 * i;
					undergr.x = loc1.x;
					undergr.y = loc1.y;
					texture.addChild(undergr);
				}
			}
			texture.mask = sprite;
		}
	/*public function createTextureById(id:String, location:Point, parent:DisplayObjectContainer) {
	   texture = new (getDefinitionByName(identifier))();
	   texture.x = location.x;
	   texture.y = location.y;
	   parent.addChild(texture);
	   //Platformer.rasterize(cloudSprite);
	}*/
	
	}

}
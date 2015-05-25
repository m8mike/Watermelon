package {
	import Box2D.Collision.Shapes.b2CircleDef;
	import Box2D.Collision.Shapes.b2PolygonDef;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2ShapeDef;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Platform extends Actor {
		private var _body:b2Body;
		public var _costume:DisplayObject;
		public var location:Point;
		public var shape:RectShape;
		public var bodyBuilder:StaticBodyBuilder;
		public var behavior:Behavior;
		
		public function Platform() {
		
		}
		
		protected function init(myBody:b2Body, myCostume:DisplayObject):void {
			if (Platformer.platforms.indexOf(this) == -1) {
				Platformer.platforms.push(this);
			}
			_body = myBody;
			_body.SetUserData(this);
			_costume = myCostume;
			updateCostumes();
		}
		
		public function setAngle(angle:Number):void {
			_body.SetXForm(_body.GetPosition(), angle / 180 * Math.PI);
			updateCostumes();
		}
		
		public function reload():void {
			if (_body) {
				removeBodies();
				removeCostumes();
			}
			createShapes();
			createCostumes();
			createBodies();
		}
		
		override protected function cleanUpBeforeRemoving():void {
			Platformer.platforms.splice(Platformer.platforms.indexOf(this), 1);
			super.cleanUpBeforeRemoving();
		}
		
		protected function createShapes():void {
		
		}
		
		protected function createBodies():void {
			//deleted = false;
		}
		
		protected function createCostumes():void {
		
		}
		
		override protected function removeBodies():void {
			Platformer.safeRemoveBody(_body);
			super.removeBodies();
		}
		
		override protected function removeCostumes():void {
			if (_costume) {
				if (_costume.parent) {
					_costume.parent.removeChild(_costume);
				}
				_costume = null;
			}
			super.removeCostumes();
		}
		
		public function setMovingTo(x:Number, y:Number):void {
			var wc:b2Vec2 = _body.GetWorldCenter();
			var point2:Point = new Point(wc.x + x, wc.y + y);
			behavior = new MoveAB(new Point(wc.x, wc.y), point2);
		}
		
		override public function updateNow():void {
			if (behavior) {
				behavior.update(_body);
			}
			updateCostumes();
			super.updateNow();
		}
		
		public function updateCostumes():void {
			_costume.x = _body.GetPosition().x * PhysiVals.RATIO;
			_costume.y = _body.GetPosition().y * PhysiVals.RATIO;
			_costume.rotation = _body.GetAngle() * 180 / Math.PI;
		}
		
		override public function getXML():XML {
			//var typeOfPlatform:String = this.toString().substring(8, this.toString().length - 1);
			var typeOfPlatform:String = getQualifiedClassName(this);
			var angle:Number = _body.GetAngle() * 180 / Math.PI;
			var xml:XML =  < { typeOfPlatform } x = { location.x } y = { location.y } angle = {angle}
									density = { bodyBuilder.density } friction = { bodyBuilder.friction } 
									restitution = { bodyBuilder.restitution } groupIndex = { bodyBuilder.groupIndex } 
									isSensor = { bodyBuilder.isSensor } linearDamping = { bodyBuilder.linearDamping } 
									angularDamping = { bodyBuilder.angularDamping } jumpThrough = { bodyBuilder.jumpThrough } 
									fixedRotation = { bodyBuilder.fixedRotation } bullet = { bodyBuilder.bullet } >{typeOfPlatform}
							</{typeOfPlatform}>;
			if (this is Teleporter) {
				xml.@x1 = Teleporter(this).getSpawnPoint().x;
				xml.@y1 = Teleporter(this).getSpawnPoint().y;
			} else if (this is JumpThrough) {
				xml.@w = JumpThrough(this).width;
				xml.@h = JumpThrough(this).height;
			} else if (this is Spikes) {
				xml.@w = Spikes(this).width;
				xml.@h = Spikes(this).height;
			} else if (this is Standard) {
				xml.@w = Standard(this).width;
				xml.@h = Standard(this).height;
			}
			return xml;
		}
	}
}
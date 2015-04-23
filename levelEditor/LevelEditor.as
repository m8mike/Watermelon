package {
	import Box2D.Collision.b2AABB;
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelEditor {
		private var type:String = "unknown";
		private var x:Number;
		private var y:Number;
		private var w:Number;
		private var h:Number;
		private var angle:Number;
		
		public static var currentPlatform:Platform;
		
		public function LevelEditor() {
			HUD.addInvisibleButton();
			HUD.addReloadButton();
			HUD.addRespawnButton();
			HUD.ib.addEventListener(MouseEvent.CLICK, selectBody);
			HUD.addInfoText("type = ");
			HUD.addInfoText("x = ");
			HUD.addInfoText("y = ");
			HUD.addInfoText("w = ");
			HUD.addInfoText("h = ");
			HUD.addInfoText("angle = ");
			HUD.addInfoText("density = ");
			HUD.addInfoText("friction = ");
			HUD.addInfoText("restitution = ");
			HUD.addInfoText("groupIndex = ");
			HUD.addInfoText("isSensor = ");
			HUD.addInfoText("linearDamping = ");
			HUD.addInfoText("angularDamping = ");
			HUD.addInfoText("jumpThrough = ");
			HUD.addInfoText("fixedRotation = ");
			HUD.addInfoText("bullet = ");
			HUD.addCheckBox(false, 10);
			HUD.addCheckBox(false, 13);
			HUD.addCheckBox(true, 14);
			HUD.addCheckBox(true, 15);
			HUD.addEditText("", 1);
			HUD.addEditText("", 2);
			HUD.addEditText("", 3);
			HUD.addEditText("", 4);
			HUD.addEditText("", 5);
			HUD.addEditText("", 6);
			HUD.addEditText("", 7);
			HUD.addEditText("", 8);
			HUD.addEditText("", 9);
			HUD.addEditText("", 11);
			HUD.addEditText("", 12);
		}
		
		private function selectBody(e:MouseEvent):void {
			var x:Number = 1/CameraManager.zoomKoef * (e.stageX - CameraManager.pLayer.x) / 72;
			var y:Number = 1/CameraManager.zoomKoef * (e.stageY - CameraManager.pLayer.y) / 72;
			var x1:Number = 1/CameraManager.zoomKoef * (e.stageX - CameraManager.pLayer.x) / 108;
			var y1:Number = 1/CameraManager.zoomKoef * (e.stageY - CameraManager.pLayer.y) / 108;
			
			var p:b2Vec2 = new b2Vec2(x1, y1);
			var callback:Array = [];
			var aabb:b2AABB = new b2AABB();
			aabb.lowerBound.Set(x1, y1);
			aabb.upperBound.Set(x1, y1);
			PhysiVals.world.Query(aabb, callback, 1);
			if (callback.length) {
				trace("callback[0] " + callback[0].toString());
				var ud;
				var body:b2Body;
				if (callback[0] is b2PolygonShape) {
					body = b2PolygonShape(callback[0]).GetBody();
					ud = body.GetUserData();
					if (ud is Platform) {
						currentPlatform = Platform(ud);
						TextField(HUD._info[0]).text = "type = " + ud.toString();
						TextField(HUD._info[1]).text = "x = " + Platform(ud).location.x;
						TextField(HUD._info[2]).text = "y = " + Platform(ud).location.y;
						TextField(HUD._info[3]).text = "w = " + Platform(ud).shape._width;
						TextField(HUD._info[4]).text = "h = " + Platform(ud).shape._height;
						TextField(HUD._info[5]).text = "angle = " + body.GetAngle() * 180 / Math.PI;
						TextField(HUD._info[6]).text = "density = " + body.GetShapeList().m_density;
						TextField(HUD._info[7]).text = "friction = " + body.GetShapeList().GetFriction();
						TextField(HUD._info[8]).text = "restitution = " + body.GetShapeList().GetRestitution();
						TextField(HUD._info[9]).text = "groupIndex = " + Platform(ud).bodyBuilder.groupIndex;
						TextField(HUD._info[10]).text = "isSensor = " + Platform(ud).bodyBuilder.isSensor;
						TextField(HUD._info[11]).text = "linearDamping = " + Platform(ud).bodyBuilder.linearDamping;
						TextField(HUD._info[12]).text = "angularDamping = " + Platform(ud).bodyBuilder.angularDamping;
						TextField(HUD._info[13]).text = "jumpThrough = " + Platform(ud).bodyBuilder.jumpThrough;
						TextField(HUD._info[14]).text = "fixedRotation = " + Platform(ud).bodyBuilder.fixedRotation;
						TextField(HUD._info[15]).text = "bullet = " + Platform(ud).bodyBuilder.bullet;
						MyCheckBox(HUD._changes[0]).changeTo(Platform(ud).bodyBuilder.isSensor);
						MyCheckBox(HUD._changes[1]).changeTo(Platform(ud).bodyBuilder.jumpThrough);
						MyCheckBox(HUD._changes[2]).changeTo(Platform(ud).bodyBuilder.fixedRotation);
						MyCheckBox(HUD._changes[3]).changeTo(Platform(ud).bodyBuilder.bullet);
						TextField(HUD._edit[0]).text = Platform(ud).location.x.toString();
						TextField(HUD._edit[1]).text = Platform(ud).location.y.toString();
						TextField(HUD._edit[2]).text = Platform(ud).shape._width.toString();
						TextField(HUD._edit[3]).text = Platform(ud).shape._height.toString();
						TextField(HUD._edit[4]).text = "" + body.GetAngle() * 180 / Math.PI;
						TextField(HUD._edit[5]).text = body.GetShapeList().m_density.toString();
						TextField(HUD._edit[6]).text = body.GetShapeList().GetFriction().toString();
						TextField(HUD._edit[7]).text = body.GetShapeList().GetRestitution().toString();
						TextField(HUD._edit[8]).text = Platform(ud).bodyBuilder.groupIndex.toString();
						TextField(HUD._edit[9]).text = Platform(ud).bodyBuilder.linearDamping.toString();
						TextField(HUD._edit[10]).text = Platform(ud).bodyBuilder.angularDamping.toString();
					}
				} else if (callback[0] is b2CircleShape) {
					ud = b2CircleShape(callback[0]).GetBody().GetUserData();
					trace(ud.toString());
				}
			} else {
				trace("no object in this area");
			}
		}
	}
}
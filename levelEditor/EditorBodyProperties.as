package {
	import Box2D.Collision.Shapes.b2Shape;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class EditorBodyProperties {
		public static var _info:Array = [];
		public static var _edit:Array = [];
		
		public function EditorBodyProperties() {
			addInfoText("type = ");
			addInfoText("x = ");
			addInfoText("y = ");
			addInfoText("w = ");
			addInfoText("h = ");
			addInfoText("angle = ");
			addInfoText("density = ");
			addInfoText("friction = ");
			addInfoText("restitution = ");
			addInfoText("groupIndex = ");
			addInfoText("isSensor = ");
			addInfoText("linearDamping = ");
			addInfoText("angularDamping = ");
			addInfoText("jumpThrough = ");
			addInfoText("fixedRotation = ");
			addInfoText("bullet = ");
			
			addEditText("", 1);
			addEditText("", 2);
			addEditText("", 3);
			addEditText("", 4);
			addEditText("", 5);
			addEditText("", 6);
			addEditText("", 7);
			addEditText("", 8);
			addEditText("", 9);
			addEditText("", 11);
			addEditText("", 12);
		}
		
		public static function addInfoText(text:String):void {
			var tf:TextField = new TextField();
			tf.x = 500;
			tf.y = 20 * _info.length;
			tf.visible = true;
			tf.selectable = false;
			tf.text = text;
			var mytf:TextFormat = new TextFormat("Courier New");
			tf.setTextFormat(mytf);
			tf.defaultTextFormat = mytf;
			tf.width = 200;
			tf.height = 20;
			tf.background = true;
			tf.backgroundColor = 0x000000;
			tf.alpha = 0.9;
			tf.textColor = 0xFF0000;
			_info.push(tf);
			CameraManager.hud.addChild(tf);
		}
		
		public static function addEditText(text:String, num:int):void {
			var tf:TextField = new TextField();
			tf.x = 450;
			tf.y = 20 * num;
			tf.visible = true;
			tf.selectable = true;
			tf.type = TextFieldType.INPUT;
			tf.addEventListener(Event.CHANGE, changeText);
			tf.text = text;
			var mytf:TextFormat = new TextFormat("Courier New");
			tf.setTextFormat(mytf);
			tf.defaultTextFormat = mytf;
			tf.width = 50;
			tf.height = 20;
			tf.background = true;
			tf.backgroundColor = 0x000000;
			tf.alpha = 0.7;
			tf.textColor = 0xFF0000;
			_edit.push(tf);
			CameraManager.hud.addChild(tf);	
		}
		
		private static function changeText(e:Event):void {
			if (!LevelEditor.currentPlatform) {
				return void;
			}
			var value:Number = Number(TextField(e.target).text);
			var index:int = _edit.indexOf(TextField(e.target));
			switch (index) {
				case 0:
					
				break;
				case 1:
					
				break;
				case 2:
					
				break;
				case 3:
					
				break;
				case 5:
					LevelEditor.currentPlatform.bodyBuilder.density = value;
				break;
				case 6:
					LevelEditor.currentPlatform.bodyBuilder.friction = value;
				break;
				case 7:
					LevelEditor.currentPlatform.bodyBuilder.restitution = value;
				break;
				default:
			}
		}
		
		public function setInfoVisibility(vis:Boolean):void {
			for each (var tf1:TextField in _info) {
				tf1.visible = vis;
			}
			for each (var tf2:TextField in _edit) {
				tf2.visible = vis;
			}
		}
		
		public function setType(type:String):void {
			_info[0].text = "type = " + type;
		}
		
		public function setXYWH(ud:Platform):void {
			_info[1].text = "x = " + ud.location.x;
			_info[2].text = "y = " + ud.location.y;
			_info[3].text = "w = " + ud.shape._width;
			_info[4].text = "h = " + ud.shape._height;
		}
		
		public function setAngle(angle:Number):void {
			_info[5].text = "angle = " + angle;
		}
		
		public function setShapeParams(shapeList:b2Shape):void {
			_info[6].text = "density = " + shapeList.m_density;
			_info[7].text = "friction = " + shapeList.GetFriction();
			_info[8].text = "restitution = " + shapeList.GetRestitution();
		}
		
		public function setBuilderParams(bodyBuilder:StaticBodyBuilder):void {
			_info[9].text = "groupIndex = " + bodyBuilder.groupIndex;
			_info[10].text = "isSensor = " + bodyBuilder.isSensor;
			_info[11].text = "linearDamping = " + bodyBuilder.linearDamping;
			_info[12].text = "angularDamping = " + bodyBuilder.angularDamping;
			_info[13].text = "jumpThrough = " + bodyBuilder.jumpThrough;
			_info[14].text = "fixedRotation = " + bodyBuilder.fixedRotation;
			_info[15].text = "bullet = " + bodyBuilder.bullet;
		}
		
		public function setEditXYWH(ud:Platform):void {
			_edit[0].text = ud.location.x.toString();
			_edit[1].text = ud.location.y.toString();
			_edit[2].text = ud.shape._width.toString();
			_edit[3].text = ud.shape._height.toString();
		}
		
		public function setEditAngle(angle:Number):void {
			_edit[4].text = "" + angle;
		}
		
		public function setEditShapeParams(shapeList:b2Shape):void {
			_edit[5].text = shapeList.m_density.toString();
			_edit[6].text = shapeList.GetFriction().toString();
			_edit[7].text = shapeList.GetRestitution().toString();
		}
		
		public function setEditBuilderParams(bodyBuilder:StaticBodyBuilder):void {
			_edit[8].text = bodyBuilder.groupIndex.toString();
			_edit[9].text = bodyBuilder.linearDamping.toString();
			_edit[10].text = bodyBuilder.angularDamping.toString();	
		}
		
		public function getX():Number {
			return Number(TextField(_edit[0]).text);
		}
		
		public function getY():Number {
			return Number(TextField(_edit[1]).text);
		}
		
		public function getW():Number {
			return Number(TextField(_edit[2]).text) / PhysiVals.MIN_SQARE;
		}
		
		public function getH():Number {
			return Number(TextField(_edit[3]).text) / PhysiVals.MIN_SQARE;
		}
		
		public function getAngle():Number {
			return Number(TextField(_edit[4]).text);
		}
	}
}
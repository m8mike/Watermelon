package {
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.FileReference;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.utils.getDefinitionByName;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelLoader {
		
		public static var xmlToLoad:XML;
		private static var ldr:URLLoader;
		private static var loading:Boolean;
		private static var completeLoading:Function = null;
		
		public function LevelLoader() {
		
		}
		
		public static function saveLevel() {
			var str:String = "<actors><platforms>";
			for each (var platform:Platform in Platformer.platforms) {
				str += platform.getXML().toXMLString();
			}
			str += "</platforms>";
			str += "<collectables>";
			for each (var collectable:Collectable in Platformer.collectables) {
				str += collectable.getXML().toXMLString();
			}
			str += "</collectables>";
			str += "<characters>";
			for each (var character:Character in Platformer.characters) {
				str += character.getXML().toXMLString();
			}
			str += "</characters>";
			str += "<spawn>" +"<x>" + int(parseInt(TextField(HUD._spawn[0]).text) / PhysiVals.MIN_SQARE) + "</x>";
			str += "<y>" + int(parseInt(TextField(HUD._spawn[1]).text) / PhysiVals.MIN_SQARE) + "</y>" + "</spawn>";
			str += "</actors>"
			var xml:XML = new XML(str);
			var file:FileReference = new FileReference();
			file.save(xml.toXMLString(), "test.xml");
		}
		
		public static function reloadLevel(name:String, onLoad:Function = null) {
			/*ldr = new URLLoader();
			ldr.addEventListener(Event.COMPLETE, reloadComplete);
			ldr.addEventListener(IOErrorEvent.IO_ERROR, loadError);
			var path:String = "file://localhost/D:/levels/" + name + ".xml";
			ldr.load(new URLRequest(path));*/
			Platformer.menu.clouds.visible = true;
			completeLoading = onLoad;
			reloadComplete(BigXML.getStr(name));
		}
		
		public static function loadLevel(name:String, onLoad:Function = null) {
			/*ldr = new URLLoader();
			ldr.addEventListener(Event.COMPLETE, loadComplete);
			ldr.addEventListener(IOErrorEvent.IO_ERROR, loadError);
			var path:String = "file://localhost/D:/levels/" + name + ".xml";
			ldr.load(new URLRequest(path));*/
			Platformer.menu.clouds.visible = true;
			completeLoading = onLoad;
			loadComplete(BigXML.getStr(name));
		}
		
		public static function reloadXml():void {
			if (!loading) {	
				loading = true;
				createCollectables(xmlToLoad.collectables);
				spawnPlayer(xmlToLoad.spawn);
				loading = false;
				xmlToLoad = null;
				if (completeLoading != null) {
					completeLoading();
					completeLoading = null;
				}
			}
		}
		
		public static function loadXml():void {
			if (!loading) {	
				loading = true;
				createPlatforms(xmlToLoad.platforms);
				createCollectables(xmlToLoad.collectables);
				createCharacters(xmlToLoad.characters);
				spawnPlayer(xmlToLoad.spawn);
				loading = false;
				xmlToLoad = null;
				if (completeLoading != null) {
					completeLoading();
					completeLoading = null;
				}
			}
		}
		
		private static function spawnPlayer(spawn:XMLList):void {
			var x:Number = parseInt(spawn.x);
			var y:Number = parseInt(spawn.y);
			if (!x || !y) {
				x = 2;
				y = -6;
			}
			var x1:Number = x * PhysiVals.MIN_SQARE;
			var y1:Number = y * PhysiVals.MIN_SQARE;
			TextField(HUD._spawn[0]).text = x1.toString();
			TextField(HUD._spawn[1]).text = y1.toString();
			Platformer._player = new Player(x, y, Platformer.controls);
			Platformer.activation(null);
		}
		
		private static function createPlatforms(platforms:XMLList):void {
			for each (var platform:XML in platforms.*) {
				var x:Number = parseFloat(platform.attribute("x")) / 20;
				var y:Number = parseFloat(platform.attribute("y")) / 20;
				var w:Number = parseFloat(platform.attribute("w"));
				var h:Number = parseFloat(platform.attribute("h"));
				var angle:Number = parseFloat(platform.attribute("angle"));
				var density:Number = parseFloat(platform.attribute("density"));
				var friction:Number = parseFloat(platform.attribute("friction"));
				var restitution:Number = parseFloat(platform.attribute("restitution"));
				var isSensor:Boolean = Boolean(platform.attribute("isSensor"));
				var bullet:Boolean = Boolean(platform.attribute("bullet"));
				var angularDamping:Number = parseFloat(platform.attribute("angularDamping"));
				var linearDamping:Number = parseFloat(platform.attribute("linearDamping"));
				var jumpThrough:Boolean = Boolean(platform.attribute("jumpThrough"));
				var fixedRotation:Boolean = Boolean(platform.attribute("fixedRotation"));
				var groupIndex:Number = parseInt(platform.attribute("groupIndex"));
				if (platform.text() == "EndLevel") {
					continue;
				}
				var newPlatform:Platform = new (getDefinitionByName(platform.text()))(x, y);
				newPlatform.bodyBuilder.angle = angle;
				newPlatform.bodyBuilder.density = density;
				newPlatform.bodyBuilder.friction = friction;
				newPlatform.bodyBuilder.restitution = restitution;
				if (platform.text().contains("Teleporter")) {
					Teleporter(newPlatform).location.x = x * 20;
					Teleporter(newPlatform).location.y = y * 20;
					var x1:Number = parseFloat(platform.attribute("x1"));
					var y1:Number = parseFloat(platform.attribute("y1"));
					Teleporter(newPlatform).setSpawnPoint(x1, y1);
				} else if (platform.text().contains("JumpThrough")) {
					JumpThrough(newPlatform).width = w;
					JumpThrough(newPlatform).height = h;
				} else if (platform.text().contains("Spikes")) {
					Spikes(newPlatform).width = w;
					Spikes(newPlatform).height = h;
				} else if (platform.text().contains("Standard")) {
					Standard(newPlatform).width = w;
					Standard(newPlatform).height = h;
				} else if (platform.text().contains("GroundZero")) {
					GroundZero(newPlatform).width = w;
					GroundZero(newPlatform).height = h;
				} else if (platform.text().contains("GroundBelow")) {
					GroundBelow(newPlatform).width = w;
					GroundBelow(newPlatform).height = h;
				}
				newPlatform.reload();
			}
		}
		
		private static function createCollectables(collectables:XMLList):void {
			LevelInfo.bubblesPopped = 0;
			LevelInfo.numBubbles = 0;
			LevelInfo.diamondsCollected = 0;
			LevelInfo.numDiamonds = 0;
			for each (var collectable:XML in collectables.*) {
				var x:Number = parseFloat(collectable.attribute("x")) / 20;
				var y:Number = parseFloat(collectable.attribute("y")) / 20;
				var newCollectable:Collectable = new (getDefinitionByName(collectable.text()))(x, y);
				if (newCollectable is BubbleBonus) {
					LevelInfo.numBubbles++;
				}
				if (newCollectable is DiamondBonus) {
					LevelInfo.numDiamonds++;
				}
			}
		}
		
		private static function createCharacters(characters:XMLList):void {
			for each (var character:XML in characters.*) {
				var x:Number = parseFloat(character.attribute("x"));
				var y:Number = parseFloat(character.attribute("y"));
				if (character.text().contains("Player")) {
					//Platformer._player = new Player(x / 20, y / 20, new Controls());
				} else {
					var newCharacter:Character = new (getDefinitionByName(character.text()))(x, y);
				}
			}
		}
		
		private static function reloadComplete(e:XML):void {
			//PhysiVals.clearLevel();
			Platformer.removeCollectables = true;
			xmlToLoad = e;
			//ldr.removeEventListener(Event.COMPLETE, reloadComplete);
			//ldr.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
		}
		
		private static function loadComplete(e:XML):void {
			//PhysiVals.clearLevel();
			Platformer.deleteAll = true;
			xmlToLoad = e;
			//ldr.removeEventListener(Event.COMPLETE, loadComplete);
			//ldr.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
		}
		
		private static function loadError(e:IOErrorEvent):void {
			trace(e.errorID);
		}
	}
}
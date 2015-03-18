package {
	import Box2D.Common.Math.b2Vec2;
	import flash.display.Bitmap;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.geom.Point;
	import raster.touchmypixel.peepee.utils.Animation;
	
	/**
	* Класс для управления камерами
	* @author Mad Mike
	*/
	public class CameraManager {
		/*
		заставка
		меню
		невидимые кнопки
		интерфейс
		слои перед игроком
		объекты перед игроком
		игрок
		нулевой слой
		слои за нулевым*/
		
		public static var loadingScreen:Sprite;
		public static var menu:Sprite;
		public static var invisibleButtons:Sprite;
		public static var gui:Sprite;
		public static var nearLayers:Sprite;
		public static var belowLayer:Camera;
		public static var pLayer:Camera;
		public static var zeroLayer:Sprite;
		public static var farLayers:Sprite;
		
		public static var funkyMountains:Animation;
		public static var coniferous:Animation;
		public static var bigCloud1:Animation;
		public static var bigCloud2:Animation;
		public static var bigCloud3:Animation;
		public static var fon:Animation;
		public static var fon2:Animation;
		public static var fon3:Animation;
		public static var fon4:Animation;
		
		public static var _camera:Camera;
		
		//hills
		public static var _camera01:Camera;
		public static var _camera02:Camera;
		public static var _camera03:Camera;
		public static var _camera04:Camera;
		//clouds
		public static var _camera11:Camera;
		public static var _camera12:Camera;
		public static var _camera13:Camera;
		
		public static var _cameraMount:Camera;
		public static var _cameraConiferous:Camera;
		
		public static var _cameraLoading:Camera;
		
		public static var _staticLayer:Camera;
		public static var _cameraStaticLayer1:Camera;
		public static var _dynamicLayer:Camera;
		
		public static var freePoint:Point = new Point(0, 0);
		
		public static var renderArea:Sprite = new Sprite();
		
		// render less, not renderless
		public static function renderLess():void {
			var c:Point = CameraUpdater.getCameraSection();
			renderArea.x = c.x;
			renderArea.y = c.y;
			if (PhysiVals.myTimer.currentCount % 10 == 0) { //25
				for each (var bitmap:Bitmap in Raster._levelPieces) {
					if (renderArea.getRect(_staticLayer).intersects(bitmap.getRect(_staticLayer))) {
						if (bitmap.visible == false) {
							bitmap.visible = true;
						}
					} else {
						if (bitmap.visible == true) {
							bitmap.visible = false;
						}
					}
				}
			}
		}
		
		public static function zoomCameras(section:Point):void {
			if (_camera) {
				_camera.zoomTo(section, 0.3); //0.9
				pLayer.zoomTo(section, 0.3);
				belowLayer.zoomTo(section, 0.3);
				_camera01.zoomTo(section, 1.2); //1/1.7
				_camera02.zoomTo(section, 1.2); //?
				_camera03.zoomTo(section, 1.2); //?
				_camera04.zoomTo(section, 1.2); //?
				_cameraMount.zoomTo(section, 1.2); //?
				_cameraConiferous.zoomTo(section, 1.2); //?
				//
				_camera11.zoomTo(new Point(section.x * 0.2, section.y * 0.2), 0.6); //?
				_camera12.zoomTo(new Point(section.x * 0.2, section.y * 0.2), 0.6); //?
				_camera13.zoomTo(new Point(section.x * 0.2, section.y * 0.2), 0.6); //?
			} else {
				throw new Error("can't zoom because there is no _camera");
			}
		}
		
		public static function init():void {
			initCameras();
			initChildren();
		}
		
		public static function initCameras():void {
			loadingScreen = new Sprite();
			menu = new Sprite();
			invisibleButtons = new Sprite();
			gui = new Sprite();
			nearLayers = new Sprite();
			belowLayer = new Camera(12);
			pLayer = new Camera(12);
			zeroLayer = new Sprite();
			farLayers = new Sprite();
			_camera01 = new Camera(1, 2);
			_camera02 = new Camera(1, 0.75);
			_camera03 = new Camera(1);
			_camera04 = new Camera(1, 0.5);
			_cameraConiferous = new Camera(1, 0.4);
			_cameraMount = new Camera(1, 0.3);//0.3
			_camera13 = new Camera(1);
			_camera12 = new Camera(1, 2);
			_camera11 = new Camera(1, 3);
			_camera = new Camera(12); //10
			_staticLayer = new Camera(1);
			_cameraStaticLayer1 = new Camera(1);
			_dynamicLayer = new Camera(1);
			
			initChildren();
		}
		
		private static function initChildren():void {
			_camera.addChild(_staticLayer);
			_camera.addChild(_cameraStaticLayer1);
			_camera.addChild(_dynamicLayer);
			farLayers.addChild(_camera13);
			farLayers.addChild(_camera12);
			farLayers.addChild(_camera11);
			farLayers.addChild(_cameraMount);
			farLayers.addChild(_cameraConiferous);
			farLayers.addChild(_camera04);
			farLayers.addChild(_camera02);
			farLayers.addChild(_camera03);
			farLayers.addChild(_camera01);
			zeroLayer.addChild(_camera);
			//menu.addChild(LevelSelectionMC.getInstance());
			Platformer.thisIs.addChild(farLayers); //farLayers.visible = false;
			Platformer.thisIs.addChild(zeroLayer); //zeroLayer.visible = false;
			Platformer.thisIs.addChild(pLayer);
			Platformer.thisIs.addChild(belowLayer); //belowLayer.visible = false;
			Platformer.thisIs.addChild(nearLayers); //nearLayers.visible = false;
			Platformer.thisIs.addChild(gui);
			Platformer.thisIs.addChild(invisibleButtons);
			Platformer.thisIs.addChild(menu);
			Platformer.thisIs.addChild(loadingScreen);
			/*
			var rectangleInOldStyle:Sprite = new Sprite();
			rectangleInOldStyle.graphics.beginFill(0xFF9C6C);
			rectangleInOldStyle.blendMode = BlendMode.DIFFERENCE;
			rectangleInOldStyle.graphics.drawRect( -200, -200, 1000, 1000);
			rectangleInOldStyle.graphics.endFill();
			this.addChild(rectangleInOldStyle);
			*/
			renderArea.graphics.drawRect(-960, -720, 1920, 1440);
			_dynamicLayer.addChild(renderArea);
		}
		
		public static function cleanCameras():void {
			/*
			cleanLayer(CameraManager.bigCloud1);
			cleanLayer(CameraManager.bigCloud2);
			cleanLayer(CameraManager.bigCloud3);
			cleanLayer(CameraManager.coniferous);
			cleanLayer(CameraManager.fon);
			cleanLayer(CameraManager.fon2);
			cleanLayer(CameraManager.fon3);
			cleanLayer(CameraManager.fon4);
			cleanLayer(CameraManager.funkyMountains);
			cleanLayer(CameraManager.invisibleButtons);
			cleanLayer(CameraManager.loadingScreen);
			//cleanLayer(CameraManager.menu);
			cleanLayer(CameraManager.nearLayers);
			cleanLayer(CameraManager.farLayers);
			cleanLayer(CameraManager.zeroLayer);*/
			cleanLayer(belowLayer);
			cleanLayer(pLayer);
			cleanLayer(gui);
			cleanLayer(_camera01);
			cleanLayer(_camera02);
			cleanLayer(_camera03);
			cleanLayer(_camera04);
			cleanLayer(_camera11);
			cleanLayer(_camera12);
			cleanLayer(_camera13);
			cleanLayer(_staticLayer);
			cleanLayer(_cameraStaticLayer1);
			cleanLayer(_dynamicLayer);
			//cleanLayer(CameraManager._camera);
			cleanLayer(_cameraConiferous);
			cleanLayer(_cameraLoading);
			cleanLayer(_cameraMount);
		}
		
		private static function cleanLayer(layer:DisplayObjectContainer):void {
			if (layer != null) {
				var k:int;
				while (layer.numChildren) {	
					k = layer.numChildren - 1;
					if (layer.getChildAt(k) is Bitmap) {
						Bitmap(layer.getChildAt(k)).bitmapData.dispose();
					}
					if (layer.getChildAt(k) is DisplayObjectContainer) {
						cleanLayer(DisplayObjectContainer(layer.getChildAt(k)));
					}
					layer.removeChildAt(k);
				}
			}
		}
	}
}
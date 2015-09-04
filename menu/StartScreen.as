package {
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class StartScreen extends MovieClip {
		private var nameLogo:MovieClip;
		private var next:MovieClip;
		private var muteLayer:MovieClip;
		private var hatzLayer:MovieClip;
		private var clouds:CloudsBG;
		private var sponsor:MovieClip;
		private var mute:CheckBox;
		private var hats:HatsFalling;
		
		public function StartScreen() {
			CameraManager.loadingScreen.addChild(this);
			addClouds();
			addHats();
			addName();
			addNext();
			addMute();
			addSponsor();
		}
		
		private function addClouds():void {
			clouds = new CloudsBG();
			clouds.add();
			clouds.setIn();
			addChild(clouds);
		}
		
		private function addName():void {
			nameLogo = new name_logo();
			nameLogo.x = 320;
			nameLogo.y = 200;
			nameLogo.scaleX = 3;
			nameLogo.scaleY = nameLogo.scaleX;
			addChild(nameLogo);
		}
		
		private function addNext():void {
			next = new button_next();
			next.x = 330;
			next.y = 400;
			next.scaleX = 0.5;
			next.scaleY = next.scaleX;
			addChild(next);
			next.addEventListener(MouseEvent.CLICK, startGame);
		}
		
		private function startGame(e:MouseEvent):void {
			HatsFalling.maxHats = 1;
			nameLogo.parent.removeChild(nameLogo);
			next.parent.removeChild(next);
			muteLayer.parent.removeChild(muteLayer);
			hatzLayer.parent.removeChild(hatzLayer);
			hats.stop();
			hats.remove();
			clouds.remove();
			clouds.parent.removeChild(clouds);
			sponsor.parent.removeChild(sponsor);
			mute.hide();
			Platformer.startGame();
		}
		
		private function addMute():void {
			muteLayer = new MovieClip();
			muteLayer.scaleX = 0.5;
			muteLayer.scaleY = muteLayer.scaleX;
			muteLayer.x = 320;
			muteLayer.y = 280;
			addChild(muteLayer);
			mute = new CheckBox(muteLayer, 0, 0, "Play muted");
			mute.itemText.addEventListener(MouseEvent.CLICK, muteClick);
			mute.itemShadow.addEventListener(MouseEvent.CLICK, muteClick);
		}
		
		private function muteClick(e:MouseEvent):void {
			mute.change(null);
		}
		
		private function addHats():void {
			hatzLayer = new MovieClip();
			hatzLayer.rotation = 180;
			hatzLayer.x = 640;
			hatzLayer.y = 480;
			hats = new HatsFalling(hatzLayer);
			addChild(hatzLayer);
		}
		
		private function addSponsor():void {
			sponsor = new sponsors_logo();
			sponsor.x = 520;
			sponsor.y = 400;
			addChild(sponsor);
			sponsor.addEventListener(MouseEvent.CLICK, sponsorClick);
		}
		
		private function sponsorClick(e:MouseEvent):void {
			HatsFalling.maxHats = 10;
		}
	}
}
package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class MainMenu extends MovieClip {
		private var menu:MenuList;
		private var escapeMenu:MenuList;
		private var currentMenu:MenuList; // active - main or escape menu 
		
		private var hats:HatsFalling;
		private var achievementSection:AchievementsSection;
		
		public var completedLayer:MovieClip;
		public var menuLayer:MovieClip;
		public var hatzLayer:MovieClip;
		public var settingsLayer:MovieClip;
		public var achievementsLayer:MovieClip;
		public var creditsLayer:MovieClip;
		
		public var clouds:CloudsBG;
		public var carbonLayer:MovieClip;
		
		public var carbonMenu:CarbonMenu;
		public var settings:Settings;
		public var credits:Credits;
		
		private var showed:Boolean = true;
		
		public static var thisIs:MainMenu;
		
		public function MainMenu(parent:DisplayObjectContainer) {
			thisIs = this;
			carbonLayer = new MovieClip();
			completedLayer = new MovieClip();
			settingsLayer = new MovieClip();
			achievementsLayer = new MovieClip();
			creditsLayer = new MovieClip();
			
			clouds = new CloudsBG();
			clouds.add();
			clouds.setIn();
			
			hatzLayer = new MovieClip();
			hatzLayer.rotation = 180;
			hatzLayer.x = 640;
			hatzLayer.y = 480;
			//hatzLayer.visible = false;
			hats = new HatsFalling(hatzLayer);
			hats.stop();
			
			menuLayer = new MovieClip();
			menu = new MenuList(menuLayer);
			menu.initAsMainMenu(toLevelSelect, toSettings, achieve, toCredits);
			menu.show();
			escapeMenu = new MenuList(menuLayer);
			escapeMenu.initAsEscapeMenu(resume, toSettings, achieve, resume, fromEscapeToMain);
			escapeMenu.hide();
			currentMenu = menu;
			
			addChild(carbonLayer);
			addChild(clouds);
			addChild(creditsLayer);
			addChild(achievementsLayer);
			addChild(settingsLayer);
			addChild(hatzLayer);
			addChild(menuLayer);
			addChild(completedLayer);
			parent.addChild(this);
		}
		
		public function onEscape():void {
			if (showed) {
				resume(null);
				Platformer.activation(null);
			} else {
				pause();
				Platformer.deactivation(null);
			}
		}
		
		public function pause():void {
			menu.hide();
			clouds.appear(escapeMenu.show);
			currentMenu = escapeMenu;
			showed = true;
		}
		
		public function resume(e:MouseEvent):void {
			escapeMenu.hide();
			clouds.disappear();
			showed = false;
		}
		
		public function achieve(e:MouseEvent):void {
			achievementsLayer.visible = true;
			hats.stop();
			currentMenu.hide();
			if (!achievementSection) {
				achievementSection = new AchievementsSection(achievementsLayer);
				getStage().addEventListener(KeyboardEvent.KEY_DOWN, achievementSection.control);
			} else {
				achievementsLayer.visible = true;
				getStage().addEventListener(KeyboardEvent.KEY_DOWN, achievementSection.control);
			}
			ButtonBack.show(achievementsLayer, fromAchievementsToMain);
		}
		
		public function toCredits(e:MouseEvent):void {
			hats.stop();
			currentMenu.hide();
			creditsLayer.visible = true;
			if (credits) {
				credits.show();
			} else {
				credits = new Credits(creditsLayer);
			}
			ButtonBack.show(credits, fromCreditsToMain);
		}
		
		public function complete(e:MouseEvent):void {
			completedLayer.visible = true;
			hats.stop();
			currentMenu.hide();
			new CompletedScreen(completedLayer);
		}
		
		public function toSettings(e:MouseEvent):void {
			hats.stop();
			currentMenu.hide();
			new AchievementUnlocked(this);
			if (settings) {
				settings.show();
			} else {	
				settings = new Settings(settingsLayer);
			}
			ButtonBack.show(settingsLayer, fromSettingsToMain);
			settings.allowControls();
		}
		
		public function toLevelSelect(e:MouseEvent):void {
			clouds.disappear();
			hats.stop();
			currentMenu.hide();
			if (carbonMenu) {
				carbonMenu.show();
			} else {
				carbonMenu = new CarbonMenu(carbonLayer);
			}
			ButtonBack.show(carbonLayer, toMainMenu);
		}
		
		public function fromEscapeToMain(e:MouseEvent):void {
			escapeMenu.hide();
			menu.show();
			hats.drop();
			currentMenu = menu;
			ButtonBack.hide();
		}
		
		public function fromSettingsToMain(e:MouseEvent):void {
			settings.hide();
			settings.disallowControls();
			if (currentMenu == menu) {	
				hats.drop();
			}
			currentMenu.show();
			ButtonBack.hide();
		}
		
		public function fromAchievementsToMain(e:MouseEvent):void {
			achievementsLayer.visible = false;
			getStage().removeEventListener(KeyboardEvent.KEY_DOWN, achievementSection.control);
			if (currentMenu == menu) {	
				hats.drop();
			}
			currentMenu.show();
			ButtonBack.hide();
		}
		
		public function fromCreditsToMain(e:MouseEvent):void {
			credits.hide();
			hats.drop();
			menu.show();
			ButtonBack.hide();
		}
		
		public function toMainMenu(e:MouseEvent):void {
			hats.drop();
			currentMenu.show();
			if (carbonMenu) {
				carbonMenu.disallowControls();
				clouds.appear(carbonMenu.hide);
			} else {
				clouds.appear();
			}
			if (settings) {
				settings.hide();
			}
			ButtonBack.hide();
		}
		
		public static function getStage():Stage {
			return Platformer.thisIs.stage;
		}
	}
}
package {
	import flash.text.Font;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class MyFont {
		[Embed(source="c:/windows/fonts/Kavoon-Regular.ttf",fontFamily="Kavoon",embedAsCFF="false")]
		public static var font:Class;
		
		public function MyFont() {
			Font.registerFont(font);
			//var allFonts:Array = Font.enumerateFonts(true);
			//allFonts.sortOn("fontName", Array.CASEINSENSITIVE);
			//Font.registerFont(Geisha_ttf);
			//смотрим ембеденные фонты
			//var embeddedFonts:Array = Font.enumerateFonts(false);
			//embeddedFonts.sortOn("fontName", Array.CASEINSENSITIVE);
			//trace(embeddedFonts);
		}
	}
}
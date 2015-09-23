package {
	import flash.net.SharedObject;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class BigXML {
		
		public static var levels:XML;
		public static var saveDataObject:SharedObject = SharedObject.getLocal("Watermelon");
		
		public static function getStr(name:String):XML {
			switch (name) {
				case "1-1":
					return get1_1();
				break;
				case "1-2":
					return get1_2();
				break;
				case "1-3":
					return get1_3();
				break;
				case "2-1":
					return get2_1();
				break;
				case "2-2":
					return get2_2();
				break;
				case "2-3":
					return get2_3();
				break;
				case "3-1":
					return get3_1();
				break;
				case "3-2":
					return get3_2();
				break;
				case "3-3":
					return get3_3();
				break;
				case "4-1":
					return get4_1();
				break;
				case "4-2":
					return get4_2();
				break;
				case "4-3":
					return get4_3();
				break;
				case "5-1":
					return get5_1();
				break;
				case "5-2":
					return get5_2();
				break;
				case "5-3":
					return get5_3();
				break;
				case "6-1":
					return get6_1();
				break;
				case "6-2":
					return get6_2();
				break;
				case "6-3":
					return get6_3();
				break;
				case "7-1":
					return get7_1();
				break;
				case "7-2":
					return get7_2();
				break;
				case "7-3":
					return get7_3();
				break;
				case "8-1":
					return get8_1();
				break;
				case "8-2":
					return get8_2();
				break;
				case "8-3":
					return get8_3();
				break;
			}
			return null;
		}
		
		public static function save():void {
			CarbonMenu.levelList.save();
			saveDataObject.data.levels = levels; // set the saved score to the current score
			saveDataObject.flush();
		}
	
/*var saveDataObject:SharedObject;	
     saveDataObject.data.savedScore = currentScore; // set the saved score to the current score
     saveDataObject.flush(); // immediately save to the local drive
     trace(saveDataObject.size); // this will show the size of the save file, in bytes
 
     currentScore = saveDataObject.data.savedScore;*/
		public static function getInfo():XML {
			if (saveDataObject.data.hasOwnProperty("levels")) {
				return saveDataObject.data.levels;
			}
			return new XML(<levelsInfo>
  <levels>
    <row>
      <level>
        <fileName>1-1</fileName>
        <levelName>Intro</levelName>
        <comment>Hello, World!</comment>
		<state>1</state>
      </level>
      <level>
        <fileName>1-2</fileName>
        <levelName>Forward</levelName>
        <comment>Complete level 1-1 to unlock</comment>
		<state>2</state>
      </level>
      <level>
        <fileName>6-3</fileName>
        <levelName>Rocketman</levelName>
        <comment>Complete level 6-2 to unlock</comment>
		<state>2</state>
      </level>
    </row>
    <row>
      <level>
        <fileName>2-2</fileName>
        <levelName>Super Springbush</levelName>
        <comment>Complete level 2-1 to unlock</comment>
		<state>2</state>
      </level>
      <level>
        <fileName>2-3</fileName>
        <levelName>The Cave</levelName>
        <comment>Complete level 2-2 to unlock</comment>
		<state>2</state>
      </level>
      <level>
        <fileName>3-1</fileName>
        <levelName>Bubbles Mining</levelName>
        <comment>Complete level 2-3 to unlock</comment>
		<state>2</state>
      </level>
    </row>
    <row>
      <level>
        <fileName>3-3</fileName>
        <levelName>Hills</levelName>
        <comment>Complete level 3-2 to unlock</comment>
		<state>2</state>
      </level>
      <level>
        <fileName>3-2</fileName>
        <levelName>Underground</levelName>
        <comment>Complete level 3-1 to unlock</comment>
		<state>2</state>
      </level>
      <level>
        <fileName>2-1</fileName>
        <levelName>Springbush Pit</levelName>
        <comment>Complete level 1-3 to unlock</comment>
		<state>2</state>
      </level>
    </row>
    <row>
      <level>
        <fileName>4-1</fileName>
        <levelName>Walljump</levelName>
        <comment>Complete level 3-3 to unlock</comment>
		<state>2</state>
      </level>
      <level>
        <fileName>4-2</fileName>
        <levelName>The Bottom</levelName>
        <comment>Complete level 4-1 to unlock</comment>
		<state>2</state>
      </level>
      <level>
        <fileName>4-3</fileName>
        <levelName>Don't look down</levelName>
        <comment>Complete level 4-2 to unlock</comment>
		<state>2</state>
      </level>
    </row>
    <row>
      <level>
        <fileName>5-1</fileName>
        <levelName>Collector</levelName>
        <comment>Complete level 4-3 to unlock</comment>
		<state>2</state>
      </level>
      <level>
        <fileName>5-2</fileName>
        <levelName>Spikes</levelName>
        <comment>Complete level 5-1 to unlock</comment>
		<state>2</state>
      </level>
      <level>
        <fileName>5-3</fileName>
        <levelName>Fresh Air</levelName>
        <comment>Complete level 5-2 to unlock</comment>
		<state>2</state>
      </level>
    </row>
    <row>
      <level>
        <fileName>6-1</fileName>
        <levelName>Joyride</levelName>
        <comment>Complete level 5-3 to unlock</comment>
		<state>2</state>
      </level>
      <level>
        <fileName>6-2</fileName>
        <levelName>Guideline</levelName>
        <comment>Complete level 6-1 to unlock</comment>
		<state>2</state>
      </level>
      <level>
        <fileName>1-3</fileName>
        <levelName>Twisted</levelName>
        <comment>Complete level 1-2 to unlock</comment>
		<state>2</state>
      </level>
    </row>
    <row>
      <level>
        <fileName>7-1</fileName>
        <levelName>Deep</levelName>
        <comment>Complete level 6-3 to unlock</comment>
		<state>2</state>
      </level>
      <level>
        <fileName>7-2</fileName>
        <levelName>Hardester</levelName>
        <comment>Complete level 7-1 to unlock</comment>
		<state>2</state>
      </level>
      <level>
        <fileName>7-3</fileName>
        <levelName>Deeper</levelName>
        <comment>Complete level 7-2 to unlock</comment>
		<state>2</state>
      </level>
    </row>
    <row>
      <level>
        <fileName>8-1</fileName>
        <levelName>Deepest</levelName>
        <comment>Complete level 7-3 to unlock</comment>
		<state>2</state>
      </level>
      <level>
        <fileName>8-2</fileName>
        <levelName>House</levelName>
        <comment>Complete level 8-1 to unlock</comment>
		<state>2</state>
      </level>
      <level>
        <fileName>8-3</fileName>
        <levelName>Spiral</levelName>
        <comment>Complete level 8-2 to unlock</comment>
		<state>2</state>
      </level>
    </row>
  </levels>
</levelsInfo>);
		}
		
		private static function get1_1():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="4">Standard</Standard>
    <Standard x="200" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="4">Standard</Standard>
    <Standard x="360" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="5">Standard</Standard>
    <Standard x="420" y="10" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="6">Standard</Standard>
    <Standard x="520" y="-50" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="7">Standard</Standard>
    <Standard x="-200" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="-200" y="-520" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="800" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="25" h="26">Standard</Standard>
    <EndLevel x="732" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="760" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <TutorialBoard x="30" y="-115" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TutorialBoard</TutorialBoard>
    <TreeBelow x="-140" y="-145" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeBelow</TreeBelow>
    <Standard x="720" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="10">Standard</Standard>
  </platforms>
  <collectables>
    <BubbleBonus x="535.6958887500003" y="-89.20435944444449">BubbleBonus</BubbleBonus>
    <BubbleBonus x="358.4055795833336" y="-46.81663097222226">BubbleBonus</BubbleBonus>
    <BubbleBonus x="200" y="-40">BubbleBonus</BubbleBonus>
    <DiamondBonus x="-140" y="-80">DiamondBonus</DiamondBonus>
    <DiamondBonus x="740" y="-180">DiamondBonus</DiamondBonus>
    <DiamondBonus x="780" y="-200">DiamondBonus</DiamondBonus>
    <BubbleBonus x="760" y="-140">BubbleBonus</BubbleBonus>
  </collectables>
  <characters>
    <Player x="2" y="-2">Player</Player>
  </characters>
  <spawn>
    <x>2</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get1_2():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="200" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="400" y="0" angle="-10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="5">Standard</Standard>
    <Standard x="700" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="5">Standard</Standard>
    <Standard x="840" y="-60" angle="10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="1120" y="-20" angle="-10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <JumpThrough x="1040" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="1000" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <SpringBush x="1060" y="115" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="1320" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="5">Standard</Standard>
    <Standard x="1460" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="1660" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="5">Standard</Standard>
    <Standard x="1740" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="5">Standard</Standard>
    <Standard x="1820" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="5">Standard</Standard>
    <Standard x="1900" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="5">Standard</Standard>
    <Standard x="1980" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="9" h="5">Standard</Standard>
    <Standard x="2160" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="2320" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="2260" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="25" h="5">Standard</Standard>
    <Standard x="2440" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="2580" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="3">Standard</Standard>
    <Standard x="2740" y="-40" angle="-10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="5">Standard</Standard>
    <Standard x="3040" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="3120" y="-80" angle="-10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="3320" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="3520" y="-140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="3540" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="3580" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="3640" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="3780" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="2">Standard</Standard>
    <Standard x="3720" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="5">Standard</Standard>
    <Standard x="4060" y="-40" angle="-10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="10">Standard</Standard>
    <Standard x="4360" y="-100" angle="10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="10">Standard</Standard>
    <Standard x="4640" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="4840" y="-600" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="40">Standard</Standard>
    <EndLevel x="4672" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="4700" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <GroundZero x="990" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="9">GroundZero</GroundZero>
    <GroundZero x="690" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="3">GroundZero</GroundZero>
    <GroundZero x="1300" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="4">GroundZero</GroundZero>
    <GroundZero x="2260" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">GroundZero</GroundZero>
    <GroundZero x="2360" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="3">GroundZero</GroundZero>
    <GroundZero x="2450" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6.5" h="3">GroundZero</GroundZero>
    <GroundZero x="2660" y="-60" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="3">GroundZero</GroundZero>
    <TreeZero x="2300" y="-190" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeZero x="2420" y="-190" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeBelow x="2580" y="-185" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeBelow</TreeBelow>
    <GroundZero x="3720" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="19" h="5">GroundZero</GroundZero>
    <TutorialSponsor x="230" y="-95" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TutorialSponsor</TutorialSponsor>
    <TreeZero x="4750" y="-85" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
  </platforms>
  <collectables>
    <DiamondBonus x="1100" y="100">DiamondBonus</DiamondBonus>
    <DiamondBonus x="1040" y="80">DiamondBonus</DiamondBonus>
    <DiamondBonus x="1080" y="80">DiamondBonus</DiamondBonus>
    <BubbleBonus x="1040" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1100" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1120" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="600" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="720" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="840" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1120" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1460" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1480" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1700" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1740" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1780" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1840" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1880" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1940" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2280" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2280" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2420" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2540" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2520" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2560" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2720" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2680" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3060" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3300" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3300" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3340" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3760" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3820" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4040" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3940" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3900" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4000" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4040" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4780" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4780" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4820" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4820" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4800" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4800" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4820" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4800" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4780" y="-40">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>2</x>
    <y>-6</y>
  </spawn>
</actors>);
		}
		
		private static function get1_3():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="200" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="400" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="9" h="5">Standard</Standard>
    <Standard x="580" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="10">Standard</Standard>
    <Standard x="740" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="5">Standard</Standard>
    <Standard x="880" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="10">Standard</Standard>
    <Standard x="1000" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="1100" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="13">Standard</Standard>
    <Standard x="1180" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="5">Standard</Standard>
    <Standard x="1240" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="15">Standard</Standard>
    <Standard x="1280" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="5">Standard</Standard>
    <Standard x="1320" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="15">Standard</Standard>
    <Standard x="1360" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="5">Standard</Standard>
    <Standard x="1420" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="15">Standard</Standard>
    <Standard x="1460" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="5">Standard</Standard>
    <Standard x="1540" y="-100" angle="5" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="10">Standard</Standard>
    <Standard x="1640" y="-80" angle="7" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="10">Standard</Standard>
    <Standard x="1540" y="80" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="18" h="5">Standard</Standard>
    <Standard x="1740" y="-40" angle="10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="10">Standard</Standard>
    <Standard x="1840" y="0" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="10">Standard</Standard>
    <Standard x="1940" y="60" angle="29.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="10">Standard</Standard>
    <Standard x="1880" y="220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="12" h="10">Standard</Standard>
    <Standard x="2120" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="40">Standard</Standard>
    <EndLevel x="2012" y="200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="2040" y="220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <GroundZero x="380" y="-25" angle="-10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">GroundZero</GroundZero>
    <GroundZero x="720" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">GroundZero</GroundZero>
    <GroundZero x="1000" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="4">GroundZero</GroundZero>
    <GroundZero x="1180" y="-80" angle="10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="50" h="15">GroundZero</GroundZero>
  </platforms>
  <collectables>
    <BubbleBonus x="420" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="460" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="540" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="560" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="820" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="860" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="860" y="-80">BubbleBonus</BubbleBonus>
    <DiamondBonus x="940" y="-80">DiamondBonus</DiamondBonus>
    <BubbleBonus x="1040" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1040" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1200" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1200" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1300" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1300" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1300" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1380" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1580" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1780" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1760" y="140">BubbleBonus</BubbleBonus>
    <DiamondBonus x="1840" y="160">DiamondBonus</DiamondBonus>
    <DiamondBonus x="2100" y="180">DiamondBonus</DiamondBonus>
    <BubbleBonus x="1960" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1920" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2060" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2060" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2040" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2000" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2080" y="20">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>7</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get2_1():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="200" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="600" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <SpringBush x="520" y="15" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="400" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <SpringBush x="700" y="-65" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="800" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="4">Standard</Standard>
    <Standard x="1000" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="4">Standard</Standard>
    <Standard x="1080" y="-120" angle="90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="2">Standard</Standard>
    <Standard x="1200" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="10">Standard</Standard>
    <SpringBush x="1140" y="115" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="900" y="35" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1105" y="-60" angle="90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="1300" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="4">Standard</Standard>
    <Standard x="1420" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <SpringBush x="1360" y="-5" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="1720" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="1620" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="13" h="1">Standard</Standard>
    <Standard x="1880" y="-140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="14">Standard</Standard>
    <SpringBush x="1850" y="60" angle="-45" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1750" y="-20" angle="45" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1850" y="-100" angle="-45" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="1980" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="4">Standard</Standard>
    <Standard x="2360" y="-220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2560" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="2640" y="-360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="2720" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="2800" y="-200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="3000" y="-220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="3140" y="-360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="25">Standard</Standard>
    <Standard x="2980" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="1">Standard</Standard>
    <Standard x="2980" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="8">Standard</Standard>
    <EndLevel x="3052" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="3080" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <Standard x="3320" y="-860" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <SpringBush x="3045" y="-220" angle="90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3045" y="-180" angle="90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3045" y="-120" angle="90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3045" y="-80" angle="90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3045" y="-40" angle="90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3115" y="-200" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3115" y="-160" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3115" y="-100" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3115" y="-60" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3115" y="-20" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2200" y="-160" angle="-29.999999999999996" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2255" y="-190" angle="-29.999999999999996" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2305" y="-220" angle="-29.999999999999996" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="2180" y="-120" angle="-29.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <SpringBush x="2535" y="-240" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2615" y="-320" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1755" y="-140" angle="45" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <GroundZero x="1620" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="10">GroundZero</GroundZero>
    <GroundZero x="800" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="10">GroundZero</GroundZero>
    <GroundZero x="3000" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="20">GroundZero</GroundZero>
    <TreeZero x="2640" y="-485" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
  </platforms>
  <collectables>
    <BubbleBonus x="540" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="700" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="740" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1040" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1780" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1840" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1840" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1740" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1780" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2160" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2220" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2280" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2380" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2580" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2740" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2820" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3060" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3080" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3100" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3080" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3060" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3080" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2680" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2660" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2720" y="-420">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>7</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get2_2():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="200" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="300" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="500" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="600" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <SpringBush x="210" y="15" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="270" y="15" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="240" y="15" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="510" y="35" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="540" y="35" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="570" y="35" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="780" y="-25" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="920" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="800" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="860" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="2">Standard</Standard>
    <SpringBush x="820" y="15" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="1120" y="-80" angle="10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="5">Standard</Standard>
    <Standard x="1255" y="-55" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="1345" y="-20" angle="29.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <SpringBush x="1380" y="-30" angle="29.999999999999996" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1420" y="-5" angle="29.999999999999996" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1345" y="-50" angle="29.999999999999996" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="1580" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="1380" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="1780" y="0" angle="-29.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="2000" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <SpringBush x="1940" y="-120" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="2280" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="2">Standard</Standard>
    <Standard x="2360" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="2200" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="5">Standard</Standard>
    <Standard x="2480" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="7">Standard</Standard>
    <Standard x="2540" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="2600" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="8">Standard</Standard>
    <Standard x="2600" y="80" angle="-10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="2680" y="40" angle="-20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="2840" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="2660" y="-340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="2780" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="6">Standard</Standard>
    <Standard x="2860" y="-300" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="2900" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="3100" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="3300" y="-700" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="40">Standard</Standard>
    <EndLevel x="3232" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="3260" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <SpringBush x="3275" y="-100" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3275" y="-130" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3275" y="-160" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2180" y="-40" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2320" y="-85" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2400" y="-145" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2440" y="-85" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2520" y="-205" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2560" y="-145" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2620" y="-285" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2700" y="-365" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2800" y="-365" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3040" y="-260" angle="20" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2300" y="55" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2400" y="55" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2500" y="55" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2360" y="5" angle="180" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2460" y="5" angle="180" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2800" y="15" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3060" y="-5" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3160" y="-45" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <GroundZero x="1380" y="40" angle="-10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="6">GroundZero</GroundZero>
    <GroundZero x="2200" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="10">GroundZero</GroundZero>
    <GroundZero x="2600" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="35" h="17">GroundZero</GroundZero>
    <TutorialDown x="400" y="-110" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TutorialDown</TutorialDown>
    <TutorialUp x="640" y="-110" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TutorialUp</TutorialUp>
  </platforms>
  <collectables>
    <BubbleBonus x="1460" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1480" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1520" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1560" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1560" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1520" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="880" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2340" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2240" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2460" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2500" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2560" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2800" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2880" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2920" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2960" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2920" y="-20">BubbleBonus</BubbleBonus>
    <DiamondBonus x="3260" y="-220">DiamondBonus</DiamondBonus>
    <DiamondBonus x="2620" y="-80">DiamondBonus</DiamondBonus>
    <DiamondBonus x="2460" y="-340">DiamondBonus</DiamondBonus>
    <BubbleBonus x="2320" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2460" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2540" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2580" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2640" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2720" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2940" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3020" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3160" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="540" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="580" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="520" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="560" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="540" y="-160">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>7</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get2_3():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="25" h="5">Standard</Standard>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="200" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="2">Standard</Standard>
    <Standard x="240" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="2">Standard</Standard>
    <Standard x="280" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="500" y="0" angle="-10.000000000000004" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="600" y="-18" angle="-20.000000000000007" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="5">Standard</Standard>
    <Standard x="655" y="-37" angle="-29.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="5">Standard</Standard>
    <Standard x="705" y="-60" angle="-45" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="5">Standard</Standard>
    <Standard x="750" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10.5" h="5">Standard</Standard>
    <SpringBush x="175" y="-20" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="215" y="-60" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="255" y="-100" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="345" y="-120" angle="90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="385" y="-80" angle="90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="425" y="-40" angle="90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="960" y="-160" angle="45" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="1260" y="-160" angle="-45" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="1100" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="1120" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="1160" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="1220" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="3">Standard</Standard>
    <Standard x="1260" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="1470" y="-230" angle="29.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="1640" y="-130" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="1820" y="-60" angle="10.000000000000004" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="2015" y="-25" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10.25" h="5">Standard</Standard>
    <Standard x="2220" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="2420" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="6">Standard</Standard>
    <Standard x="2540" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="18">Standard</Standard>
    <Standard x="2620" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="5">Standard</Standard>
    <Standard x="2740" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="8">Standard</Standard>
    <Standard x="3020" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="2940" y="-340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="3220" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="3140" y="-380" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="3340" y="-400" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="3420" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="3620" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="3720" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="3820" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="5">Standard</Standard>
    <Standard x="3880" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="4080" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="3940" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="4180" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="4280" y="-140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="10">Standard</Standard>
    <Standard x="4180" y="-220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="4">Standard</Standard>
    <Standard x="4380" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="2">Standard</Standard>
    <Standard x="4380" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="4580" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="14">Standard</Standard>
    <Standard x="4680" y="-600" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="18">Standard</Standard>
    <EndLevel x="4452" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="4480" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <SpringBush x="4065" y="-160" angle="90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="4065" y="-120" angle="90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="4065" y="-80" angle="90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="4265" y="-220" angle="90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="4265" y="-180" angle="90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="4440" y="-195" angle="180" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="4480" y="-195" angle="180" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="4520" y="-195" angle="180" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="4560" y="-195" angle="180" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="4400" y="-195" angle="180" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="4540" y="-25" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="4400" y="-25" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1000" y="-155" angle="45" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1040" y="-115" angle="45" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1080" y="-75" angle="45" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1230" y="-145" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2140" y="-50" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2445" y="-80" angle="90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2760" y="-45" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2880" y="-45" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2980" y="-45" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3140" y="-115" angle="180" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3180" y="-155" angle="180" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="3240" y="-155" angle="180" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <GroundZero x="960" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="8">GroundZero</GroundZero>
    <GroundBelow x="2540" y="-200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="14">GroundBelow</GroundBelow>
    <GroundZero x="4380" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="15">GroundZero</GroundZero>
    <TreeBelow x="2340" y="-205" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeBelow</TreeBelow>
    <TreeZero x="2240" y="-210" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeBelow x="3620" y="-165" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeBelow</TreeBelow>
    <GroundZero x="3820" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="18" h="5">GroundZero</GroundZero>
    <GroundZero x="4200" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="4">GroundZero</GroundZero>
  </platforms>
  <collectables>
    <BubbleBonus x="180" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="460" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="540" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="640" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="700" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1120" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1180" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1440" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1480" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1520" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1580" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1640" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1740" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1900" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2200" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2520" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2760" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2880" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2980" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3200" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3620" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3660" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3700" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3900" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3960" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4020" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4180" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4240" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4420" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4520" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4440" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4560" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4540" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="4400" y="-60">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>7</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get3_1():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="5">Standard</Standard>
    <Standard x="0" y="-400" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="20">Standard</Standard>
    <JumpThrough x="400" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="400" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="460" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <JumpThrough x="660" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="820" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="720" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="760" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="9">Standard</Standard>
    <Standard x="660" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="11" h="3">Standard</Standard>
    <Standard x="880" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <JumpThrough x="1080" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="1140" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="4">Standard</Standard>
    <Standard x="1080" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="4">Standard</Standard>
    <Standard x="1180" y="180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="2">Standard</Standard>
    <Standard x="1260" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="7">Standard</Standard>
    <Standard x="1360" y="180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="10">Standard</Standard>
    <Standard x="1420" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="2">Standard</Standard>
    <JumpThrough x="1560" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1560" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1560" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1560" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1560" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="1660" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="2">Standard</Standard>
    <Standard x="1860" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="1920" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="2">Standard</Standard>
    <Standard x="1760" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="2">Standard</Standard>
    <Standard x="1820" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="1900" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="4">Standard</Standard>
    <Standard x="2000" y="-140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="1800" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="2">Standard</Standard>
    <Standard x="1700" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="2">Standard</Standard>
    <Standard x="1980" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="2040" y="-360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="5">Standard</Standard>
    <Standard x="2100" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="7">Standard</Standard>
    <Standard x="2020" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="23" h="1">Standard</Standard>
    <Standard x="2260" y="-220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="7">Standard</Standard>
    <Standard x="2400" y="-480" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="20">Standard</Standard>
    <Standard x="2200" y="-620" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="14" h="1">Standard</Standard>
    <JumpThrough x="2180" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2320" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2320" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2320" y="-320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2320" y="-420" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2420" y="-480" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2420" y="-400" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2420" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2420" y="-200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2420" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="2480" y="-620" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="19">Standard</Standard>
    <Standard x="2480" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="2560" y="-320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="4">Standard</Standard>
    <JumpThrough x="2500" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2620" y="-380" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="2500" y="-480" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="5">Standard</Standard>
    <Standard x="2680" y="-480" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="5">Standard</Standard>
    <Standard x="2620" y="-540" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <JumpThrough x="2760" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="2820" y="-380" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="10">Standard</Standard>
    <Standard x="2720" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="2640" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="3">Standard</Standard>
    <JumpThrough x="2660" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="2500" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="11" h="4">Standard</Standard>
    <Standard x="2720" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="2">Standard</Standard>
    <Standard x="2820" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="10">Standard</Standard>
    <Standard x="2340" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="3">Standard</Standard>
    <Standard x="2260" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="5">Standard</Standard>
    <Standard x="2160" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="2000" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="7">Standard</Standard>
    <Standard x="2260" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="8">Standard</Standard>
    <Standard x="2000" y="280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="13" h="1">Standard</Standard>
    <JumpThrough x="2100" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <EndLevel x="2092" y="260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="2120" y="280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <SpringBush x="1940" y="35" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1820" y="-65" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1720" y="-145" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1580" y="-185" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2120" y="-305" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="1540" y="-460" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="20">Standard</Standard>
    <GroundZero x="400" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">GroundZero</GroundZero>
    <GroundZero x="660" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="11" h="4">GroundZero</GroundZero>
    <GroundZero x="1080" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="9" h="11">GroundZero</GroundZero>
    <GroundZero x="1560" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="23">GroundZero</GroundZero>
    <GroundZero x="1860" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="15">GroundZero</GroundZero>
    <GroundZero x="1280" y="120" angle="-45" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="18" h="15">GroundZero</GroundZero>
    <GroundZero x="2020" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="25" h="18">GroundZero</GroundZero>
    <GroundZero x="2720" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="7">GroundZero</GroundZero>
    <GroundZero x="2500" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="17" h="13">GroundZero</GroundZero>
    <GroundZero x="2660" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="4">GroundZero</GroundZero>
    <GroundZero x="2260" y="-620" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="11" h="28">GroundZero</GroundZero>
    <GroundZero x="2140" y="-220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="8">GroundZero</GroundZero>
    <TreeZero x="940" y="-130" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeBelow x="1140" y="-145" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeBelow</TreeBelow>
    <TreeBelow x="1720" y="-405" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeBelow</TreeBelow>
    <TreeZero x="1780" y="-410" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeZero x="1680" y="-410" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
  </platforms>
  <collectables>
    <BubbleBonus x="440" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="420" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="700" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1380" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1440" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1460" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1580" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1600" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1580" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1880" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1820" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2000" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2060" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2320" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2300" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2380" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2440" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2660" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2640" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2660" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2520" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2700" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2740" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2780" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2760" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2780" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2800" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2740" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2740" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2460" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2340" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2280" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2220" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2200" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2180" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2220" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2080" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2040" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2040" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2080" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2080" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2060" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2040" y="40">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>7</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get3_2():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <JumpThrough x="200" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="200" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="260" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="200" y="180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="460" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <JumpThrough x="400" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="660" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="720" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="780" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="660" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="9" h="5">Standard</Standard>
    <Standard x="840" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="1040" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="10">Standard</Standard>
    <JumpThrough x="1160" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1220" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1280" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1340" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1220" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1280" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1260" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="1440" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="5">Standard</Standard>
    <JumpThrough x="1440" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1440" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1440" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1500" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1540" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1600" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1500" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1560" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1620" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1680" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="1740" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="2080" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="2">Standard</Standard>
    <Standard x="1940" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="5">Standard</Standard>
    <Standard x="2080" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="5">Standard</Standard>
    <Standard x="2240" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="8">Standard</Standard>
    <Standard x="2400" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="15">Standard</Standard>
    <JumpThrough x="2300" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2200" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2260" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2080" y="-140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2080" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2080" y="-220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2120" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2180" y="-300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2280" y="-320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2380" y="-300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2440" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1940" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2080" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="2660" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="2">Standard</Standard>
    <Standard x="2600" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="2800" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="2700" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="2900" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="3000" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="5">Standard</Standard>
    <Standard x="3400" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="25">Standard</Standard>
    <Standard x="3040" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="5">Standard</Standard>
    <Standard x="3260" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="5">Standard</Standard>
    <JumpThrough x="3200" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="3200" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="3200" y="-140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="3260" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="3200" y="-320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="3000" y="-560" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="5">Standard</Standard>
    <Standard x="3000" y="-460" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="9">Standard</Standard>
    <EndLevel x="3112" y="-300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="3140" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <GroundZero x="200" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="10">GroundZero</GroundZero>
    <GroundZero x="320" y="20" angle="-29.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="5">GroundZero</GroundZero>
    <GroundZero x="660" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="9" h="6">GroundZero</GroundZero>
    <GroundZero x="1160" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="12" h="5">GroundZero</GroundZero>
    <GroundZero x="1220" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="5">GroundZero</GroundZero>
    <GroundZero x="1260" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="5">GroundZero</GroundZero>
    <GroundZero x="1440" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="8">GroundZero</GroundZero>
    <GroundZero x="1940" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="8">GroundZero</GroundZero>
    <GroundZero x="2100" y="-20" angle="-29.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="17" h="11">GroundZero</GroundZero>
    <GroundZero x="3000" y="-480" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="20">GroundZero</GroundZero>
    <GroundZero x="2600" y="-200" angle="10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="16" h="9">GroundZero</GroundZero>
    <TreeBelow x="1800" y="-165" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeBelow</TreeBelow>
  </platforms>
  <collectables>
    <BubbleBonus x="220" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="240" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="120">BubbleBonus</BubbleBonus>
    <DiamondBonus x="220" y="160">DiamondBonus</DiamondBonus>
    <BubbleBonus x="420" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="420" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="440" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="800" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="800" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="740" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="760" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="800" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="820" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="740" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="680" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="700" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="720" y="-40">BubbleBonus</BubbleBonus>
    <DiamondBonus x="680" y="20">DiamondBonus</DiamondBonus>
    <DiamondBonus x="1280" y="-280">DiamondBonus</DiamondBonus>
    <BubbleBonus x="1260" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1300" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1280" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1280" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1340" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1480" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1460" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1540" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1600" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1660" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1540" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1700" y="-20">BubbleBonus</BubbleBonus>
    <DiamondBonus x="1700" y="60">DiamondBonus</DiamondBonus>
    <BubbleBonus x="1960" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1980" y="20">BubbleBonus</BubbleBonus>
    <DiamondBonus x="2100" y="60">DiamondBonus</DiamondBonus>
    <BubbleBonus x="2360" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2280" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2120" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2120" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2120" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2120" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2160" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2240" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2340" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2420" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2640" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2620" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2820" y="-80">BubbleBonus</BubbleBonus>
    <DiamondBonus x="2760" y="-60">DiamondBonus</DiamondBonus>
    <BubbleBonus x="2780" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2820" y="-220">BubbleBonus</BubbleBonus>
    <DiamondBonus x="3360" y="-120">DiamondBonus</DiamondBonus>
    <BubbleBonus x="3220" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3240" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3240" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3220" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3300" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3360" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3240" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3160" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3120" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3200" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3100" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1840" y="-120">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>7</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get3_3():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="-200" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="9">Standard</Standard>
    <Standard x="-200" y="-400" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="21">Standard</Standard>
    <Standard x="200" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="9">Standard</Standard>
    <Standard x="300" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="8">Standard</Standard>
    <Standard x="360" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="11">Standard</Standard>
    <Standard x="560" y="-18" angle="10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="10">Standard</Standard>
    <Standard x="661.8748736111116" y="3.1315472222222245" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="850" y="70" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="10">Standard</Standard>
    <Standard x="910" y="170" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="13" h="2">Standard</Standard>
    <Standard x="1000" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="3">Standard</Standard>
    <Standard x="1040" y="-400" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="22">Standard</Standard>
    <Standard x="1170" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="10">Standard</Standard>
    <Standard x="1270" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="10">Standard</Standard>
    <Standard x="1300" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="1320" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="1120" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="9">Standard</Standard>
    <Standard x="1360" y="-320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="20">Standard</Standard>
    <Standard x="1140" y="-260" angle="-9.999999999999998" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="11" h="2">Standard</Standard>
    <JumpThrough x="1402.441055277779" y="-319.8651805555558" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1466.861455277779" y="-292.12861944444467" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1401.546327500001" y="-252.7605972222224" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1467.6443420833343" y="-194.80460541666685" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1401.8818504166677" y="-167.0680443055557" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1469.1206429166675" y="-99.5608334722223" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="1520" y="-600" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="26">Standard</Standard>
    <Standard x="1400" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="1681.6451310831353" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <JumpThrough x="1542.1048437561121" y="-83.93930721897318" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1616.2370746026752" y="-56.13972065151198" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1617.7814960786452" y="-121.0054226422548" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1588.437488035214" y="-165.79364544538674" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="1600" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="1700" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="4">Standard</Standard>
    <Standard x="1800" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="1">Standard</Standard>
    <Standard x="2200" y="-480" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="20">Standard</Standard>
    <JumpThrough x="2101.5221535504916" y="-238.35055842705728" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2137.962794146863" y="-207.66370318800745" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2099.6042250980504" y="-179.85374062761855" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2133.1679730157616" y="-147.24895693612814" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1639.0616554557485" y="-221.56868446820192" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1602.621014859377" y="-266.6400031005563" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="1714.8198293271528" y="-310.75235750669043" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="1800" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="2000" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="2100" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="2300" y="0" angle="-10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="2500" y="-35" angle="-20.000000000000007" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="6">Standard</Standard>
    <Standard x="2780" y="-135" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="7">Standard</Standard>
    <Standard x="2900" y="-135" angle="10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="6">Standard</Standard>
    <Standard x="3080" y="-100" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="6">Standard</Standard>
    <Standard x="3500" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="18" h="6">Standard</Standard>
    <Standard x="3860" y="-200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="30">Standard</Standard>
    <EndLevel x="3632" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="3660" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <Standard x="1100" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="1120" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="1160" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="2">Standard</Standard>
    <Standard x="3260" y="-30" angle="29.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="5">Standard</Standard>
    <TreeZero x="830" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <GroundZero x="900" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="6">GroundZero</GroundZero>
    <GroundZero x="1060" y="-420" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="58" h="31">GroundZero</GroundZero>
    <TreeZero x="2360" y="-140" angle="-10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeZero x="2580" y="-200" angle="-20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeBelow x="2820" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeBelow</TreeBelow>
    <TreeZero x="3240" y="-180" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
  </platforms>
  <collectables>
    <BubbleBonus x="1435.879534638891" y="25287.07537770883">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="620" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="660" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="720" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="760" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1180" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1260" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1100" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1100" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1100" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1100" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1140" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1380" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1440" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1500" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1500" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1500" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1640" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1620" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1660" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1560" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1660" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1600" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1680" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1660" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1620" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1760" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1800" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1840" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2140" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2160" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2120" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2160" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2180" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1760" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2140" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2420" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2780" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3240" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3400" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3620" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3580" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3640" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3600" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3640" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3640" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3600" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3560" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3500" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3440" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2860" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2840" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2880" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2860" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2860" y="-240">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>7</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get4_1():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="-200" y="-200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="200" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="9">Standard</Standard>
    <Standard x="100" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="400" y="-440" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="20">Standard</Standard>
    <Standard x="-80" y="-440" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="4">Standard</Standard>
    <Standard x="-300" y="-380" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="7">Standard</Standard>
    <Standard x="-420" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="5">Standard</Standard>
    <Standard x="-500" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="5">Standard</Standard>
    <Standard x="-520" y="-380" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="20">Standard</Standard>
    <Standard x="-500" y="-1000" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="33">Standard</Standard>
    <Standard x="-280" y="-380" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="120" y="-700" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="14" h="13">Standard</Standard>
    <Standard x="-420" y="-560" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="12" h="3">Standard</Standard>
    <Standard x="-180" y="-620" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="4">Standard</Standard>
    <Standard x="-320" y="-800" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="-20" y="-800" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="5">Standard</Standard>
    <Standard x="-20" y="-620" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="6">Standard</Standard>
    <Standard x="500" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="500" y="-660" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="4">Standard</Standard>
    <Standard x="800" y="-620" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="12" h="5">Standard</Standard>
    <Standard x="960" y="-840" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="7">Standard</Standard>
    <Standard x="700" y="-420" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="21" h="4">Standard</Standard>
    <Standard x="1120" y="-580" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="8">Standard</Standard>
    <Standard x="1020" y="-700" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="4">Standard</Standard>
    <Standard x="1520" y="-880" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="15">Standard</Standard>
    <EndLevel x="1312" y="-600" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="1340" y="-580" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <TutorialWall x="30" y="-115" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TutorialWall</TutorialWall>
    <GroundZero x="-500" y="-900" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="101" h="48">GroundZero</GroundZero>
  </platforms>
  <collectables>
    <BubbleBonus x="40" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="20" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="200" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="320" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="320" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="340" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="340" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="340" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="320" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="240" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-180" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-140" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-240" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-480" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-440" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-480" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-440" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-340" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-340" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-340" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="-600">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-360" y="-620">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-360" y="-660">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-360" y="-700">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-380" y="-700">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-340" y="-700">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-360" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-320" y="-820">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-140" y="-840">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="0" y="-820">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="420" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="440" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="480" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="580" y="-700">BubbleBonus</BubbleBonus>
    <BubbleBonus x="640" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="520" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="980" y="-640">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="-660">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="620" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="720" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="980" y="-880">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="-900">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="-880">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="-620">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1100" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="-580">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="-640">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1120" y="-620">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1160" y="-600">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="-600">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1240" y="-640">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1280" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1320" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1500" y="-620">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>7</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get4_2():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="-100" y="-600" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="30">Standard</Standard>
    <Standard x="40" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="3">Standard</Standard>
    <Standard x="200" y="-460" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="25">Standard</Standard>
    <Standard x="0" y="-320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="5">Standard</Standard>
    <Standard x="120" y="-320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="5">Standard</Standard>
    <Standard x="0" y="-640" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="5">Standard</Standard>
    <Standard x="340" y="-640" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="7">Standard</Standard>
    <Standard x="300" y="-640" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="1">Standard</Standard>
    <Standard x="440" y="-540" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="3">Standard</Standard>
    <Standard x="400" y="-420" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="5">Standard</Standard>
    <Standard x="620" y="-540" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="3">Standard</Standard>
    <Standard x="700" y="-1000" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="30">Standard</Standard>
    <Standard x="620" y="-680" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="440" y="-640" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="3">Standard</Standard>
    <Standard x="-140" y="-780" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="10">Standard</Standard>
    <Standard x="-180" y="-1260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="25">Standard</Standard>
    <Cloud x="40" y="-820" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="140" y="-840" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Standard x="800" y="-640" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="1000" y="-1220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="30">Standard</Standard>
    <EndLevel x="872" y="-660" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="900" y="-640" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <Standard x="-140" y="-1300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="60" h="4">Standard</Standard>
    <Cloud x="620" y="-1040" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="500" y="-1000" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="400" y="-1000" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="320" y="-960" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="200" y="-900" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="-40" y="-740" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <GroundZero x="-180" y="-1240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="60" h="61">GroundZero</GroundZero>
  </platforms>
  <collectables>
    <DiamondBonus x="320" y="-600">DiamondBonus</DiamondBonus>
    <DiamondBonus x="460" y="-560">DiamondBonus</DiamondBonus>
    <DiamondBonus x="20" y="-460">DiamondBonus</DiamondBonus>
    <BubbleBonus x="140" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="200" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="140" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="20" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="340" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="420" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="660" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="680" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="640" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="580" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="600" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="660" y="-580">BubbleBonus</BubbleBonus>
    <BubbleBonus x="620" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="600" y="-660">BubbleBonus</BubbleBonus>
    <BubbleBonus x="680" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="660" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="620" y="-700">BubbleBonus</BubbleBonus>
    <BubbleBonus x="460" y="-660">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="-660">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="-660">BubbleBonus</BubbleBonus>
    <BubbleBonus x="0" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="0" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="-840">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="-920">BubbleBonus</BubbleBonus>
    <BubbleBonus x="340" y="-980">BubbleBonus</BubbleBonus>
    <BubbleBonus x="440" y="-1020">BubbleBonus</BubbleBonus>
    <BubbleBonus x="480" y="-1020">BubbleBonus</BubbleBonus>
    <BubbleBonus x="520" y="-1020">BubbleBonus</BubbleBonus>
    <BubbleBonus x="560" y="-1060">BubbleBonus</BubbleBonus>
    <BubbleBonus x="640" y="-1080">BubbleBonus</BubbleBonus>
    <BubbleBonus x="600" y="-1060">BubbleBonus</BubbleBonus>
    <BubbleBonus x="900" y="-1100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="900" y="-1060">BubbleBonus</BubbleBonus>
    <BubbleBonus x="900" y="-1020">BubbleBonus</BubbleBonus>
    <BubbleBonus x="900" y="-980">BubbleBonus</BubbleBonus>
    <BubbleBonus x="900" y="-960">BubbleBonus</BubbleBonus>
    <BubbleBonus x="880" y="-980">BubbleBonus</BubbleBonus>
    <BubbleBonus x="920" y="-980">BubbleBonus</BubbleBonus>
    <BubbleBonus x="860" y="-1000">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="-1000">BubbleBonus</BubbleBonus>
    <BubbleBonus x="900" y="-1000">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>7</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get4_3():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="200" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="460" y="-360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="14">Standard</Standard>
    <Standard x="400" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="5">Standard</Standard>
    <Standard x="520" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="760" y="-200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="3">Standard</Standard>
    <Standard x="720" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="12" h="10">Standard</Standard>
    <Standard x="820" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="1">Standard</Standard>
    <Standard x="960" y="-320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="14">Standard</Standard>
    <Standard x="1000" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="2">Standard</Standard>
    <Standard x="1040" y="-620" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="14">Standard</Standard>
    <Standard x="1060" y="-200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="9" h="2">Standard</Standard>
    <Standard x="1240" y="-380" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="20">Standard</Standard>
    <Standard x="1060" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="1140" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="960" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="5">Standard</Standard>
    <Standard x="1360" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="5">Standard</Standard>
    <Standard x="1480" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="4">Standard</Standard>
    <Standard x="1620" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="4">Standard</Standard>
    <Standard x="1740" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="6">Standard</Standard>
    <Standard x="1860" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="10">Standard</Standard>
    <Standard x="1760" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="2">Standard</Standard>
    <Standard x="1960" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="10">Standard</Standard>
    <Standard x="2060" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="10">Standard</Standard>
    <Standard x="2160" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="11">Standard</Standard>
    <Standard x="2180" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="5">Standard</Standard>
    <Standard x="2260" y="-200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="2200" y="-320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="3">Standard</Standard>
    <Standard x="2360" y="-660" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Cloud x="2000" y="-320" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="2100" y="-360" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1860" y="-340" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1660" y="-340" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1740" y="-420" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1520" y="-440" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1420" y="-320" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1360" y="-540" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1220" y="-700" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <EndLevel x="1092" y="-640" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="1120" y="-620" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <GroundZero x="480" y="-380" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="39" h="25">GroundZero</GroundZero>
    <GroundZero x="1540" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="35" h="10">GroundZero</GroundZero>
    <GroundZero x="2200" y="-320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="11">GroundZero</GroundZero>
  </platforms>
  <collectables>
    <BubbleBonus x="260" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="300" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="740" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="840" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="820" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="880" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="880" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="-380">BubbleBonus</BubbleBonus>
    <DiamondBonus x="940" y="-220">DiamondBonus</DiamondBonus>
    <DiamondBonus x="920" y="-120">DiamondBonus</DiamondBonus>
    <BubbleBonus x="1060" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1120" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1180" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1160" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1120" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1100" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1100" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1120" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1320" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1180" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1340" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1580" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1580" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1580" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1720" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1700" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1720" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1880" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1980" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2080" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1760" y="-120">BubbleBonus</BubbleBonus>
    <DiamondBonus x="2140" y="80">DiamondBonus</DiamondBonus>
    <BubbleBonus x="2240" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2240" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2280" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2260" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2140" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2040" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1900" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1780" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1700" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1560" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1460" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1380" y="-640">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="-600">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1360" y="-700">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1320" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1260" y="-780">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1260" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1260" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1240" y="-760">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>7</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get5_1():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="200" y="0" angle="-10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="395" y="-35" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="590" y="-35" angle="10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="780" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="980" y="0" angle="-45" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="1120" y="-140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="1320" y="-140" angle="45" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="1460" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="1">Standard</Standard>
    <Standard x="1860" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="1900" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="1980" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="7">Standard</Standard>
    <Standard x="2120" y="-220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="2320" y="-220" angle="19.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="25" h="1">Standard</Standard>
    <Standard x="2780" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2980" y="-220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="2320" y="-360" angle="20.000000000000007" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="30" h="1">Standard</Standard>
    <Standard x="2100" y="-360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="11" h="1">Standard</Standard>
    <Standard x="2200" y="-480" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2100" y="-560" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="2400" y="-480" angle="23" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="33" h="1">Standard</Standard>
    <Standard x="2100" y="-560" angle="-45" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2240" y="-700" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="1">Standard</Standard>
    <Standard x="2640" y="-700" angle="30.000000000000004" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="30" h="1">Standard</Standard>
    <Standard x="3000" y="-220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="1">Standard</Standard>
    <Standard x="3380" y="-420" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="3140" y="-400" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="5">Standard</Standard>
    <Standard x="3160" y="-320" angle="0" density="0" friction="0.2" restitution="0.311111111" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="1">Standard</Standard>
    <Standard x="2860" y="-840" angle="38" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="34" h="1">Standard</Standard>
    <Standard x="1900" y="-560" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="1880" y="-800" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="13">Standard</Standard>
    <Standard x="1980" y="-700" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="2080" y="-700" angle="-45" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="1900" y="-1000" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="10">Standard</Standard>
    <Standard x="2000" y="-1000" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="50" h="1">Standard</Standard>
    <Standard x="2220" y="-840" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="32" h="1">Standard</Standard>
    <Standard x="3400" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="25" h="4">Standard</Standard>
    <Standard x="3880" y="-1340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="53">Standard</Standard>
    <EndLevel x="3552" y="-300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="3580" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <GroundZero x="1900" y="-1020" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="100" h="50">GroundZero</GroundZero>
  </platforms>
  <collectables>
    <BubbleBonus x="400" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="440" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="480" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="520" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="560" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="740" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="840" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="920" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="980" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1120" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1280" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1340" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1480" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1520" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1380" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1460" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1520" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1640" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1720" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1840" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1820" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1920" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2080" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2100" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2120" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2180" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2240" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2280" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2320" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2420" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2460" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2460" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2480" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2520" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2340" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2380" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2600" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2640" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2620" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2680" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2700" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2560" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2780" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2860" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2900" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2900" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2900" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2960" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2960" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2960" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2960" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2860" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2840" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2780" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2760" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2720" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2700" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2660" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2620" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2660" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2640" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2600" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2580" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2520" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2540" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2420" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2340" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2380" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2260" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2220" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2180" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2160" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2140" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2160" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2180" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2240" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2520" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2540" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2540" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2560" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2560" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2680" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2700" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2700" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2740" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2720" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2740" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2740" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2880" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2940" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2920" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2980" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3000" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3040" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3080" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3120" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3360" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3340" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3320" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3360" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3340" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3320" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3220" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3200" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3220" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3220" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3240" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3100" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3100" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3080" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3080" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3080" y="-580">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3060" y="-580">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2920" y="-600">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2940" y="-600">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2920" y="-620">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2900" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2880" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2880" y="-700">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2720" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2680" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2660" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2280" y="-800">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2320" y="-800">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="-800">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-800">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2440" y="-800">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2480" y="-800">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2520" y="-800">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2560" y="-800">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2600" y="-800">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2640" y="-800">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2120" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2140" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2160" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2180" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2200" y="-700">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2220" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2240" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2260" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="-580">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2000" y="-660">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1980" y="-620">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1920" y="-640">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="-660">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1920" y="-700">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="-700">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2000" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2220" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2240" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2260" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2280" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2300" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2380" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2480" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2500" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2600" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2620" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2640" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2760" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2760" y="-880">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2880" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2880" y="-840">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2980" y="-800">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2960" y="-780">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3080" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3060" y="-700">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3140" y="-640">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3200" y="-600">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3260" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3360" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3480" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3560" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3820" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3820" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3820" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3820" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3840" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3860" y="-360">BubbleBonus</BubbleBonus>
    <DiamondBonus x="3860" y="-300">DiamondBonus</DiamondBonus>
    <DiamondBonus x="3420" y="-300">DiamondBonus</DiamondBonus>
    <DiamondBonus x="2020" y="-960">DiamondBonus</DiamondBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>7</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get5_2():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="200" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Spikes x="420" y="-40" angle="90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Standard x="400" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="4">Standard</Standard>
    <Standard x="500" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="4">Standard</Standard>
    <Standard x="600" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="700" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="800" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="900" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Spikes x="920" y="-60" angle="90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Spikes</Spikes>
    <Standard x="900" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="13" h="5">Standard</Standard>
    <Standard x="980" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="2">Standard</Standard>
    <Spikes x="1080" y="0" angle="180" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Standard x="1160" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="1260" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="1500" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="2">Standard</Standard>
    <Standard x="1460" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="2">Standard</Standard>
    <Spikes x="1460" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Spikes</Spikes>
    <Spikes x="1660" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Spikes</Spikes>
    <Standard x="1660" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="3">Standard</Standard>
    <Standard x="1660" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="2">Standard</Standard>
    <Standard x="1800" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="4">Standard</Standard>
    <Standard x="980" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Spikes x="1920" y="-100" angle="90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="2000" y="-20" angle="-89.99999999999994" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Spikes</Spikes>
    <Standard x="2020" y="-220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="10">Standard</Standard>
    <Standard x="1920" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="2">Standard</Standard>
    <Standard x="1860" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="4">Standard</Standard>
    <Standard x="2000" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="1960" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="2">Standard</Standard>
    <Standard x="2160" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="5">Standard</Standard>
    <Standard x="2220" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Spikes x="2140" y="-220" angle="90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Spikes</Spikes>
    <Standard x="2200" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="2">Standard</Standard>
    <Standard x="2320" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="2400" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="3">Standard</Standard>
    <Standard x="2400" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="2440" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="1">Standard</Standard>
    <Standard x="2500" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="2600" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="2560" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="3">Standard</Standard>
    <Standard x="2460" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="3">Standard</Standard>
    <Standard x="2360" y="-200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="2">Standard</Standard>
    <Standard x="2260" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="2800" y="-420" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="20">Standard</Standard>
    <EndLevel x="2672" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="2700" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <Standard x="380" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="3">Standard</Standard>
    <Spikes x="2580" y="40" angle="-90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Spikes</Spikes>
    <GroundZero x="900" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="9" h="7">GroundZero</GroundZero>
    <GroundZero x="2400" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="8">GroundZero</GroundZero>
    <GroundZero x="1860" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="18" h="12">GroundZero</GroundZero>
  </platforms>
  <collectables>
    <BubbleBonus x="440" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1040" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1540" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1580" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1680" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1720" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1820" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1860" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1880" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1940" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1980" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1980" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2180" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2180" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2460" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2540" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2440" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2280" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2300" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2320" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2700" y="-180">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>7</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get5_3():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="200" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <SpringBush x="140" y="-25" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="400" y="-190" angle="45" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Spikes x="400" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="1">Spikes</Spikes>
    <Standard x="400" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="2">Standard</Standard>
    <Standard x="700" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <SpringBush x="900" y="-190" angle="45" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Spikes x="900" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="25" h="1">Spikes</Spikes>
    <Standard x="900" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="25" h="3">Standard</Standard>
    <Standard x="1400" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="1600" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="11" h="3">Standard</Standard>
    <Standard x="1820" y="-140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="1920" y="-300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="17" h="10">Standard</Standard>
    <SpringBush x="2080" y="-325" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="2160" y="-520" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="1920" y="-520" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Spikes x="2040" y="-520" angle="90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Spikes</Spikes>
    <Spikes x="2140" y="-420" angle="-90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Spikes</Spikes>
    <Standard x="2440" y="-480" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="14">Standard</Standard>
    <Standard x="2260" y="-200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="9" h="3">Standard</Standard>
    <SpringBush x="2260" y="-325" angle="45" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2275" y="-480" angle="45" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2405" y="-380" angle="-45" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2405" y="-280" angle="-45" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="2640" y="-1000" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="26">Standard</Standard>
    <SpringBush x="2460" y="-505" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <EndLevel x="2552" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="2580" y="-480" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <Cloud x="920" y="-160" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1020" y="-180" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1120" y="-160" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1220" y="-180" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1320" y="-160" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="460" y="-160" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="600" y="-100" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="520" y="-60" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="440" y="-60" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="400" y="-80" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <GroundZero x="1920" y="-480" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="26" h="15">GroundZero</GroundZero>
    <TreeZero x="1540" y="-290" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeZero x="1720" y="-230" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeZero x="2440" y="-610" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeZero x="2160" y="-650" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeBelow x="1920" y="-645" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeBelow</TreeBelow>
  </platforms>
  <collectables>
    <BubbleBonus x="160" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="200" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="660" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="720" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="580" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="480" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="420" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1340" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1240" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1240" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1160" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1880" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1880" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1920" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2080" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2100" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2000" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="-580">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1940" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2220" y="-580">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2240" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2180" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2280" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2380" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2300" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2300" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2480" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2520" y="-600">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>5</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get6_1():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="3">Standard</Standard>
    <Standard x="100" y="-400" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="23">Standard</Standard>
    <Standard x="-20" y="-400" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="23">Standard</Standard>
    <Standard x="-200" y="-400" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="9" h="1">Standard</Standard>
    <Standard x="-300" y="-400" angle="45" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="-180" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="-320" y="-600" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="-200" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="-100" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="-200" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="-180" y="200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="20" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="3">Standard</Standard>
    <Standard x="200" y="-340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="-300" y="-600" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="1">Standard</Standard>
    <Standard x="100" y="-600" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="10">Standard</Standard>
    <Standard x="200" y="-440" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="220" y="-340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="14" h="1">Standard</Standard>
    <Standard x="480" y="-640" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="15">Standard</Standard>
    <Standard x="260" y="-520" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="11" h="1">Standard</Standard>
    <Standard x="200" y="-620" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="400" y="-740" angle="45" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="1">Standard</Standard>
    <Standard x="180" y="-740" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="11" h="1">Standard</Standard>
    <Standard x="100" y="-820" angle="45" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="1">Standard</Standard>
    <Standard x="-100" y="-820" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="-440" y="-720" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="13" h="1">Standard</Standard>
    <Standard x="-440" y="-700" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="20">Standard</Standard>
    <Standard x="-420" y="-300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="10">Standard</Standard>
    <Standard x="-360" y="-220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="-420" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="9" h="2">Standard</Standard>
    <Standard x="-320" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="1">Standard</Standard>
    <Standard x="-420" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="20">Standard</Standard>
    <Standard x="-400" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="11">Standard</Standard>
    <Standard x="-260" y="320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="50" h="2">Standard</Standard>
    <Standard x="720" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="25">Standard</Standard>
    <Standard x="860" y="-680" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="400" y="-1180" angle="45" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="34" h="1">Standard</Standard>
    <Standard x="120" y="-1180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="14" h="1">Standard</Standard>
    <Standard x="-260" y="-820" angle="-45" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="26" h="1">Standard</Standard>
    <Standard x="-520" y="-820" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="14" h="1">Standard</Standard>
    <Standard x="-540" y="-820" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="6">Standard</Standard>
    <Standard x="-580" y="-600" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="10">Standard</Standard>
    <Standard x="-660" y="-720" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="1">Standard</Standard>
    <Standard x="-680" y="-720" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="5">Standard</Standard>
    <Standard x="-860" y="-520" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="14" h="4">Standard</Standard>
    <Standard x="-860" y="-720" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="-840" y="-720" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="1">Standard</Standard>
    <EndLevel x="-788" y="-540" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="-760" y="-520" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <Standard x="-200" y="-720" angle="-45" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="1">Standard</Standard>
    <GroundZero x="-900" y="-1220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="100" h="78">GroundZero</GroundZero>
  </platforms>
  <collectables>
    <JetpackBonus x="60" y="-60">JetpackBonus</JetpackBonus>
    <BubbleBonus x="80" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="20" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-100" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-140" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-180" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-240" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-280" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-280" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-260" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-220" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-200" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-240" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-200" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-200" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-160" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-160" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-100" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-260" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-260" y="-480">BubbleBonus</BubbleBonus>
    <DiamondBonus x="-40" y="-340">DiamondBonus</DiamondBonus>
    <DiamondBonus x="240" y="-280">DiamondBonus</DiamondBonus>
    <DiamondBonus x="820" y="-680">DiamondBonus</DiamondBonus>
    <BubbleBonus x="-180" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-140" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-100" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-60" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-120" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-60" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-60" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-100" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-100" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-100" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-60" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-160" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-140" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-100" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="0" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="140" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="140" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="140" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="200" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="120" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="140" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="440" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="440" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="440" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="240" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="400" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="460" y="-620">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="400" y="-640">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="-700">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="-660">BubbleBonus</BubbleBonus>
    <BubbleBonus x="300" y="-700">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-640">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="-780">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="-780">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-780">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="20" y="-780">BubbleBonus</BubbleBonus>
    <BubbleBonus x="20" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="0" y="-780">BubbleBonus</BubbleBonus>
    <BubbleBonus x="0" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="0" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="20" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="120" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-20" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-20" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-20" y="-780">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="-780">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-60" y="-780">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-60" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-60" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="-780">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-100" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-100" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-120" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-140" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-120" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-100" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-60" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-20" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="0" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="20" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="120" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="140" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-380" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-360" y="-600">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-360" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-380" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-320" y="-620">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-360" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-400" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-320" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-400" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-280" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-340" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-200" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-340" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-320" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-280" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-220" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-220" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-240" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-260" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-240" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-380" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-380" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-340" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-340" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-380" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-340" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-240" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-220" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-220" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-220" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-220" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-160" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-100" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="140" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="20" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="520" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="540" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="560" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="580" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="600" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="620" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="640" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="660" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="680" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="700" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="540" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="580" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="620" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="660" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="700" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="620" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="660" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="700" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="740" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="820" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="800" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="760" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="720" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="660" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="680" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="620" y="-600">BubbleBonus</BubbleBonus>
    <BubbleBonus x="560" y="-660">BubbleBonus</BubbleBonus>
    <BubbleBonus x="400" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="-780">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="340" y="-780">BubbleBonus</BubbleBonus>
    <BubbleBonus x="320" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="300" y="-780">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="140" y="-1140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-1140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="-1140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="200" y="-1140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="-1140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="240" y="-1140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="-1140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="-1140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="300" y="-1140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="320" y="-1140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="340" y="-1140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="-1140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="-1140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="-980">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-980">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-960">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="-960">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-940">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-920">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="-920">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="-920">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="-1040">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="-1020">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="-1020">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="-1000">BubbleBonus</BubbleBonus>
    <BubbleBonus x="140" y="-920">BubbleBonus</BubbleBonus>
    <BubbleBonus x="140" y="-900">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-900">BubbleBonus</BubbleBonus>
    <BubbleBonus x="120" y="-900">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="-900">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="-880">BubbleBonus</BubbleBonus>
    <BubbleBonus x="200" y="-880">BubbleBonus</BubbleBonus>
    <BubbleBonus x="200" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="140" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="140" y="-840">BubbleBonus</BubbleBonus>
    <BubbleBonus x="120" y="-840">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="-840">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-20" y="-920">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-20" y="-880">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-20" y="-900">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-20" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-840">BubbleBonus</BubbleBonus>
    <BubbleBonus x="20" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-880">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-300" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-360" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-400" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-440" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-480" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-480" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-480" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-520" y="-640">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-580" y="-640">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-640" y="-620">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-620" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-680" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-720" y="-640">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-780" y="-620">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>5</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get6_2():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="25" h="5">Standard</Standard>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="20" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="1">Standard</Standard>
    <Standard x="200" y="-300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="1">Standard</Standard>
    <Standard x="20" y="-620" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="7">Standard</Standard>
    <Standard x="600" y="-440" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="780" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="960" y="-360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="720" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="320" y="-1120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="340" y="-1120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="50" h="1">Standard</Standard>
    <Standard x="580" y="-700" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="600" y="-700" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="800" y="-800" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="1340" y="-1120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="54">Standard</Standard>
    <Standard x="1000" y="-620" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="17" h="1">Standard</Standard>
    <Standard x="1120" y="-480" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="900" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="1200" y="-220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="3">Standard</Standard>
    <EndLevel x="1212" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="1240" y="-220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <Standard x="600" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="25" h="5">Standard</Standard>
    <Standard x="1100" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="13" h="5">Standard</Standard>
    <Spikes x="20" y="-200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Spikes</Spikes>
    <Spikes x="200" y="-320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Spikes</Spikes>
    <Spikes x="420" y="-460" angle="180" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="1">Spikes</Spikes>
    <Spikes x="480" y="-80" angle="-90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Spikes</Spikes>
    <Standard x="500" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="28">Standard</Standard>
    <Spikes x="560" y="-500" angle="-90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Spikes</Spikes>
    <Spikes x="780" y="-700" angle="-90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Spikes</Spikes>
    <Spikes x="780" y="-520" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="960" y="-380" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="600" y="-460" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="720" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="900" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Spikes</Spikes>
    <Spikes x="1100" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="12" h="1">Spikes</Spikes>
    <Spikes x="1120" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Spikes</Spikes>
    <Spikes x="1120" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Spikes</Spikes>
    <Spikes x="700" y="-440" angle="90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="880" y="-500" angle="90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="1060" y="-360" angle="90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="820" y="-240" angle="90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="980" y="-160" angle="90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Spikes</Spikes>
    <Spikes x="1200" y="-480" angle="90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Spikes</Spikes>
    <Spikes x="680" y="-340" angle="180" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="860" y="-400" angle="180" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="760" y="-420" angle="270" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="1040" y="-260" angle="180" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="940" y="-280" angle="-90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="960" y="-80" angle="180" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Spikes</Spikes>
    <Spikes x="880" y="-100" angle="-90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Spikes</Spikes>
    <Spikes x="800" y="-140" angle="180" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="700" y="-160" angle="-90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="1180" y="-400" angle="180" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Spikes</Spikes>
    <Spikes x="1100" y="-420" angle="-90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Spikes</Spikes>
    <Spikes x="1280" y="-140" angle="180" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <GroundZero x="0" y="-1000" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="68" h="50">GroundZero</GroundZero>
  </platforms>
  <collectables>
    <JetpackBonus x="400" y="-40">JetpackBonus</JetpackBonus>
    <BubbleBonus x="440" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="460" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="120" y="-320">BubbleBonus</BubbleBonus>
    <DiamondBonus x="40" y="-220">DiamondBonus</DiamondBonus>
    <BubbleBonus x="340" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="420" y="-380">BubbleBonus</BubbleBonus>
    <DiamondBonus x="40" y="-440">DiamondBonus</DiamondBonus>
    <BubbleBonus x="500" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="520" y="-580">BubbleBonus</BubbleBonus>
    <BubbleBonus x="520" y="-700">BubbleBonus</BubbleBonus>
    <BubbleBonus x="620" y="-800">BubbleBonus</BubbleBonus>
    <BubbleBonus x="920" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="420" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="420" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="440" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="400" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="320" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="140" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="140" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="200" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="460" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="240" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="480" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="-640">BubbleBonus</BubbleBonus>
    <BubbleBonus x="560" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="740" y="-860">BubbleBonus</BubbleBonus>
    <BubbleBonus x="680" y="-840">BubbleBonus</BubbleBonus>
    <BubbleBonus x="800" y="-880">BubbleBonus</BubbleBonus>
    <BubbleBonus x="880" y="-880">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="-820">BubbleBonus</BubbleBonus>
    <BubbleBonus x="960" y="-840">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="-800">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="-760">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="-720">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1040" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="960" y="-620">BubbleBonus</BubbleBonus>
    <BubbleBonus x="960" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="-600">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="-660">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1160" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1100" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1260" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1260" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1240" y="-320">BubbleBonus</BubbleBonus>
    <DiamondBonus x="840" y="-160">DiamondBonus</DiamondBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>5</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get6_3():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="200" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="400" y="260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="600" y="460" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="800" y="260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="1000" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="1200" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Cloud x="1580" y="-300" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Standard x="1400" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="5">Standard</Standard>
    <Standard x="1800" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="5">Standard</Standard>
    <Standard x="2200" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="5">Standard</Standard>
    <Spikes x="200" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Spikes</Spikes>
    <Spikes x="400" y="240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Spikes</Spikes>
    <Spikes x="600" y="440" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Spikes</Spikes>
    <Spikes x="800" y="240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Spikes</Spikes>
    <Spikes x="1000" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Spikes</Spikes>
    <Cloud x="660" y="180" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1900" y="-40" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="2280" y="-100" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="2080" y="-340" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Spikes x="1400" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="1">Spikes</Spikes>
    <Spikes x="1800" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="1">Spikes</Spikes>
    <Spikes x="2200" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="1">Spikes</Spikes>
    <Standard x="2600" y="60" angle="-45" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="20">Standard</Standard>
    <Standard x="3160" y="60" angle="-29.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="5">Standard</Standard>
    <Standard x="3540" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="5">Standard</Standard>
    <Standard x="3940" y="-580" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="30">Standard</Standard>
    <EndLevel x="3772" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="3800" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <Cloud x="2120" y="0" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1820" y="40" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="2000" y="-140" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1700" y="-140" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1480" y="-200" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1140" y="-200" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1340" y="-300" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1280" y="-120" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="980" y="0" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1080" y="-80" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="880" y="140" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="780" y="20" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="880" y="-120" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="620" y="360" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="700" y="280" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="480" y="140" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="560" y="0" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="340" y="-20" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="420" y="20" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="240" y="-60" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <GroundZero x="200" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="200" h="25">GroundZero</GroundZero>
  </platforms>
  <collectables>
    <JetpackBonus x="160" y="-40">JetpackBonus</JetpackBonus>
    <BubbleBonus x="260" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="300" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="400" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="480" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="460" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="440" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="660" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="700" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="740" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="760" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="700" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="720" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="680" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="740" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="680" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="760" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="760" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="800" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="820" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="820" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="840" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="800" y="100">BubbleBonus</BubbleBonus>
    <DiamondBonus x="660" y="340">DiamondBonus</DiamondBonus>
    <BubbleBonus x="1020" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1040" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="980" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1100" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1120" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1120" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1140" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1140" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1160" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1160" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1180" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1200" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1160" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1180" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1140" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1280" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1300" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1320" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1340" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1360" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1300" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1340" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1520" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1520" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1520" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1500" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1540" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1600" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1640" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1620" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1580" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1560" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1660" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1680" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1380" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1440" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1340" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1340" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1440" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1800" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1740" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1700" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1760" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1720" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1780" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1720" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1760" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1740" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1780" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1860" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2040" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1940" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2160" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2320" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2460" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2540" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2620" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2680" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2380" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2420" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2500" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2580" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2660" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2700" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2680" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2680" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2660" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2660" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2640" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2640" y="-100">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>5</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get7_1():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="200" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="400" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="500" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="700" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="900" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7.5" h="5">Standard</Standard>
    <Standard x="1050" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="3">Standard</Standard>
    <Standard x="1150" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3.5" h="2.5">Standard</Standard>
    <Standard x="1280" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="1460" y="-400" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="21">Standard</Standard>
    <Standard x="1260" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="3">Standard</Standard>
    <Standard x="1238.75" y="61.638888888888886" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="2">Standard</Standard>
    <Standard x="1100" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="2">Standard</Standard>
    <Standard x="1050" y="110" angle="-30.000000000000004" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="2">Standard</Standard>
    <Standard x="960" y="110" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="2">Standard</Standard>
    <Standard x="880" y="130" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Standard</Standard>
    <Standard x="840" y="90" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="3">Standard</Standard>
    <Standard x="800" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="720" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="2">Standard</Standard>
    <Standard x="680" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="2">Standard</Standard>
    <Standard x="740" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="580" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="500" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="9" h="2">Standard</Standard>
    <Standard x="400" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="400" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="3">Standard</Standard>
    <Standard x="480" y="180" angle="10.000000000000004" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="3">Standard</Standard>
    <Standard x="677" y="215" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10.25" h="3">Standard</Standard>
    <Standard x="880" y="190" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="3">Standard</Standard>
    <Standard x="980" y="190" angle="20.000000000000007" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="1160" y="260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="2">Standard</Standard>
    <Standard x="1260" y="240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="3">Standard</Standard>
    <Standard x="1300" y="220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="3">Standard</Standard>
    <Standard x="1340" y="200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="3">Standard</Standard>
    <Standard x="1480" y="60" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10.5" h="3">Standard</Standard>
    <Standard x="1540" y="220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="1440" y="240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="1600" y="280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="1660" y="130" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="4">Standard</Standard>
    <Standard x="1660" y="210" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="4">Standard</Standard>
    <Standard x="1540" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="1400" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="5">Standard</Standard>
    <Standard x="1340" y="260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="4">Standard</Standard>
    <Standard x="1180" y="380" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="11" h="1">Standard</Standard>
    <Standard x="1440" y="300" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="3">Standard</Standard>
    <Standard x="1160" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="5">Standard</Standard>
    <Standard x="1470" y="320" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="3">Standard</Standard>
    <Standard x="1490" y="350" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="1550" y="360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="3">Standard</Standard>
    <Standard x="1570" y="380" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10.5" h="3">Standard</Standard>
    <Standard x="1760" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="4">Standard</Standard>
    <Standard x="1860" y="200" angle="19.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="1780" y="340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Standard</Standard>
    <Standard x="1840" y="320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="1780" y="420" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="1980" y="420" angle="-29.999999999999993" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2150" y="320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="2240" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="16">Standard</Standard>
    <Standard x="1980" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="2">Standard</Standard>
    <Standard x="1900" y="180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="1900" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="2">Standard</Standard>
    <Standard x="2030.942386500677" y="111.00010918500053" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="2100" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="15">Standard</Standard>
    <Standard x="2120" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="9" h="1">Standard</Standard>
    <Standard x="1560" y="0" angle="-19.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="1">Standard</Standard>
    <Standard x="1840" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="13" h="1">Standard</Standard>
    <EndLevel x="2152" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="2180" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <Standard x="2260" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="1">Standard</Standard>
    <Standard x="2400" y="-440" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="25">Standard</Standard>
    <GroundZero x="400" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="100" h="30">GroundZero</GroundZero>
    <TreeBelow x="1240" y="-105" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeBelow</TreeBelow>
    <TreeZero x="900" y="-170" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeZero x="760" y="-190" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeBelow x="600" y="-205" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeBelow</TreeBelow>
    <TreeZero x="2040" y="-230" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
  </platforms>
  <collectables>
    <BubbleBonus x="220" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="300" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="340" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="420" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="440" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="460" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="480" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="680" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="760" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="760" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="760" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="760" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="860" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="860" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="860" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="860" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="860" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1040" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1380" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1380" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1440" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1360" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1380" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="-100">BubbleBonus</BubbleBonus>
    <DiamondBonus x="1400" y="-60">DiamondBonus</DiamondBonus>
    <BubbleBonus x="1080" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1120" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="980" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="880" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="820" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="760" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="700" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="620" y="40">BubbleBonus</BubbleBonus>
    <DiamondBonus x="420" y="80">DiamondBonus</DiamondBonus>
    <BubbleBonus x="420" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="660" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="660" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="700" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="700" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="840" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="920" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1160" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1200" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1260" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1340" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1520" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1260" y="320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1280" y="320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1320" y="320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1240" y="340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1300" y="340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1260" y="360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1280" y="360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1320" y="360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="360">BubbleBonus</BubbleBonus>
    <DiamondBonus x="1200" y="340">DiamondBonus</DiamondBonus>
    <BubbleBonus x="1520" y="320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1580" y="340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1700" y="360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1680" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1800" y="320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1820" y="320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1820" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1800" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1800" y="380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1820" y="380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1800" y="400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1820" y="400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2060" y="340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2100" y="320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2080" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2060" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2100" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2100" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2060" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2040" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2080" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2080" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1880" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1880" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1940" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1880" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1840" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1800" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1740" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1560" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1500" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1560" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1840" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1680" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1760" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1600" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1920" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2080" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2080" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2100" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2120" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2280" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2280" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2320" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2340" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2200" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2200" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2200" y="80">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>5</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get7_2():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="20">Standard</Standard>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="260" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="440" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="200" y="260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="320" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="460" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Standard</Standard>
    <Standard x="600" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Standard</Standard>
    <Standard x="740" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Standard</Standard>
    <Standard x="960" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="1180" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Spikes x="200" y="340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="75" h="1">Spikes</Spikes>
    <Standard x="200" y="360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="75" h="2">Standard</Standard>
    <Standard x="1300" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="1400" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <SpringBush x="1320" y="275" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1420" y="275" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="1560" y="280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="1700" y="260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="1800" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="5">Standard</Standard>
    <SpringBush x="1775" y="180" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1775" y="210" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1775" y="240" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="1900" y="200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="11" h="10">Standard</Standard>
    <Spikes x="2100" y="200" angle="-90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Spikes</Spikes>
    <JumpThrough x="2040" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2040" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <JumpThrough x="2040" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="0.1">JumpThrough</JumpThrough>
    <Standard x="2100" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2120" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="10">Standard</Standard>
    <Spikes x="2300" y="20" angle="180" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Spikes</Spikes>
    <Spikes x="2380" y="100" angle="180" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Spikes</Spikes>
    <Standard x="2280" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="2380" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="30">Standard</Standard>
    <Standard x="2220" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="12" h="5">Standard</Standard>
    <SpringBush x="2240" y="135" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Spikes x="2420" y="0" angle="90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Spikes</Spikes>
    <Standard x="2460" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="5">Standard</Standard>
    <Standard x="2520" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="5">Standard</Standard>
    <Standard x="2580" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="5">Standard</Standard>
    <Standard x="2400" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="1">Standard</Standard>
    <Standard x="2640" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="7">Standard</Standard>
    <SpringBush x="2495" y="120" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2555" y="90" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="2600" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="5">Standard</Standard>
    <Standard x="2560" y="-140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="4">Standard</Standard>
    <Standard x="2520" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="3">Standard</Standard>
    <Standard x="2480" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Spikes x="2420" y="-220" angle="90" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Spikes</Spikes>
    <SpringBush x="2430" y="-45" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2575" y="-20" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2535" y="-60" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="2495" y="-100" angle="-90" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <Standard x="2720" y="-560" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="30">Standard</Standard>
    <EndLevel x="2652" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="2680" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <SpringBush x="2580" y="35" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <GroundZero x="200" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="130" h="19">GroundZero</GroundZero>
  </platforms>
  <collectables>
    <BubbleBonus x="240" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="240" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="240" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="240" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="240" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="640" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="980" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="640" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="980" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1200" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1200" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="980" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="980" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="980" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="640" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="640" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1320" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1320" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1320" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1580" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1580" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1580" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1720" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1720" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1720" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1720" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1720" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2440" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2440" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2440" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2440" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2440" y="-60">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>5</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get7_3():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="200" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="12">Standard</Standard>
    <Standard x="400" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="16">Standard</Standard>
    <Standard x="460" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="2">Standard</Standard>
    <Standard x="600" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="11">Standard</Standard>
    <Standard x="1000" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="2">Standard</Standard>
    <Standard x="1140" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="15">Standard</Standard>
    <Standard x="1260" y="-400" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="20">Standard</Standard>
    <Standard x="1060" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Standard</Standard>
    <Standard x="1000" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="1000" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="1100" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="8">Standard</Standard>
    <Standard x="1040" y="180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="5">Standard</Standard>
    <Standard x="960" y="220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="2">Standard</Standard>
    <Standard x="740" y="240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="11" h="2">Standard</Standard>
    <Standard x="640" y="200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="4">Standard</Standard>
    <Standard x="540" y="240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="3">Standard</Standard>
    <Standard x="440" y="260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="340" y="320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="3">Standard</Standard>
    <Standard x="320" y="200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="9">Standard</Standard>
    <Standard x="500" y="340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="2">Standard</Standard>
    <Standard x="620" y="360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="1">Standard</Standard>
    <Standard x="760" y="340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="2">Standard</Standard>
    <Standard x="820" y="320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="3">Standard</Standard>
    <Standard x="1020" y="360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="2">Standard</Standard>
    <Standard x="1220" y="380" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="11" h="2">Standard</Standard>
    <Standard x="1340" y="260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="1440" y="220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="1400" y="180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="2">Standard</Standard>
    <Standard x="1540" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="2">Standard</Standard>
    <Standard x="1460" y="420" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="1760" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="5">Standard</Standard>
    <Standard x="1700" y="220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">Standard</Standard>
    <Standard x="1660" y="480" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="2">Standard</Standard>
    <Standard x="1960" y="340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="8">Standard</Standard>
    <Standard x="2020" y="280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="1960" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="2">Standard</Standard>
    <Standard x="2100" y="260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="2">Standard</Standard>
    <Standard x="2120" y="220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="3">Standard</Standard>
    <Standard x="2160" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="2200" y="-340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="25">Standard</Standard>
    <Standard x="1700" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="1620" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="1480" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="4">Standard</Standard>
    <Standard x="1340" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="2">Standard</Standard>
    <EndLevel x="1332" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="1360" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <GroundZero x="320" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="100" h="26">GroundZero</GroundZero>
  </platforms>
  <collectables>
    <BubbleBonus x="200" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="300" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="400" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="440" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="460" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="480" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="520" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="560" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="620" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="660" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="700" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="740" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="760" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="800" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="820" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="860" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="900" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1140" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1180" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1220" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1120" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1040" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="620" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="800" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="820" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="860" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="880" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="900" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="740" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="400" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="520" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="600" y="320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="660" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="680" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="720" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="740" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="800" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1040" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1240" y="360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1300" y="320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1320" y="340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1360" y="340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1360" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1500" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1540" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1600" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1660" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1680" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1700" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1720" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1560" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1480" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1500" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1500" y="320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1520" y="360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1540" y="400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1680" y="400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1680" y="420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1680" y="440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1680" y="460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1680" y="380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1800" y="420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1840" y="420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1900" y="400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1920" y="360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1960" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1940" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2060" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2120" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2100" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2000" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1880" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1740" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1660" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1540" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1560" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1520" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1480" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1500" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1440" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1460" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1420" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1380" y="-80">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>5</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get8_1():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="-80" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="9" h="1">Standard</Standard>
    <Standard x="40" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="140" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="180" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="220" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="-20" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="60" y="180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="0" y="260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="3">Standard</Standard>
    <Standard x="200" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="1">Standard</Standard>
    <Standard x="320" y="260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="380" y="220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="440" y="200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="3">Standard</Standard>
    <Standard x="240" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="14" h="4">Standard</Standard>
    <Standard x="520" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="2">Standard</Standard>
    <Standard x="580" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="640" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="3">Standard</Standard>
    <Standard x="280" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="820" y="-700" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="43">Standard</Standard>
    <Standard x="360" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="720" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="2">Standard</Standard>
    <Standard x="580" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="480" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="240" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="300" y="-340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="6">Standard</Standard>
    <Standard x="620" y="-220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="700" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="520" y="-460" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="3">Standard</Standard>
    <Standard x="320" y="-360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="420" y="-340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="9" h="2">Standard</Standard>
    <Standard x="380" y="-320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="1">Standard</Standard>
    <Standard x="20" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="240" y="-460" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="760" y="-300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="-80" y="-420" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Standard</Standard>
    <Standard x="-140" y="-340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="1">Standard</Standard>
    <Standard x="-240" y="-400" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="2">Standard</Standard>
    <Standard x="-200" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="-80" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Standard</Standard>
    <Standard x="-140" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="-180" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="-320" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="-60" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="-100" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="-80" y="200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="3">Standard</Standard>
    <Standard x="-360" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="3">Standard</Standard>
    <Standard x="-400" y="-320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Standard</Standard>
    <Standard x="-400" y="-140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="3">Standard</Standard>
    <Standard x="-340" y="-700" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="19">Standard</Standard>
    <Standard x="-180" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Standard</Standard>
    <Standard x="-260" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="2">Standard</Standard>
    <Standard x="-360" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="4">Standard</Standard>
    <Standard x="-640" y="-300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="12" h="14">Standard</Standard>
    <Standard x="-440" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="3">Standard</Standard>
    <Standard x="-520" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="2">Standard</Standard>
    <Standard x="-540" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="4">Standard</Standard>
    <Standard x="-420" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="-420" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="1">Standard</Standard>
    <Standard x="-380" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="-280" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="-220" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="4">Standard</Standard>
    <Standard x="-180" y="220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="5">Standard</Standard>
    <Standard x="-140" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="1">Standard</Standard>
    <Standard x="-120" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="-80" y="320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="2">Standard</Standard>
    <Standard x="-60" y="340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="2">Standard</Standard>
    <Standard x="-40" y="380" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="60" y="360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="4">Standard</Standard>
    <Standard x="200" y="360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Standard</Standard>
    <Standard x="160" y="420" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="360" y="380" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="260" y="440" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="500" y="260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="6">Standard</Standard>
    <Standard x="580" y="320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="6">Standard</Standard>
    <Standard x="440" y="440" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="680" y="280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Standard</Standard>
    <Standard x="640" y="360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="4">Standard</Standard>
    <Standard x="740" y="340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="3">Standard</Standard>
    <Standard x="840" y="280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="3">Standard</Standard>
    <Standard x="900" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="7">Standard</Standard>
    <Standard x="1000" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="1080" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="11">Standard</Standard>
    <Standard x="980" y="320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="840" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="840" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="1">Standard</Standard>
    <Standard x="1100" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="3">Standard</Standard>
    <Standard x="1040" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="1200" y="-340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="1120" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="7">Standard</Standard>
    <Cloud x="914.8465556089872" y="-171.83156120569166" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1058.740304525118" y="-298.90656024850875" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="847.5715561157308" y="-358.7065597980697" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="978.3840551303956" y="-439.0628091927923" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Standard x="1220" y="-340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="23" h="1">Standard</Standard>
    <Standard x="1660" y="-700" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="18">Standard</Standard>
    <Standard x="-340" y="-720" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="100" h="1">Standard</Standard>
    <EndLevel x="1492" y="-360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="1520" y="-340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <GroundZero x="-680" y="-740" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="125" h="65">GroundZero</GroundZero>
  </platforms>
  <collectables>
    <BubbleBonus x="40" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="120" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="200" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="200" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="120" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="120" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="200" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="120" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="140" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="160" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="200" y="-400">BubbleBonus</BubbleBonus>
    <DiamondBonus x="120" y="-440">DiamondBonus</DiamondBonus>
    <BubbleBonus x="100" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="20" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="400" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="340" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="620" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="760" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="800" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="800" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="460" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="320" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="800" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="760" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="720" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="680" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="600" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="600" y="-140">BubbleBonus</BubbleBonus>
    <DiamondBonus x="800" y="-260">DiamondBonus</DiamondBonus>
    <BubbleBonus x="380" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="440" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="640" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="720" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="800" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="600" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="660" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="620" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="300" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="300" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="340" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="320" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="220" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="120" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="20" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-220" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-120" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-280" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-340" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-360" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-380" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-380" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-380" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-380" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-380" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-380" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-380" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-340" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-360" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-200" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-160" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-180" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-100" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-60" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-20" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-280" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-240" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-160" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-20" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-60" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-60" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-20" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-140" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-220" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-300" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-380" y="20">BubbleBonus</BubbleBonus>
    <DiamondBonus x="-500" y="0">DiamondBonus</DiamondBonus>
    <BubbleBonus x="-380" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-360" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-400" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-300" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-220" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-120" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-160" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-120" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-100" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="140" y="340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="180" y="380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="420" y="340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="460" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="460" y="340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="480" y="400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="540" y="400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="540" y="360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="540" y="320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="560" y="380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="560" y="340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="560" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="640" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="660" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="700" y="320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="720" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="780" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="800" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="880" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="880" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="860" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="920" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="960" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="980" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1040" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="860" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="880" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="900" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="920" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="960" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="980" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1040" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="900" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="860" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="900" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="920" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="920" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="860" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="880" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="880" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="960" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="960" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="980" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="980" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1100" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1080" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1040" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1160" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1180" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1160" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1140" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1180" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1180" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="920" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="980" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1100" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1120" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1140" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="880" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="900" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="920" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="940" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="980" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1200" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1240" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1280" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1320" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1360" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1440" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1580" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1620" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1600" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1580" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1620" y="-400">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>2</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get8_2():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="3">Standard</Standard>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="200" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="16" h="4">Standard</Standard>
    <Standard x="400" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="520" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="12" h="5">Standard</Standard>
    <Standard x="760" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="10">Standard</Standard>
    <Standard x="1060" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="15">Standard</Standard>
    <Standard x="1080" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="1280" y="-500" angle="-20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="25" h="1">Standard</Standard>
    <Standard x="1750" y="-670" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="1850" y="-670" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="25" h="1">Standard</Standard>
    <Standard x="2320" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="2340" y="-300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2540" y="-300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="7">Standard</Standard>
    <Standard x="2560" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2760" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="5">Standard</Standard>
    <Standard x="2780" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2980" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="3">Standard</Standard>
    <Standard x="3000" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="3060" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="3140" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="3160" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="10">Standard</Standard>
    <Standard x="3220" y="-220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="10">Standard</Standard>
    <Standard x="3280" y="-780" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="35">Standard</Standard>
    <Standard x="3060" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="2900" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="7">Standard</Standard>
    <Standard x="2920" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2700" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2600" y="-80" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="2500" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="2680" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="5">Standard</Standard>
    <Standard x="2440" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="2380" y="-160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="2320" y="-220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="2240" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Standard</Standard>
    <Standard x="2240" y="-420" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="9">Standard</Standard>
    <Standard x="1820" y="-580" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="23" h="1">Standard</Standard>
    <Standard x="1740" y="-580" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="3">Standard</Standard>
    <Standard x="1680" y="-540" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="1580" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="1400" y="-520" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="7">Standard</Standard>
    <Standard x="1340" y="-340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="2">Standard</Standard>
    <Standard x="1140" y="-400" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="5">Standard</Standard>
    <Standard x="1740" y="-480" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="10">Standard</Standard>
    <Standard x="1080" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="1140" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="5">Standard</Standard>
    <Standard x="1240" y="-300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="3">Standard</Standard>
    <Standard x="1180" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="1">Standard</Standard>
    <Standard x="1300" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="3">Standard</Standard>
    <Standard x="1380" y="-300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="1140" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="3">Standard</Standard>
    <Standard x="1180" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="10">Standard</Standard>
    <Standard x="1260" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="1000" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="9" h="3">Standard</Standard>
    <Standard x="960" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="7">Standard</Standard>
    <Standard x="1460" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="1520" y="-140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="1400" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Standard</Standard>
    <Standard x="1460" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="1560" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="7">Standard</Standard>
    <EndLevel x="1072" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="1100" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <Standard x="1580" y="-140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="1780" y="-240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="6">Standard</Standard>
    <Standard x="1980" y="-380" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2060" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="9" h="1">Standard</Standard>
    <Standard x="1980" y="-140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="2140" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="2060" y="-200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="3">Standard</Standard>
    <Standard x="1920" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="1940" y="-100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="1960" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="1980" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="2">Standard</Standard>
    <Standard x="2080" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="1">Standard</Standard>
    <Standard x="2200" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="2240" y="-120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="2200" y="-180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="2300" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="1">Standard</Standard>
    <Standard x="2340" y="-60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="2400" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2360" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="27" h="1">Standard</Standard>
    <Standard x="2580" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="6">Standard</Standard>
    <Standard x="2280" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="4">Standard</Standard>
    <Standard x="2240" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="7">Standard</Standard>
    <Standard x="2140" y="60" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="6">Standard</Standard>
    <Standard x="2040" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="2">Standard</Standard>
    <Standard x="2000" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="4">Standard</Standard>
    <Standard x="1940" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="7">Standard</Standard>
    <Standard x="1900" y="20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="8">Standard</Standard>
    <Standard x="1820" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="5">Standard</Standard>
    <Standard x="1540" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="14" h="1">Standard</Standard>
    <Standard x="1520" y="-20" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <EndLevel x="1612" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="1640" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <Standard x="1920" y="-360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="6">Standard</Standard>
    <TreeBelow x="20" y="-125" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeBelow</TreeBelow>
    <TreeZero x="1790" y="-799" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeZero x="1080" y="-630" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeZero x="1230" y="-620" angle="-20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeZero x="1400" y="-682" angle="-20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeBelow x="1354" y="-660" angle="-20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeBelow</TreeBelow>
    <TreeZero x="2015" y="-747" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeZero x="2460" y="-430" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeBelow x="2265" y="-650" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeBelow</TreeBelow>
    <TreeBelow x="2600" y="-285" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeBelow</TreeBelow>
    <TreeZero x="2810" y="-190" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <GroundZero x="900" y="-80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="125" h="15">GroundZero</GroundZero>
    <GroundZero x="2240" y="-300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="16" h="12">GroundZero</GroundZero>
    <GroundZero x="1900" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="17" h="10">GroundZero</GroundZero>
    <TreeZero x="1460" y="-470" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <TreeZero x="1940" y="-380" angle="203" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TreeZero</TreeZero>
    <GroundZero x="1740" y="-580" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="5">GroundZero</GroundZero>
    <GroundZero x="1060" y="-320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="39" h="14">GroundZero</GroundZero>
    <GroundBelow x="1060" y="-200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="6" h="8">GroundBelow</GroundBelow>
  </platforms>
  <collectables>
    <BubbleBonus x="40" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="360" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="380" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="420" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="460" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="480" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="680" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="720" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="760" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="800" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1000" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1060" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1120" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1380" y="-580">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1480" y="-600">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1580" y="-640">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1700" y="-680">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1840" y="-700">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1940" y="-660">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2000" y="-660">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2080" y="-640">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2120" y="-600">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2180" y="-580">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2260" y="-580">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2280" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="-540">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-320">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2380" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2420" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2380" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2360" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2380" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2420" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2440" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2420" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2400" y="-340">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2760" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2760" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2760" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2760" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2760" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2760" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2740" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2780" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2740" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2780" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2740" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2780" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2720" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2800" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2760" y="-300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2840" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2860" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2860" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2880" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2840" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2860" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2880" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3120" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3120" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3120" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3120" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3120" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3100" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3100" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3000" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="3020" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2940" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2960" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2960" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2960" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2960" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2440" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2460" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2480" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2500" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2500" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2480" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2460" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2440" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2460" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2480" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2500" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1480" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1500" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1520" y="-520">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1540" y="-500">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1540" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1520" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1540" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1540" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1520" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1500" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1480" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1340" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1320" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1300" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1320" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1340" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1360" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1360" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1360" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1360" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1360" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1360" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1640" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1640" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1660" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1680" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1700" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1700" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1680" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1660" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1640" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1660" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1640" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1680" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1700" y="-260">BubbleBonus</BubbleBonus>
    <DiamondBonus x="1760" y="-500">DiamondBonus</DiamondBonus>
    <BubbleBonus x="1920" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1900" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1900" y="-480">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1880" y="-460">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1880" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1880" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1900" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1920" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1920" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1980" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2000" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2020" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2000" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2000" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2640" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2660" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2620" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2640" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2660" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2620" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2640" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2060" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2080" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2100" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2080" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2060" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2080" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2100" y="120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2120" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2120" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2120" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2100" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="2120" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1600" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1620" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1620" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1620" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1620" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1660" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1660" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1680" y="-20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1700" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1700" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1680" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="-60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1300" y="-620">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1260" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1340" y="-600">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>7</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
		
		private static function get8_3():XML {
			return new XML(<actors>
  <platforms>
    <Standard x="0" y="0" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="10">Standard</Standard>
    <Standard x="0" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="200" y="20" angle="10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="4">Standard</Standard>
    <Standard x="380" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="4">Standard</Standard>
    <Standard x="580" y="60" angle="19.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="4">Standard</Standard>
    <Standard x="840" y="140" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="4">Standard</Standard>
    <Standard x="1040" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="1100" y="180" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="1240" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="7">Standard</Standard>
    <Standard x="1080" y="300" angle="-20.000000000000007" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="4">Standard</Standard>
    <Standard x="1420" y="-460" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="29">Standard</Standard>
    <Standard x="920" y="360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="4">Standard</Standard>
    <Standard x="900" y="340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="880" y="320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="860" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="720" y="280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="1">Standard</Standard>
    <Standard x="540" y="360" angle="-20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="340" y="360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="340" y="220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="7">Standard</Standard>
    <Standard x="440" y="120" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="320" y="240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="300" y="260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="280" y="280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="260" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="240" y="320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="220" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="200" y="320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="180" y="340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="160" y="320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="140" y="300" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="120" y="320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="100" y="340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="60" y="360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="20" y="320" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="-20" y="280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="-200" y="100" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="-140" y="160" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="-40" y="260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="-60" y="240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="-80" y="220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="1">Standard</Standard>
    <Standard x="-140" y="40" angle="-20.000000000000007" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="8" h="1">Standard</Standard>
    <Standard x="-200" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="7">Standard</Standard>
    <Standard x="-340" y="-40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="7" h="1">Standard</Standard>
    <Standard x="-340" y="-440" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="20">Standard</Standard>
    <Standard x="-260" y="-280" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="9">Standard</Standard>
    <Standard x="-240" y="-280" angle="-20.000000000000007" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="-60" y="-340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="3" h="3">Standard</Standard>
    <Standard x="-120" y="-420" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="-340" y="-440" angle="-29.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="20" h="1">Standard</Standard>
    <Standard x="-120" y="-560" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="7">Standard</Standard>
    <Standard x="-40" y="-500" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="2" h="2">Standard</Standard>
    <Standard x="0" y="-840" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="11">Standard</Standard>
    <Standard x="20" y="-500" angle="-20.000000000000007" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="200" y="-560" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="400" y="-560" angle="19.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="25" h="1">Standard</Standard>
    <Standard x="860" y="-380" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="1060" y="-380" angle="-20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="1">Standard</Standard>
    <Standard x="1340" y="-480" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Cloud x="487.3224128308856" y="-628.2349177458403" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="712.9228226471741" y="-555.1620834489096" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="659.0595281959868" y="-799.9720331109417" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="839.7951323260374" y="-708.9660403533668" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="970.8156815064734" y="-552.6093206787111" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1186.460316518988" y="-812.799666031189" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1250.5984811202245" y="-603.8560332904452" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Cloud x="1008.3412942283908" y="-873.0448674078724" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">Cloud</Cloud>
    <Standard x="1540" y="-480" angle="1" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="1739.623439038341" y="-475.3202083683573" angle="2" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="1938.570157410006" y="-467.8834407940189" angle="10" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2131.662399180596" y="-431.5434914414003" angle="20" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2317.265130344405" y="-362.6083480395536" angle="29.999999999999996" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2480" y="-259.86492084230986" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="25">Standard</Standard>
    <Standard x="2620.4563473611133" y="-259.31447819444463" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="5">Standard</Standard>
    <Standard x="2602.024955138891" y="-157.33787972222228" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="2635.174619305558" y="-263.02759847222245" angle="-30.000000000000004" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2809.0034347242113" y="-361.9777198419865" angle="-40" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="10" h="1">Standard</Standard>
    <Standard x="2965.839705449197" y="-1480" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="50">Standard</Standard>
    <Standard x="2580" y="40" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="10">Standard</Standard>
    <Standard x="2400" y="360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="15" h="1">Standard</Standard>
    <Standard x="2400" y="240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="6">Standard</Standard>
    <Standard x="2400" y="220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="4" h="1">Standard</Standard>
    <Standard x="2600" y="220" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="5" h="1">Standard</Standard>
    <Standard x="2680" y="240" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="1" h="6">Standard</Standard>
    <EndLevel x="2512" y="340" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">EndLevel</EndLevel>
    <TopHat x="2540" y="360" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="false" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">TopHat</TopHat>
    <SpringBush x="470" y="15" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="400" y="15" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="540" y="15" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1060" y="135" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1120" y="155" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1270" y="95" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1310" y="95" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1350" y="95" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1390" y="95" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <SpringBush x="1230" y="95" angle="0" density="0" friction="0.2" restitution="0.7" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false">SpringBush</SpringBush>
    <GroundZero x="-620" y="-700" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="32" h="50">GroundZero</GroundZero>
    <GroundZero x="20" y="80" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="30" h="15">GroundZero</GroundZero>
    <GroundZero x="620" y="200" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="35" h="15">GroundZero</GroundZero>
    <GroundZero x="2260" y="-260" angle="0" density="0" friction="0.2" restitution="0.3" groupIndex="-2" isSensor="true" linearDamping="0" angularDamping="0" jumpThrough="false" fixedRotation="false" bullet="false" w="30" h="40">GroundZero</GroundZero>
  </platforms>
  <collectables>
    <BubbleBonus x="1240" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1260" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1280" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1300" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1320" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1340" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1360" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1380" y="0">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="20">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1240" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1260" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1280" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1300" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1320" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1340" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1360" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1380" y="-100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1240" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1260" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1280" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1300" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1320" y="-280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1340" y="-260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1360" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1380" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1400" y="-200">BubbleBonus</BubbleBonus>
    <DiamondBonus x="1320" y="-380">DiamondBonus</DiamondBonus>
    <DiamondBonus x="1040" y="-900">DiamondBonus</DiamondBonus>
    <DiamondBonus x="2440" y="320">DiamondBonus</DiamondBonus>
    <BubbleBonus x="500" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="540" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="520" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="540" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="240" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="240" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="240" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="240" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="240" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="240" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="260" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="280" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="300" y="200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="240" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="500" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="540" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="520" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="520" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="520" y="180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="540" y="160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="540" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="520" y="140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="540" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="520" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="300">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="40" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="60" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="80" y="220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="120" y="260">BubbleBonus</BubbleBonus>
    <BubbleBonus x="100" y="280">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-20" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-20" y="40">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-40" y="60">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-60" y="80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="100">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-160" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-160" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-140" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-120" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-100" y="-240">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="-220">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="-200">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-80" y="-180">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-100" y="-160">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-120" y="-140">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-120" y="-120">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-120" y="-80">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-180" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-220" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-240" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-200" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-220" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-200" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-180" y="-440">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-160" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-220" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-200" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-180" y="-420">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-240" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-220" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-200" y="-360">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-180" y="-380">BubbleBonus</BubbleBonus>
    <BubbleBonus x="-160" y="-400">BubbleBonus</BubbleBonus>
    <BubbleBonus x="520" y="-660">BubbleBonus</BubbleBonus>
    <BubbleBonus x="760" y="-580">BubbleBonus</BubbleBonus>
    <BubbleBonus x="880" y="-740">BubbleBonus</BubbleBonus>
    <BubbleBonus x="700" y="-820">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1240" y="-840">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1020" y="-560">BubbleBonus</BubbleBonus>
    <BubbleBonus x="1300" y="-620">BubbleBonus</BubbleBonus>
  </collectables>
  <characters/>
  <spawn>
    <x>7</x>
    <y>-2</y>
  </spawn>
</actors>);
		}
	}
}
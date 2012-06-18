package
{
	import flash.display.Stage;
	import org.flixel.*;
	import flash.net.SharedObject;

	public class Reg
	{
		public static var sharedOBJ:SharedObject;
		public static var totalGuesses:int;

		public function Reg()
		{
		}
		
		public static function initShare(): void
		{
			Reg.totalGuesses = 0;
			sharedOBJ = SharedObject.getLocal("sv");
			Reg.load();
		}
		
		public static function save(): void
		{
			var saveData : XML = <data>
								 </data>;
			
			var guessesXML:XML = <guesses />
			guessesXML.@total = totalGuesses.toString();
			
			saveData.appendChild(guessesXML);
			
			sharedOBJ.data.saveXML = saveData;
			sharedOBJ.flush();
		}
		
		public static function load(): void
		{
			if (sharedOBJ.data.saveXML != undefined)
			{
				var xml : XML = sharedOBJ.data.saveXML;
				for each(var g : XML in xml.guesses)
				{
					totalGuesses = g.@total;
				}
			}
		}
		

	}
}

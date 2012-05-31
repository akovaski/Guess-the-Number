package
{
	import org.flixel.*;
	[SWF(width="480", height="640", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class guessthenumber extends FlxGame
	{
		public function guessthenumber()
		{
			useSoundHotKeys = false;
			useSystemCursor = true;
			super(240,320,MenuState,2,60,30,true);
		}
	}
}

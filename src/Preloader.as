package
{
	import org.flixel.system.FlxPreloader;

	public class Preloader extends FlxPreloader
	{
		public function Preloader()
		{
			QuickKong.connectToKong(stage);
			
			className = "guessthenumber";
			super();
		}
	}
}

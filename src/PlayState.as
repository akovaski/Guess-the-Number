package
{
	import org.flixel.*;

	public class PlayState extends SubMenuState
	{
		public var digiL: Digit;
		public var digiR: Digit;
		
		override public function create():void
		{
			digiL = new Digit(40, 40, 3);
			add(digiL);
			
			digiR = new Digit(FlxG.width - 64 - 40, 40, 2);
			add(digiR);
			
			digiL.increment();
			super.create();
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}

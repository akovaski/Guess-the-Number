package
{
	import org.flixel.*;

	public class SubMenuState extends FlxState
	{
		override public function create():void
		{
			var b:FlxButton;
			b = new FlxButton(5, FlxG.height-20-5, "Back", backButton);
			add(b);
		}

		override public function update():void
		{
			super.update();
		}
		
		protected function backButton(): void
		{
			FlxG.switchState(new MenuState());
		}
	}
}

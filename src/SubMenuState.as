package
{
	import org.flixel.*;

	public class SubMenuState extends FlxState
	{
		var backButton: FlxButton;
		override public function create():void
		{
			backButton = new FlxButton(5, FlxG.height-20-5, "Back", backButton);
			add(backButton);
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

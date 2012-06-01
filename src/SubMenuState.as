package
{
	import org.flixel.*;

	public class SubMenuState extends FlxState
	{
		public var backButton: FlxButton;
		override public function create():void
		{
			backButton = new FlxButton(5, FlxG.height-20-5, "Back", backButtonAlert);
			add(backButton);
		}

		override public function update():void
		{
			super.update();
		}
		
		protected function backButtonAlert(): void
		{
			FlxG.switchState(new MenuState());
		}
	}
}

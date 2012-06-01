package
{
	import org.flixel.*;

	public class SubMenuState extends FlxState
	{
		public var backButton: FlxButton;
		override public function create():void
		{
			backButton = new FlxButton(5, FlxG.height-20-5, "Main Menu", backButtonAlert);
			add(backButton);
		}

		override public function update():void
		{
			super.update();
		}
		
		protected function backButtonAlert(): void
		{
			FlxG.camera.fade(0xff000000, 1, toMenuScreen);
		}
		
		protected function toMenuScreen(): void
		{
			FlxG.switchState(new MenuState());
		}
	}
}

package
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{
		[Embed(source="data/tri_dia_tiny.PNG")] protected var AkaskiLogo:Class;
		
		override public function create():void
		{
			FlxG.bgColor = 0xff000000;
			var t:FlxText;
			t = new FlxText(0,30,FlxG.width,"Guess the Number");
			t.size = 16;
			t.alignment = "center";
			add(t);
			
			var b:FlxButton;
			b = new FlxButton(80, 150, "Play", startButton);
			add(b);
			
			b = new FlxButton(80, 180, "Credits", creditsButton);
			add(b);
			
			var akaskiLogo: FlxSprite = new FlxSprite(5, FlxG.height - 45 );
			akaskiLogo.loadGraphic(AkaskiLogo);
			add(akaskiLogo);
			FlxG.camera.flash(0xff000000, 1);
			
			Reg.initShare();
		}

		override public function update():void
		{
			super.update();
		}
		
		private function startButton(): void
		{
			FlxG.camera.fade(0xff111111, 1, toPlayState);
		}
		
		private function toPlayState(): void
		{
			FlxG.switchState(new PlayState());
		}
		
		private function creditsButton(): void
		{
			FlxG.camera.fade(0xff0000000, 1, toCreditsState);
		}
		
		private function toCreditsState(): void
		{
			FlxG.switchState(new CreditsState());
		}
	}
}

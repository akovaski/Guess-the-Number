package
{
	import org.flixel.*;

	public class CreditsState extends SubMenuState
	{
		override public function create():void
		{
			var t:FlxText;
			t = new FlxText(0,20,FlxG.width,"Credits:");
			t.size = 16;
			t.alignment = "center";
			add(t);
			
			t = new FlxText(0, 60, FlxG.width, "Matt Kovars (akaski)");
			t.size = 16;
			t.alignment = "center";
			add(t);
			
			t = new FlxText(0, FlxG.height-40, FlxG.width, "Akaski Studios");
			t.size = 8;
			t.alignment = "center";
			add(t);
			
			super.create();
			FlxG.flash(0xff000000, 1);
		}

		override public function update():void
		{
			super.update();
		}
	}
}

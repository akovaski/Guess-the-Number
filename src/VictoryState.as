package
{
	import org.flixel.*;

	public class VictoryState extends SubMenuState
	{
		public var guesses: uint;
		public var time: uint;
		public function VictoryState(t_guesses: uint, t_time: uint)
		{
			guesses = t_guesses;
			time = t_time;
		}
		
		override public function create():void
		{
			var t:FlxText;
			t = new FlxText(0,20,FlxG.width,"Victory!");
			t.color = 0xff00ff00;
			t.size = 32;
			t.alignment = "center";
			add(t);
			
			t = new FlxText(0, 80, FlxG.width, "It took you " + guesses + " guesses");
			t.size = 16;
			t.alignment = "center";
			add(t);
			
			var comment: String;
			if( guesses == 1)
				comment = "ACE! Incredible luck! Bet for me in Vegas, will ya'?";
			else if( guesses < 4 )
				comment = "Wow, you're good!";
			else if( guesses < 10 )
				comment = "You're getting the hang of this!";
			else if( guesses < 15 )
				comment = "Keep on trying, you can do it!";
			else if( guesses < 20 )
				comment = "...Maybe someone should google search \"binary search\"...";
			else
				comment = "Really? " + guesses + " really? It took you that many guesses?";
			
			t = new FlxText(0, 120, FlxG.width, comment);
			t.size = 16;
			t.alignment = "center";
			add(t);
			
			var replay: FlxButton = new FlxButton( FlxG.width/2 - 40, 190, "Replay", playAlert);
			add(replay);
			
			super.create();
			FlxG.camera.flash(0xff111111, 1);
		}
		
		public function playAlert(): void
		{
			FlxG.switchState(new PlayState());
		}

		override public function update():void
		{
			super.update();
		}
	}
}

package
{
	import org.flixel.*;

	public class PlayState extends SubMenuState
	{
		
		[Embed(source="data/upButton.png")] protected var ButtonImgBox:Class;
		[Embed(source="data/guessButton.png")] protected var GuessImgBox:Class;
		
		public var digiL: Digit;
		public var digiR: Digit;
		public var buttons: Array;
		public var solution: int;
		public var guesses: uint;
		public var guessText: FlxText;
		public var fadeInClue: Boolean;
		public var fadeOutClue: Boolean;
		public var clue: FlxText;
		
		override public function create():void
		{
			FlxG.bgColor = 0xff111111;
			
			solution = int(FlxG.random()*100);
			guesses = 0;
			
			fadeInClue = false;
			fadeOutClue = false;
			
			var digiHeight:int = 45;
			var digiSpacing:int = 16;
			
			var blkBorder:int = 3;
			var blkSB:int = 42; //black side border
			
			var black:FlxSprite = new FlxSprite(blkSB,digiHeight - blkBorder);
			black.makeGraphic(FlxG.width - 2*blkSB, 112 + 2*blkBorder, 0xff333333);
			black.alpha = 0.7;
			add(black);
			
			digiL = new Digit(FlxG.width/2 - 64 - digiSpacing/2, digiHeight, 5);
			add(digiL);
			
			digiR = new Digit(FlxG.width/2 + digiSpacing/2, digiHeight, 0);
			add(digiR);
			
			buttons = new Array();
			
			buttons[0] = new FlxButton(digiL.x - 8, digiL.y - 35, null, lIncrement);
			buttons[0].loadGraphic(ButtonImgBox, true, false, 80, 30);
			add(buttons[0]);
			
			buttons[1] = new FlxButton(digiR.x - 8, digiR.y - 35, null, rIncrement);
			buttons[1].loadGraphic(ButtonImgBox, true, false, 80, 30);
			add(buttons[1]);
			
			buttons[2] = new FlxButton(digiL.x - 8, digiL.y + digiL.height + 5, null, lDecrement);
			buttons[2].loadGraphic(ButtonImgBox, true, false, 80, 30);
			buttons[2].angle = 180;
			add(buttons[2]);
			
			buttons[3] = new FlxButton(digiR.x - 8, digiR.y + digiR.height + 5, null, rDecrement);
			buttons[3].loadGraphic(ButtonImgBox, true, false, 80, 30);
			buttons[3].angle = 180;
			add(buttons[3]);
			
			buttons[4] = new FlxButton(blkSB,buttons[3].y + buttons[3].height + 5, null, guessAlert);
			buttons[4].loadGraphic(GuessImgBox, true, false, 156, 40);
			add(buttons[4]);
			
			guessText = new FlxText(0, buttons[4].y + buttons[4].height + 5, FlxG.width, "Guesses: " + guesses);
			guessText.alignment = "center";
			add(guessText);
			
			clue = new FlxText(0, guessText.y + guessText.height, FlxG.width, "No Clue");
			clue.size = 32;
			clue.alignment = "center";
			clue.alpha = 0;
			add(clue);
			
			super.create();
		}
		
		override public function update():void
		{
			super.update();
			if( fadeInClue ) {
				fade(clue, 0.06);
				if (clue.alpha == 1) {
					fadeInClue = false;
					fadeOutClue = true;
				}
			} else if ( fadeOutClue ) {
				fade(clue, -0.007);
				if (clue.alpha == 0) {
					fadeOutClue = false;
				}
			}
		}
		
		public function guessAlert(): void
		{
			guesses += 1;
			guessText.text = "Guesses: " + guesses;
			var guess: int = digiL.num*10 + digiR.num;
			if( guess == solution) {
				clue.text = "CORRECT!";
				clue.color = 0xff00ff00;
			} else if (guess < solution) {
				clue.text = "TOO LOW";
				clue.color = 0xff0000ff;
			} else {
				clue.text = "TOO HIGH";
				clue.color = 0xffff0000;
			}
			clue.alpha = 0;
			fadeInClue = true;
			buttons[4].status = FlxButton.HIGHLIGHT;
		}
		
		public function lIncrement(): void
		{
			digiL.increment();
			buttons[0].status = FlxButton.HIGHLIGHT;
		}
		
		public function rIncrement(): void
		{
			digiR.increment();
			buttons[1].status = FlxButton.HIGHLIGHT;
		}
		
		public function lDecrement(): void
		{
			digiL.decrement();
			buttons[2].status = FlxButton.HIGHLIGHT;
		}
		
		public function rDecrement(): void
		{
			digiR.decrement();
			buttons[3].status = FlxButton.HIGHLIGHT;
		}
		
		public function fade( sprite:FlxSprite, diff:Number): void
		{
			if( diff < 0 && sprite.alpha < -diff )
				sprite.alpha = 0;
			else if( diff > 0 && sprite.alpha >= 1 - diff )
				sprite.alpha = 1;
			else
				sprite.alpha += diff;
		}
	}
}

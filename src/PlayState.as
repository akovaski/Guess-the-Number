package
{
	import org.flixel.*;

	public class PlayState extends SubMenuState
	{
		
		[Embed(source="data/upButton.png")] protected var ButtonImgBox:Class;
		
		public var digiL: Digit;
		public var digiR: Digit;
		public var buttons: Array;
		
		override public function create():void
		{
			FlxG.bgColor = 0xff111111;
			
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
			
			buttons[0] = new FlxButton(digiL.x - 8, digiL.y - 35, null, digiL.increment);
			buttons[0].loadGraphic(ButtonImgBox, true, false, 80, 30);
			add(buttons[0]);
			
			buttons[1] = new FlxButton(digiR.x - 8, digiR.y - 35, null, digiR.increment);
			buttons[1].loadGraphic(ButtonImgBox, true, false, 80, 30);
			add(buttons[1]);
			
			buttons[2] = new FlxButton(digiL.x - 8, digiL.y + digiL.height + 5, null, digiL.decrement);
			buttons[2].loadGraphic(ButtonImgBox, true, false, 80, 30);
			buttons[2].angle = 180;
			add(buttons[2]);
			
			buttons[3] = new FlxButton(digiR.x - 8, digiR.y + digiR.height + 5, null, digiR.decrement);
			buttons[3].loadGraphic(ButtonImgBox, true, false, 80, 30);
			buttons[3].angle = 180;
			add(buttons[3]);
			
			super.create();
		}
		
		override public function update():void
		{
			super.update();
		}
		
		public function fade( sprite:FlxSprite): void
		{
			sprite.alpha -= 0.1;
		}
	}
}

package
{
	import org.flixel.*;

	public class PlayState extends SubMenuState
	{
		
		[Embed(source="data/upButton.png")] protected var ButtonImgBox:Class;
		
		public var digiL: Digit;
		public var digiR: Digit;
		
		override public function create():void
		{
			digiL = new Digit(40, 40, 3);
			add(digiL);
			
			digiR = new Digit(FlxG.width - 64 - 40, 40, 2);
			add(digiR);
			
			digiL.increment();
			var button: FlxButton = new FlxButton(digiL.x - 8, 5, null, digiL.increment);
			button.loadGraphic(ButtonImgBox, true, false, 80, 30);
			add(button);
			
			button = new FlxButton(digiR.x - 8, 5, null, digiR.increment);
			button.loadGraphic(ButtonImgBox, true, false, 80, 30);
			add(button);
			
			button = new FlxButton(digiL.x - 8, 157, null, digiL.decrement);
			button.loadGraphic(ButtonImgBox, true, false, 80, 30);
			button.angle = 180;
			add(button);
			
			button = new FlxButton(digiR.x - 8, 157, null, digiR.decrement);
			button.loadGraphic(ButtonImgBox, true, false, 80, 30);
			button.angle = 180;
			add(button);
			
			super.create();
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}

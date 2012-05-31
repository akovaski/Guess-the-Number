package
{
	import org.flixel.*;

	public class Digit extends FlxSprite
	{
		[Embed(source="data/numbersBig.png")] protected var ImgBox:Class;
		public var num: int;
		public function Digit (X:Number=0, Y:Number=0, value:int=0)
		{
			value = value%10;
			super(X,Y);
			loadGraphic(ImgBox, true, false, 64, 112);
			frame = value;
		}

		public function newVal(value:int): void
		{
			while( value < 0 ) {
				value += 10;
			}
			num = value%10;
			frame = num;
		}
		
		public function increment(): void
		{
			newVal(num + 1);
		}
		
		public function decrement(): void
		{
			newVal(num - 1);
		}
	}
}

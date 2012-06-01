package
{
	import org.flixel.*;
	import flash.events.*;

	[SWF(width="480", height="640", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class guessthenumber extends FlxGame
	{
		public function guessthenumber()
		{
			super(240,320,MenuState,2,60,30,true);
			useSoundHotKeys = false;
		}
		
		override protected function create(FlashEvent:Event):void
        {
            super.create(FlashEvent);
            stage.removeEventListener(Event.DEACTIVATE, onFocusLost);
            stage.removeEventListener(Event.ACTIVATE, onFocus);
        }
	}
}

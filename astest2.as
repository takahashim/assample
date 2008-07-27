package {
	import flash.display.Sprite;
	import flash.events.Event;

	public class astest2 extends Sprite
	{
		public function astest2()
		{
			this.addEventListener(FooEvent.HOGE, hand);
			trace("a");
			this.dispatchEvent(new FooEvent(FooEvent.HOGE,true));
			trace("b");
		}
		public function hand(e:Event):void
		{
			var dummy:int = 0;
			trace("e");
			for (var i:int = 0; i<10000000;i++) {
				dummy = i;
			}
			trace("f");
			foo();	
		}
		private function foo():void
		{
			//this.stopPropagation();
			trace("g");
		}
	}
}
	import flash.events.Event;
	

class FooEvent extends flash.events.Event
{
	public static const HOGE:String = "hoge";
	
	public function FooEvent(type:String,
									bubbles:Boolean=false, cancelable:Boolean=false)
	{
		trace("c");
		super(type, bubbles, cancelable);
		trace("d");
	}
}
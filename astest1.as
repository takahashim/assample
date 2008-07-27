package {
	import flash.display.Sprite;
	import flash.utils.describeType;

	public class astest1 extends Sprite
	{
		public function astest1()
		{
			trace("Hello, world\n");
			var a:RegExp = /^25[01]$/;
			var obj:Sprite = new Sprite();
			var o2:Object = describeType(a);
			trace("type:"+o2.toString());
		}
	}

}

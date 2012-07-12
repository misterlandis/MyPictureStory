package net.misterlandis 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author John Landis
	 */
	public class SnapShot extends Sprite
	{
		var bitmap:Bitmap = new Bitmap
		public function SnapShot(myData:BitmapData) 
		{
			trace(height);
			bitmap.bitmapData = myData;
			addChild(bitmap);
			
			width = 200;
			scaleY = scaleX;
		}
		
	}

}
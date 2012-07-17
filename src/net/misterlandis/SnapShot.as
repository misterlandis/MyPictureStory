package net.misterlandis 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author John Landis
	 */
	public class SnapShot extends Sprite
	{
		public var bitmap:Bitmap = new Bitmap
		private var draggable:Boolean = true;
		
		public function SnapShot(myData:BitmapData) 
		{
			trace(height);
			bitmap.bitmapData = myData;
			addChild(bitmap);
			
			width = 200;
			scaleY = scaleX;
		
			this.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
		}
		
		private function beginDrag(e:Event):void 
		{
			startDrag();
			stage.addEventListener(MouseEvent.MOUSE_UP, endDrag);
		}
		
		private function endDrag(e:Event):void
		{
			stopDrag();
			stage.removeEventListener(MouseEvent.MOUSE_UP, endDrag);
		}
	}

}
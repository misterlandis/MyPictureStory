package net.misterlandis
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.media.Camera;
	import flash.media.Video;
	
	/**
	 * ...
	 * @author John Landis
	 */
	public class Main extends Sprite 
	{
		var cam:Camera = Camera.getCamera();
		var video:Video = new Video(320, 240);
		var videoData:BitmapData = new BitmapData(320,2400);
		var shutter:Sprite = new Sprite;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			video.attachCamera(cam);
			video.x = 20;
			video.y = 20;
			addChild(video);
			
			shutter.graphics.beginFill(0xFF0000);
			shutter.graphics.drawRect(0, 0, 100, 50);
			shutter.x = 400;
			shutter.y = 100;
			addChild(shutter);
			shutter.addEventListener(MouseEvent.CLICK, shutterclick);
			
			
		}
		
		private function shutterclick(e:Event):void
		{
			videoData.draw(video);
			var newSnapshot = new SnapShot(videoData);
			newSnapshot.x = 0;
			newSnapshot.y = 300;
			addChild(newSnapshot);
			
			
		}
		
	}
	
}
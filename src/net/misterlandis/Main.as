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
		var video:Video = new Video(320,240);
		var videoData:BitmapData = new BitmapData(320,240);
		var shutter:Sprite = new Sprite;
		var snapShotTray:SnapShotTray = new SnapShotTray;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			//set up camera
			cam.setMode(320, 240,15);
			video.attachCamera(cam);
			video.x = 20;
			video.y = 20;
			addChild(video);
			
			//add the shutter button
			shutter.graphics.beginFill(0xFF0000);
			shutter.graphics.drawRect(0, 0, 100, 50);
			shutter.x = 400;
			shutter.y = 100;
			addChild(shutter);
			shutter.addEventListener(MouseEvent.CLICK, shutterclick);
			
			//add the snapshot tray
			
			snapShotTray.y = 300;
			addChild(snapShotTray);
			
			
		}
		
		private function shutterclick(e:Event):void
		{
			videoData = new BitmapData(320, 240);
			videoData.draw(video);
			var newSnapshot = new SnapShot(videoData);
			snapShotTray.addSnapshot(newSnapshot);
		}
		
	}
	
}
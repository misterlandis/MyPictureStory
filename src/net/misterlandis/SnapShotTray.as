package net.misterlandis 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author John Landis
	 */
	public class SnapShotTray extends Sprite
	{
		
		public var snapshotCounter:int = 0;
		public var snapshotWidth:int = 100;
		
		//embed scroll button image
		[Embed(source = "scroll_r.png")]
		public var scrollIcon:Class;
		private var scrollButtonLeft:Sprite = new Sprite;
		private var scrollButtonRight:Sprite = new Sprite;
		private var scrollTrack:Sprite = new Sprite;
		private var scrollThumb:ScrollThumb;
		private var scrollArea:Sprite = new Sprite;
		
		
		public function SnapShotTray() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE,drawElements)
			
			
			
			
		}
		
		public function addSnapshot(newSnapshot:SnapShot)
		{
			
			newSnapshot.width = snapshotWidth;
			newSnapshot.scaleY = newSnapshot.scaleX;
			
			newSnapshot.x = (snapshotCounter * (snapshotWidth * 1.1))+snapshotWidth* .1;
			
			scrollArea.addChild(newSnapshot);
			snapshotCounter ++;	
		}
		
		private function drawElements(e:Event):void
		{
			//add scroll track
			scrollTrack.graphics.beginFill(0x8888FF);
			scrollTrack.graphics.drawRect(0, 6, stage.stageWidth, 10);
			addChild(scrollTrack);
			
			//add scroll area
			addChild(scrollArea);
			
			
			//add scroll Thumb
			scrollThumb = new ScrollThumb(scrollTrack,scrollArea);
			addChild(scrollThumb);
			
			
			
			//add left scroll button
			scrollButtonLeft.addChild(new scrollIcon);
			scrollButtonLeft.scaleX = -1;
			scrollButtonLeft.x = scrollButtonLeft.width;
			scrollButtonLeft.addEventListener(MouseEvent.CLICK, scrollLeft);
			addChild(scrollButtonLeft);
			
			//add right scroll button
			scrollButtonRight.addChild(new scrollIcon);
			scrollButtonRight.x =(stage.stageWidth - scrollButtonRight.width);
			addChild(scrollButtonRight);
			
			trace (stage.stageWidth);
			
		}

		
		private function constrainY(e:Event):void { scrollThumb.y = 64; }
		
		private function scrollLeft(e:Event):void
		{
			scrollArea.x --;
		}
	}

}
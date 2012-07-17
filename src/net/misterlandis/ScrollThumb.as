package net.misterlandis 
{
	import flash.display.Sprite;
	import flash.events.Event
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author John Landis
	 */
	public class ScrollThumb extends Sprite
	{
		private var xOffset: Number;
		private var leftLimit: Number;
		private var rightLimit: Number;
		private var pixelrange: Number;
		public var position:Number;
		private var scrollArea:Sprite;
		
		public function ScrollThumb(track:Sprite,assignedScrollArea:Sprite) 
		{
			scrollArea = assignedScrollArea;
			graphics.beginFill(0x0000FF);
			graphics.drawRect(0, 0, 32, 16);
			y = 64;
			addEventListener(MouseEvent.MOUSE_DOWN, draggingThumb);
			
			leftLimit = track.x;
			rightLimit = track.x + track.width - width;
			pixelrange = track.width - width;
		}
		
		private function draggingThumb(e:MouseEvent):void 
		{
			xOffset = parent.mouseX -x;
			stage.addEventListener(MouseEvent.MOUSE_MOVE, stage_onMouseMove);
			stage.addEventListener(MouseEvent.MOUSE_UP, stage_onMouseUp);
		}
		
		private function stage_onMouseMove(e:MouseEvent):void
		{
			set_x(stage.mouseX - xOffset);
			e.updateAfterEvent();
		}
		
		public function set_x(new_x:Number):void
		{
			x = new_x;
			if (x < leftLimit) { x = leftLimit; }
			if (x > rightLimit) { x = rightLimit; }
			position = ((1 / pixelrange) * x);
			scrollArea.x = position * scrollArea.width * -1;
		}
		
		private function stage_onMouseUp(e:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, stage_onMouseMove);
			stage.removeEventListener(MouseEvent.MOUSE_UP, stage_onMouseUp);
		}
		
	}

}
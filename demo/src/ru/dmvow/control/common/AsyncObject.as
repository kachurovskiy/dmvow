package ru.dmvow.control.common
{
import flash.events.ErrorEvent;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.ProgressEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;

[Event(name="complete", type="flash.events.Event")]
[Event(name="error", type="flash.events.ErrorEvent")]
[Event(name="progress", type="flash.events.ProgressEvent")]
public class AsyncObject extends EventDispatcher
{
	protected static const TIMER_INTERVAL:Number = 1000/24;
	protected static const ITERATIONS_PER_FRAME:Number = 12;
	
	protected var timer:Timer;
	protected var counter:Number;
	protected var maxCounter:Number;
	protected var _paused:Boolean = false;
	protected var timerWasPaused:Boolean = false;
	
	public function AsyncObject()
	{
	}
	
	protected function startProcess():void
	{
		if (!timer)
		{
			timer = new Timer(TIMER_INTERVAL);
			timer.addEventListener(TimerEvent.TIMER, onProcessTimer);
		}
		if (timer.running)
		{
			throw new Error(this + " timer is already running.");
		}
		
		counter = 0;
		maxCounter = -1;
		commonProcessActions();
		if (maxCounter < 0)
			throw new Error("maxCounter is not set");
			
		timer.start();
	}
	
	protected function commonProcessActions():void
	{
		// To be overriden in child classes
	}
	
	protected function processIteration():void
	{
		// To be overriden in child classes
	}
	
	protected function onProcessTimer(event:Event):void
	{
		if (counter < maxCounter)
		{
			//try
			//{
				var upBorder:Number = Math.min(maxCounter, counter + iterationsPerFrame);
				while (counter < upBorder && !_paused)
				{
					processIteration();
					counter++;
				}
				
				reportProgress((counter + 1)/maxCounter);
			//}
			//catch (error:*)
			//{
			//	reportError();
			//}
		}
		else
		{
			timer.stop();
			
			reportComplete();
		}
	}
	
	protected function reportComplete():void
	{
		dispatchEvent(new Event(Event.COMPLETE));
	}
	
	protected function reportError():void
	{
		timer.stop();
		
		dispatchEvent(new ErrorEvent(ErrorEvent.ERROR));
	}
	
	/**
	 * @param value number in [0,1]
	 */
	protected function reportProgress(value:Number):void
	{
		var k:Number = 1000;
		var progressEvent:ProgressEvent = new ProgressEvent(ProgressEvent.PROGRESS, false, false, value * k, 1 * k);
		dispatchEvent(progressEvent);
	}
	
	protected function get iterationsPerFrame():Number
	{
		return ITERATIONS_PER_FRAME;
	}
	
	protected function get paused():Boolean
	{
		return _paused;
	}
	
	protected function set paused(value:Boolean):void
	{
		if (_paused == value)
			return;
		
		_paused = value;
		
		if (_paused)
		{
			if (timer.running)
			{
				timerWasPaused = true;
				timer.stop();
			}
		}
		else
		{
			if (timerWasPaused)
			{
				timerWasPaused = false;
				timer.start();
			}
		}
	}
}
}
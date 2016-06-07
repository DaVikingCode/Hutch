package hutch.events;

import hutch.display.DisplayObject;

typedef TouchEvent = {

	var target:DisplayObject;
	var globalX:Float;
	var globalY:Float;
}
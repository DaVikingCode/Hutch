package hutch.display;

class DisplayObject {

	public var proxy(default, null):Dynamic;

	// didn't use @:isVar public var alpha(get, set):Float = 1; since Actuate doesn't like it.
	// didn't use default as getter since Actuate doesn't like it.

	var _alpha:Float = 1;
	public var alpha(get, set):Float;

	var _rotation:Float = 0;
	public var rotation(get, set):Float;

	var _visible:Bool = true;
	public var visible(get, set):Bool;

	var _x:Float = 0;
	public var x(get, set):Float;

	var _y:Float = 0;
	public var y(get, set):Float;

	public function new() {

		_initProxy();
	}

	function _initProxy() {

		proxy = new #if starling starling.display.DisplayObject #elseif pixi pixi.core.display.DisplayObject #end ();
	}

	function get_alpha():Float {

		return _alpha;
	}

	function set_alpha(value:Float) {

		return _alpha = proxy.alpha = value;
	}

	function get_rotation():Float {

		return _rotation;
	}

	function set_rotation(value:Float) {

		return _rotation = proxy.rotation = value;
	}

	function get_visible():Bool {

		return _visible;
	}

	function set_visible(value:Bool) {

		return _visible = proxy.visible = value;
	}

	function get_x():Float {

		return _x;
	}

	function set_x(value:Float) {

		return _x = proxy.x = value;
	}

	function get_y():Float {

		return _y;
	}

	function set_y(value:Float) {

		return _y = proxy.y = value;
	}
}
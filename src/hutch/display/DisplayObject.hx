package hutch.display;

import ash.signals.Signal0;

class DisplayObject {

	public var proxy(default, null):Dynamic;

	public var onTouchBegan:Signal0;

	// didn't use @:isVar public var alpha(get, set):Float = 1; since Actuate doesn't like it.
	// didn't use default as getter since Actuate doesn't like it.
	// see https://github.com/openfl/actuate/issues/73

	var _alpha:Float = 1;
	public var alpha(get, set):Float;

	var _height:Float;
	public var height(get, set):Float;

	var _mask:DisplayObject;
	public var mask(get, set):DisplayObject;

	var _pivotX:Float = 0;
	public var pivotX(get, set):Float;

	var _pivotY:Float = 0;
	public var pivotY(get, set):Float;

	var _rotation:Float = 0;
	public var rotation(get, set):Float;

	var _scaleX:Float = 1;
	public var scaleX(get, set):Float;

	var _scaleY:Float = 1;
	public var scaleY(get, set):Float;

	var _touchable:Bool = false;
	public var touchable(get, set):Bool;

	var _useHandCursor:Bool = false;
	public var useHandCursor(get, set):Bool;

	var _visible:Bool = true;
	public var visible(get, set):Bool;

	var _width:Float;
	public var width(get, set):Float;

	var _x:Float = 0;
	public var x(get, set):Float;

	var _y:Float = 0;
	public var y(get, set):Float;

	public function new() {

		onTouchBegan = new Signal0();

		_initProxy();

		#if starling
			touchable = false;
		#end
	}

	function _initProxy() {

		proxy = new #if starling starling.display.DisplayObject #elseif pixi pixi.core.display.DisplayObject #end ();
	}

	public function addTouchBeganListener() {

		#if starling
			proxy.addEventListener(starling.events.TouchEvent.TOUCH, _starlingTouchEvent);
		#elseif pixi
			proxy.on('mousedown', _pixiOnTouchBegan).on('touchstart', _pixiOnTouchBegan);
		#end
	}

	#if starling

		function _starlingTouchEvent(tEvt:starling.events.TouchEvent) {

			var began = tEvt.getTouch(proxy, starling.events.TouchPhase.BEGAN);

			if (began != null)
				onTouchBegan.dispatch();
		}

	#elseif pixi

		function _pixiOnTouchBegan() {

			onTouchBegan.dispatch();
		}

	#end

	function get_alpha():Float {

		return _alpha;
	}

	function set_alpha(value:Float) {

		return _alpha = proxy.alpha = value;
	}

	function get_height():Float {

		return _height = proxy.height;
	}

	function set_height(value:Float) {

		return _height = proxy.height = value;
	}

	function get_mask():DisplayObject {

		return _mask;
	}

	function set_mask(value:DisplayObject) {

		proxy.mask = value.proxy;

		return _mask = value;
	}

	function get_pivotX():Float {

		return _pivotX;
	}

	function set_pivotX(value:Float) {

		_pivotX = value;

		#if starling
			proxy.pivotX = value;
		#elseif pixi
			proxy.pivot.x = value;
		#end

		return _pivotX;
	}

	function get_pivotY():Float {

		return _pivotY;
	}

	function set_pivotY(value:Float) {

		_pivotY = value;

		#if starling
			proxy.pivotY = value;
		#elseif pixi
			proxy.pivot.y = value;
		#end

		return _pivotY;
	}

	function get_rotation():Float {

		return _rotation;
	}

	function set_rotation(value:Float) {

		return _rotation = proxy.rotation = value;
	}

	function get_scaleX():Float {

		return _scaleX;
	}

	function set_scaleX(value:Float) {

		_scaleX = value;

		#if starling
			proxy.scaleX = value;
		#elseif pixi
			proxy.scale.x = value;
		#end

		return _scaleX;
	}

	function get_scaleY():Float {

		return _scaleY;
	}

	function set_scaleY(value:Float) {

		_scaleY = value;

		#if starling
			proxy.scaleY = value;
		#elseif pixi
			proxy.scale.y = value;
		#end

		return _scaleY;
	}

	function get_touchable():Bool {

		return _touchable;
	}

	function set_touchable(value:Bool) {

		_touchable = value;

		#if starling
			proxy.touchable = value;
		#elseif pixi
			proxy.interactive = value;
		#end

		return _touchable;
	}

	function get_useHandCursor():Bool {

		return _useHandCursor;
	}

	function set_useHandCursor(value:Bool) {

		_useHandCursor = value;

		#if starling
			proxy.useHandCursor = value;
		#elseif pixi
			proxy.buttonMode = value;
		#end

		return _useHandCursor;
	}

	function get_visible():Bool {

		return _visible;
	}

	function set_visible(value:Bool) {

		return _visible = proxy.visible = value;
	}

	function get_width():Float {

		return _width = proxy.width;
	}

	function set_width(value:Float) {

		return _width = proxy.width = value;
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
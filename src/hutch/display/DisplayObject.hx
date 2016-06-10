package hutch.display;

import hutch.events.TouchEvent;
import hutch.filters.FilterChain;

class DisplayObject {

	public var proxy(default, null):Dynamic;

	public var onTouchBegan:TouchEvent -> Void;
	public var onTouchHover:TouchEvent -> Void;
	public var onTouchEnded:TouchEvent -> Void;
	public var onTouchOut:TouchEvent -> Void;

	// didn't use @:isVar public var alpha(get, set):Float = 1; since Actuate doesn't like it.
	// didn't use default as getter since Actuate doesn't like it.
	// see https://github.com/openfl/actuate/issues/73

	var _alpha:Float = 1;
	public var alpha(get, set):Float;

	var _filter:FilterChain;
	public var filter(get, set):FilterChain;

	var _height:Float;
	public var height(get, set):Float;

	var _mask:DisplayObject;
	public var mask(get, set):DisplayObject;

	var _name:String = null;
	public var name(get, set):String;

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

		_initProxy();

		#if flash
			touchable = false;
		#end
	}

	function _initProxy() {

		proxy = new #if flash starling.display.DisplayObject #elseif js pixi.core.display.DisplayObject #end ();
	}

	function _addTouchListeners() {

		#if flash
			proxy.addEventListener(starling.events.TouchEvent.TOUCH, _starlingTouchEvent);
		#elseif js
			proxy.on('mousedown', _pixiTouchEvent).on('touchstart', _pixiTouchEvent);
			proxy.on('mouseover', _pixiTouchEvent);
			proxy.on('mouseup', _pixiTouchEvent).on('touchend', _pixiTouchEvent).on('mouseupoutside', _pixiTouchEvent).on('touchendoutside', _pixiTouchEvent);
			proxy.on('mouseout', _pixiTouchEvent);
		#end
	}

	function _removeTouchListeners() {

		#if flash
			proxy.removeEventListener(starling.events.TouchEvent.TOUCH, _starlingTouchEvent);
		#elseif js
			proxy.off('mousedown', _pixiTouchEvent).off('touchstart', _pixiTouchEvent);
			proxy.off('mouseover', _pixiTouchEvent);
			proxy.off('mouseup', _pixiTouchEvent).off('touchend', _pixiTouchEvent).off('mouseupoutside', _pixiTouchEvent).off('touchendoutside', _pixiTouchEvent);
			proxy.off('mouseout', _pixiTouchEvent);
		#end
	}

	#if flash

		function _starlingTouchEvent(tEvt:starling.events.TouchEvent) {

			var touch = tEvt.getTouch(proxy);

			if (touch != null) {

				if (onTouchBegan != null && touch.phase == starling.events.TouchPhase.BEGAN)
					onTouchBegan({target:this, globalX:touch.globalX, globalY:touch.globalY});

				if (onTouchHover != null && touch.phase == starling.events.TouchPhase.HOVER)
					onTouchHover({target:this, globalX:touch.globalX, globalY:touch.globalY});

				if (onTouchEnded != null && touch.phase == starling.events.TouchPhase.ENDED)
					onTouchEnded({target:this, globalX:touch.globalX, globalY:touch.globalY});
			}

			if (onTouchOut != null) {

				if (touch != null)
					if (proxy.hitTest(proxy.globalToLocal(new flash.geom.Point(touch.globalX, touch.globalY))) == null)
						onTouchOut({target:this, globalX:touch.globalX, globalY:touch.globalY});
						// could be improved? http://forum.starling-framework.org/topic/touchphasemoved-and-out
				
				if (touch == null)
					onTouchOut({target:this, globalX:0, globalY:0});
			}
		}

	#elseif js

		function _pixiTouchEvent(tEvt:pixi.interaction.EventTarget) {

			tEvt.stopPropagation();

			if (onTouchBegan != null && (tEvt.type == 'touchstart' || tEvt.type == 'mousedown'))
				onTouchBegan({target:this, globalX:tEvt.data.global.x, globalY:tEvt.data.global.y});

			if (onTouchHover != null && tEvt.type == 'mouseover')
				onTouchHover({target:this, globalX:tEvt.data.global.x, globalY:tEvt.data.global.y});

			if (onTouchEnded != null && (tEvt.type == 'touchend' || tEvt.type == 'touchendoutside' || tEvt.type == 'mouseup' || tEvt.type == 'mouseupoutside')) {

				onTouchEnded({target:this, globalX:tEvt.data.global.x, globalY:tEvt.data.global.y});

				if (onTouchHover != null && (tEvt.type == 'touchend' || tEvt.type == 'mouseup'))
					onTouchHover({target:this, globalX:tEvt.data.global.x, globalY:tEvt.data.global.y});
			}

			if (onTouchOut != null && tEvt.type == 'mouseout')
				onTouchOut({target:this, globalX:tEvt.data.global.x, globalY:tEvt.data.global.y});
		}

	#end

	@:keep function get_alpha():Float {

		return _alpha;
	}

	@:keep function set_alpha(value:Float) {

		return _alpha = proxy.alpha = value;
	}

	function get_filter():FilterChain {

		return _filter;
	}

	function set_filter(value:FilterChain) {

		#if flash
			proxy.filter = value.proxy;
		#elseif js
			proxy.filters = value.proxy;
		#end

		return _filter = value;
	}

	@:keep function get_height():Float {

		return _height = proxy.height;
	}

	@:keep function set_height(value:Float) {

		return _height = proxy.height = value;
	}

	function get_mask():DisplayObject {

		return _mask;
	}

	function set_mask(value:DisplayObject) {

		proxy.mask = value.proxy;

		return _mask = value;
	}

	function get_name():String {

		return _name;
	}

	function set_name(value:String) {

		return _name = proxy.name = value;
	}

	@:keep function get_pivotX():Float {

		return _pivotX;
	}

	@:keep function set_pivotX(value:Float) {

		_pivotX = value;

		#if flash
			proxy.pivotX = value;
		#elseif js
			proxy.pivot.x = value;
		#end

		return _pivotX;
	}

	@:keep function get_pivotY():Float {

		return _pivotY;
	}

	@:keep function set_pivotY(value:Float) {

		_pivotY = value;

		#if flash
			proxy.pivotY = value;
		#elseif js
			proxy.pivot.y = value;
		#end

		return _pivotY;
	}

	@:keep function get_rotation():Float {

		return _rotation;
	}

	@:keep function set_rotation(value:Float) {

		return _rotation = proxy.rotation = value;
	}

	@:keep function get_scaleX():Float {

		return _scaleX;
	}

	@:keep function set_scaleX(value:Float) {

		_scaleX = value;

		#if flash
			proxy.scaleX = value;
		#elseif js
			proxy.scale.x = value;
		#end

		return _scaleX;
	}

	@:keep function get_scaleY():Float {

		return _scaleY;
	}

	@:keep function set_scaleY(value:Float) {

		_scaleY = value;

		#if flash
			proxy.scaleY = value;
		#elseif js
			proxy.scale.y = value;
		#end

		return _scaleY;
	}

	function get_touchable():Bool {

		return _touchable;
	}

	function set_touchable(value:Bool) {

		_touchable = value;

		#if flash
			proxy.touchable = _touchable;
		#elseif js
			proxy.interactive = _touchable;
		#end

		if (_touchable)
			_addTouchListeners();
		else
			_removeTouchListeners();

		return _touchable;
	}

	function get_useHandCursor():Bool {

		return _useHandCursor;
	}

	function set_useHandCursor(value:Bool) {

		_useHandCursor = value;

		#if flash
			proxy.useHandCursor = value;
		#elseif js
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

	@:keep function get_width():Float {

		return _width = proxy.width;
	}

	@:keep function set_width(value:Float) {

		return _width = proxy.width = value;
	}

	@:keep function get_x():Float {

		return _x;
	}

	@:keep function set_x(value:Float) {

		return _x = proxy.x = value;
	}

	@:keep function get_y():Float {

		return _y;
	}

	@:keep function set_y(value:Float) {

		return _y = proxy.y = value;
	}
}
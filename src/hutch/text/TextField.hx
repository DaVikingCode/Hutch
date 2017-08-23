package hutch.text;

import hutch.display.Sprite;

class TextField extends Sprite {

	var _color:UInt;
	public var color(get, set):UInt;

	var _font:String;
	public var font(get, set):String;

	var _size:UInt;
	public var size(get, set):UInt;

	var _text:String;
	public var text(get, set):String;

	public function new(text:String, font:String, size:UInt, color:UInt) {

		_text = text;
		_font = font;
		_size = size;
		_color = color;

		super();
	}

	override function _initProxy() {

		#if flash

			proxy = new starling.text.TextField(0, 0, _text, new starling.text.TextFormat(_font, _size, _color));
			proxy.autoSize = starling.text.TextFieldAutoSize.BOTH_DIRECTIONS;

		#elseif js

			proxy = new pixi.core.text.Text(_text, {fontSize:_size, fontFamily:_font, fill:_color});

		#end
	}

	function get_color():UInt {

		return _color;
	}

	function set_color(value:UInt) {

		_color = value;

		#if flash
			proxy.format.color = value;
		#elseif js
			proxy.style.fill = value;
		#end

		return _color;
	}

	function get_font():String {

		return _font;
	}

	function set_font(value:String) {

		_font = value;

		#if flash
			proxy.format.font = value;
		#elseif js
			proxy.style.font = _size + 'px ' + value;
		#end

		return _font;
	}

	function get_size():UInt {

		return _size;
	}

	function set_size(value:UInt) {

		_size = value;

		#if flash
			proxy.format.size = value;
		#elseif js
			proxy.style.font = value + 'px ' + _font;
		#end

		return _size;
	}

	function get_text():String {

		return _text;
	}

	function set_text(value:String) {

		return _text = proxy.text = value;
	}
}
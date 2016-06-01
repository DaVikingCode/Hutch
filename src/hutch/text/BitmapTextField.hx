package hutch.text;

class BitmapTextField extends TextField {

	public function new(text:String, font:String, size:UInt, color:UInt) {

		super(text, font, size, color);
	}

	#if pixi
		override function _initProxy() {

			proxy = new pixi.extras.BitmapText(_text, {font:_size + 'px ' + _font, tint:_color});
		}

		override function set_color(value:UInt) {

			_color = value;

			proxy.tint = value;

			return _color;
		}

		override function set_font(value:String) {

			_font = value;

			proxy.font = _size + 'px ' + value;

			return _font;
		}

		override function set_size(value:UInt) {

			_size = value;

			proxy.font = value + 'px ' + _font;

			return _size;
		}
	#end
}
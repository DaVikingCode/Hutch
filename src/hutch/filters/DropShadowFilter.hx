package hutch.filters;

class DropShadowFilter extends AFilter {

	var _alpha:Float;
	public var alpha(get, set):Float;

	var _angle:Float;
	public var angle(get, set):Float;

	var _blur:Float;
	public var blur(get, set):Float;

	var _color:UInt;
	public var color(get, set):UInt;

	var _distance:Float;
	public var distance(get, set):Float;

	public function new(distance:Float = 4.0, angle:Float = 0.785, color:UInt = 0x0, alpha:Float = 0.5, blur:Float = 1.0) {
		super();

		_alpha = alpha;
		_angle = angle;
		_blur = blur;
		_color = color;
		_distance = distance;

		#if flash
			proxy = new starling.filters.DropShadowFilter(_distance, _angle, _color, _alpha, _blur);
		#elseif js
			proxy = new pixi.filters.dropshadow.DropShadowFilter();
			proxy.alpha = _alpha;
			proxy.angle = _angle;
			proxy.blur = _blur;
			proxy.color = _color;
			proxy.distance = _distance;
		#end
	}

	function get_alpha():Float {

		return _alpha;
	}

	function set_alpha(value:Float) {

		return _alpha = proxy.alpha = value;
	}

	function get_angle():Float {

		return _angle;
	}

	function set_angle(value:Float) {

		return _angle = proxy.angle = value;
	}

	function get_blur():Float {

		return _blur;
	}

	function set_blur(value:Float) {

		return _blur = proxy.blur = value;
	}

	function get_color():UInt {

		return _color;
	}

	function set_color(value:UInt) {

		return _color = proxy.color = value;
	}

	function get_distance():Float {

		return _distance;
	}

	function set_distance(value:Float) {

		return _distance = proxy.distance = value;
	}
}
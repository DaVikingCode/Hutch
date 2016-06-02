package hutch.filters;

class BlurFilter extends AFilter {

	var _blurX:Float = 1;
	public var blurX(get, set):Float;

	var _blurY:Float = 1;
	public var blurY(get, set):Float;

	public function new(blurX:Float = 1, blurY:Float = 1) {
		super();

		_blurX = blurX;
		_blurY = blurY;

		#if flash
			proxy = new starling.filters.BlurFilter(_blurX, _blurY);
		#elseif js
			proxy = new pixi.filters.blur.BlurFilter();
			proxy.blurX = _blurX;
			proxy.blurY = _blurY;
		#end
	}

	function get_blurX():Float {

		return _blurX;
	}

	function set_blurX(value:Float) {

		return _blurX = proxy.blurX = value;
	}

	function get_blurY():Float {

		return _blurY;
	}

	function set_blurY(value:Float) {

		return _blurY = proxy.blurY = value;
	}
}
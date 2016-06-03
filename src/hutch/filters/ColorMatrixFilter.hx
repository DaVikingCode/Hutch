package hutch.filters;

class ColorMatrixFilter extends AFilter {

	public function new() {
		super();

		#if flash
			proxy = new starling.filters.ColorMatrixFilter();
		#elseif js
			proxy = new pixi.filters.color.ColorMatrixFilter();
		#end
	}

	public function adjustBrightness(value:Float) {

		#if flash
			proxy.adjustBrightness(value);
		#elseif js
			proxy.brightness(value, false);
		#end
	}

	public function adjustContrast(value:Float) {

		#if flash
			proxy.adjustContrast(value);
		#elseif js
			proxy.contrast(value, false);
		#end
	}

	public function adjustHue(value:Float) {

		#if flash
			proxy.adjustHue(value);
		#elseif js
			proxy.hue(value, false);
		#end
	}

	public function adjustSaturation(value:Float) {

		#if flash
			proxy.adjustSaturation(value);
		#elseif js
			proxy.saturate(value, false);
		#end
	}

	public function invert() {

		#if flash
			proxy.invert();
		#elseif js
			proxy.negative(false);
		#end
	}
}
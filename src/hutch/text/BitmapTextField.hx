package hutch.text;

class BitmapTextField extends TextField {

	public function new(text:String, font:String, size:UInt, color:UInt) {

		super(text, font, size, color);
	}

	override function _initProxy() {

		#if starling
			super._initProxy();

		#elseif pixi
			proxy = new pixi.extras.BitmapText(_text, {font:_size + 'px ' + _font});
		#end
	}
}
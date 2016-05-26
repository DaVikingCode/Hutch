package hutch.text;

class TextField extends 
	#if starling starling.text.TextField
	#elseif pixi pixi.core.text.Text
	#end {

	public function new(text:String) {

		#if starling
			super(0, 0, text);
		#elseif pixi
			super(text, {font : '24px Arial', fill : 0xFF0000, align : 'center'});
		#end
	}
}
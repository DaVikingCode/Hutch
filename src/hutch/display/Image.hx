package hutch.display;

import hutch.textures.Texture;

class Image extends DisplayObject {

	public var texture(default, null):#if starling starling.textures.Texture #elseif pixi pixi.core.textures.Texture #end;

	var _anchorX:Float = 0;
	public var anchorX(get, set):Float;

	var _anchorY:Float = 0;
	public var anchorY(get, set):Float;

	public function new(texture:#if starling starling.textures.Texture #elseif pixi pixi.core.textures.Texture #end) {
		
		this.texture = texture;
		
		super();
	}

	override function _initProxy() {

		proxy = new #if starling starling.display.Image #elseif pixi pixi.core.sprites.Sprite #end(texture);
	}

	function get_anchorX():Float {

		return _anchorX;
	}

	function set_anchorX(value:Float) {

		_anchorX = value;

		#if starling
			proxy.pivotX = value * width;
		#elseif pixi
			proxy.anchor.x = value;
		#end

		return _anchorX;
	}

	function get_anchorY():Float {

		return _anchorY;
	}

	function set_anchorY(value:Float) {

		_anchorY = value;

		#if starling
			proxy.pivotY = value * width;
		#elseif pixi
			proxy.anchor.y = value;
		#end

		return _anchorY;
	}
}
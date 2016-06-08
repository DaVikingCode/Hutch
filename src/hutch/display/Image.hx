package hutch.display;

import hutch.textures.Texture;

class Image extends DisplayObject {

	var _texture:Texture;
	public var texture(get, set):Texture;

	public function new(texture:Texture) {
		
		_texture = texture;
		
		super();
	}

	override function _initProxy() {

		proxy = new #if flash starling.display.Image #elseif js pixi.core.sprites.Sprite #end(_texture.proxy);
	}

	function get_texture():Texture {

		return _texture;
	}

	function set_texture(value:Texture) {

		proxy.texture = value.proxy;

		return _texture = value;
	}
}
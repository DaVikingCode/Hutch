package hutch.display;

import hutch.textures.Texture;

class Image extends DisplayObject {

	var _texture:#if starling starling.textures.Texture #elseif pixi pixi.core.textures.Texture #end;

	public function new(texture:#if starling starling.textures.Texture #elseif pixi pixi.core.textures.Texture #end) {
		
		_texture = texture;
		
		super();
	}

	override function _initProxy() {

		proxy = new #if starling starling.display.Image #elseif pixi pixi.core.sprites.Sprite #end(_texture);
	}
}
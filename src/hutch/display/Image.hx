package hutch.display;

import hutch.textures.Texture;

class Image extends DisplayObject {

	public var texture(default, null):#if flash starling.textures.Texture #elseif js pixi.core.textures.Texture #end;

	public function new(texture:#if flash starling.textures.Texture #elseif js pixi.core.textures.Texture #end) {
		
		this.texture = texture;
		
		super();
	}

	override function _initProxy() {

		proxy = new #if flash starling.display.Image #elseif js pixi.core.sprites.Sprite #end(texture);
	}
}
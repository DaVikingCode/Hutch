package hutch.textures;

class Texture {

	public var proxy(default, null):#if flash starling.textures.Texture #elseif js pixi.core.textures.Texture #end;

	public function new(value:#if flash starling.textures.Texture #elseif js pixi.core.textures.Texture #end) {

		proxy = value;
	}
}
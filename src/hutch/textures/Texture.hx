package hutch.textures;

class Texture {

	var _textureProxy:#if starling starling.textures.Texture #elseif pixi pixi.core.textures.Texture #end;

	public function new() {

		//_textureProxy = new #if starling starling.textures.Texture #elseif pixi pixi.core.textures.Texture #end();
	}

	static public function fromURL(url:String) {

		#if pixi
			return pixi.core.textures.Texture.fromImage(url);
		#end
	}
}
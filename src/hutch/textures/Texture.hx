package hutch.textures;

class Texture {

	var _textureProxy:#if flash starling.textures.Texture #elseif js pixi.core.textures.Texture #end;

	public function new() {

		//_textureProxy = new #if flash starling.textures.Texture #elseif js pixi.core.textures.Texture #end();
	}

	static public function fromURL(url:String) {

		#if js
			return pixi.core.textures.Texture.fromImage(url);
		#end
	}
}
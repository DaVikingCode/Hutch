package hutch.utils;

import hutch.textures.Texture;

class AssetManager {

	public var proxy(default, null):#if flash starling.utils.AssetManager #elseif js pixi.loaders.Loader #end;

	public function new() {

		proxy = new #if flash starling.utils.AssetManager #elseif js pixi.loaders.Loader #end();
	}

	public function add(url:String) {

		#if flash
			proxy.enqueue(url);
		#elseif js

			if (url.indexOf("/") != -1 && (url.indexOf(".png") != -1 || url.indexOf(".jpg") != -1))
				proxy.add(url.substr(url.lastIndexOf("/") + 1), url);
			else
				proxy.add(url);
		#end
	}

	public function load(onComplete:Dynamic) {

		#if flash
			proxy.loadQueue(function(ratio:Float) {
				onComplete(ratio * 100);
			});
		#elseif js
			proxy.on('progress', function() {
				onComplete(proxy.progress);
			});
			proxy.load(function() {
				onComplete(proxy.progress);
			});
		#end
	}

	public function getTexture(url:String) {

		#if flash
			return new Texture(proxy.getTexture(url.split('.')[0]));
		#elseif js

			var resource = Reflect.field(proxy.resources, url);

			if (resource != null)
				return new Texture(pixi.core.textures.Texture.fromImage(resource.url));

			return new Texture(pixi.core.textures.Texture.fromImage(url));
		#end
	}
	
	public function getTextures(prefix:String) {

		#if flash

				var textures = new Array<Texture>();
				var starlingTextures = proxy.getTextures(prefix);

				for (i in 0...starlingTextures.length)
					textures.push(new Texture(starlingTextures[i]));

			return textures;

		#elseif js

			var textures = new Array<Texture>();

			var cache = pixi.core.utils.Utils.TextureCache;

			var out = [];

			for (name in Reflect.fields(cache))
				if (name.indexOf(prefix) == 0)
					out[out.length] = name;

			for (i in 0...out.length)
				textures.push(new Texture(Reflect.field(cache, out[i])));

			return textures;

		#end
	}

	public function dispose() {

		#if flash
			proxy.dispose();

		#elseif js

			var cache = pixi.core.utils.Utils.TextureCache;

			for (resource in Reflect.fields(proxy.resources)) {

				var url = Reflect.field(proxy.resources, resource).url;
				var texture = Reflect.field(cache, url);

				if (texture != null)
					pixi.core.textures.Texture.removeTextureFromCache(url);
			}
			//TODO: http://www.html5gamedevs.com/topic/23056-how-to-remove-movieclip-textures-from-texturecache/
			//for (name in Reflect.fields(cache))
			//	trace(name);

		#end
	}

}
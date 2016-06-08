package hutch.utils;

class AssetManager {

	public var proxy(default, null):#if flash starling.utils.AssetManager #elseif js pixi.loaders.Loader #end;

	public function new() {

		proxy = new #if flash starling.utils.AssetManager #elseif js pixi.loaders.Loader #end();
	}

	public function add(url:String) {

		#if flash
			proxy.enqueue(url);
		#elseif js

			if (url.indexOf("/") != -1 && url.indexOf(".png") != -1)
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
			return proxy.getTexture(url.split('.')[0]);
		#elseif js

			var resource = Reflect.field(proxy.resources, url);

			if (resource != null)
				return pixi.core.textures.Texture.fromImage(resource.url);

			return pixi.core.textures.Texture.fromImage(url);
		#end
	}
	
	public function getTextures(prefix:String) {

		#if flash
			return proxy.getTextures(prefix);

		#elseif js

			var cache = pixi.core.utils.Utils.TextureCache;

			var out = [];

			for (name in Reflect.fields(cache))
				if (name.indexOf(prefix) == 0)
					out[out.length] = name;

			var frames = [];

			for (i in 0...out.length)
				frames[frames.length] = Reflect.field(cache, out[i]);

			return frames;

		#end
	}

}
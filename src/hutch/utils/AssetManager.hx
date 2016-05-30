package hutch.utils;

class AssetManager {

	public var proxy(default, null):#if starling starling.utils.AssetManager #elseif pixi pixi.loaders.Loader #end;

	public function new() {

		proxy = new #if starling starling.utils.AssetManager #elseif pixi pixi.loaders.Loader #end();
	}

	public function add(url:String) {

		#if starling
			proxy.enqueue(url);
		#elseif pixi
			proxy.add(url);
		#end
	}

	public function load(onComplete:Dynamic) {

		#if starling
			proxy.loadQueue(function(ratio:Float) {

				if (ratio == 1)
					onComplete();
			});
		#elseif pixi
			proxy.load(onComplete);
		#end
	}

	public function getTexture(url:String) {

		#if starling
			return proxy.getTexture(url.split('.')[0]);
		#elseif pixi
			return pixi.core.textures.Texture.fromImage(url);
		#end
	}
	
	public function getTextures(prefix:String) {

		#if starling
			return proxy.getTextures(prefix);

		#elseif pixi

			var cache = pixi.core.utils.Utils.TextureCache;

			var out = [];

			for (name in Reflect.fields(cache))
				if (name.indexOf(prefix) == 0)
					out[out.length] = name;

			untyped __js__('out.sort(naturalCompare);');

			var frames = [];

			for (i in 0...out.length)
				frames[frames.length] = Reflect.field(cache, out[i]);

			return frames;

		#end
	}

}
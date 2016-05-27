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

	#if starling
	
		public function getTextures(prefix:String) {

			return proxy.getTextures(prefix);
		}
	#end

}
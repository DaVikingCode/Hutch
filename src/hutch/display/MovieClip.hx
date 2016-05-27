package hutch.display;

class MovieClip extends Image {

	public var textures(default, null):#if starling flash.Vector<starling.textures.Texture #elseif pixi Array<pixi.core.textures.Texture #end>;

	public function new(textures:#if starling flash.Vector<starling.textures.Texture #elseif pixi Array<pixi.core.textures.Texture #end>) {

		this.textures = textures;

		super(textures[0]);
	}

	override function _initProxy() {

		proxy = new #if starling starling.display.MovieClip(textures, 60) #elseif pixi pixi.extras.MovieClip(textures) #end;
	}

	public function play() {

		#if starling

			starling.core.Starling.juggler.add(proxy);

		#end

		proxy.play();
	}
}
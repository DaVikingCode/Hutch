package hutch.display;

class MovieClip extends Image {

	var _fps:Float;
	public var fps(get, set):Float;
	public var textures(default, null):#if starling flash.Vector<starling.textures.Texture #elseif pixi Array<pixi.core.textures.Texture #end>;

	public var currentFrame(get, set):Int;
	public var loop(get, set):Bool;
	public var numFrames(get, null):Int;

	public function new(textures:#if starling flash.Vector<starling.textures.Texture #elseif pixi Array<pixi.core.textures.Texture #end>, fps:Float) {

		this.textures = textures;
		this.fps = fps;

		super(textures[0]);
	}

	override function _initProxy() {

		#if starling

			proxy = new starling.display.MovieClip(textures, _fps);

			starling.core.Starling.juggler.add(proxy);

		#elseif pixi

			proxy = new pixi.extras.MovieClip(textures);

			proxy.animationSpeed = _fps;

		#end
	}

	#if starling
		public function dispose(evt:starling.events.Event) {

			starling.core.Starling.juggler.remove(proxy);

			super.dispose(evt);
		}
	#end

	public function play() {

		proxy.play();
	}

	public function pause() {

		#if starling
			proxy.pause();
		#elseif pixi
			proxy.stop();
		#end
	}

	public function stop() {

		proxy.stop();

		#if pixi
			proxy.gotoAndStop(0);
		#end
	}

	function get_fps():Float {

		#if starling
			return _fps;
		#elseif pixi
			return _fps * 60;
		#end
	}

	function set_fps(value:Float) {

		#if starling
			_fps = value;
			if (proxy != null)
				proxy.fps = _fps;
			return _fps;

		#elseif pixi
			_fps = value / 60;
			if (proxy != null)
				proxy.animationSpeed = _fps;
			return _fps;

		#end
	}

	function get_currentFrame():Int {

		return proxy.currentFrame;
	}

	function set_currentFrame(value:Int) {

		#if starling
			return proxy.currentFrame = value;
		#elseif pixi
			proxy.gotoAndStop(value);
			return value;
		#end
	}

	function get_loop():Bool {

		return proxy.loop;
	}

	function set_loop(value:Bool) {

		return proxy.loop = value;
	}

	function get_numFrames():Int {

		#if starling
			return proxy.numFrames;
		#elseif pixi
			return proxy.totalFrames;
		#end
	}
}
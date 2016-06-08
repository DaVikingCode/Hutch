package hutch.display;

import hutch.textures.Texture;

class MovieClip extends Image {

	var _fps:Float;
	public var fps(get, set):Float;
	public var textures(default, null):Array<Texture>;

	public var currentFrame(get, set):Int;
	public var loop(get, set):Bool;
	public var numFrames(get, null):Int;

	// Be careful, it clones Pixi behavior instead of Starling's one due to Pixi limitation.
	public var onComplete:Void -> Void;

	public function new(textures:Array<Texture>, fps:Float) {

		this.textures = textures;
		this.fps = fps;

		super(textures[0]);
	}

	override function _initProxy() {

		var nativeTextures = new #if flash flash.Vector<starling.textures.Texture #elseif js Array<pixi.core.textures.Texture #end>();

		for (i in 0...textures.length)
			nativeTextures.push(textures[i].proxy);

		#if flash

			proxy = new starling.display.MovieClip(nativeTextures, _fps);
			proxy.stop();

			proxy.addEventListener(starling.events.Event.COMPLETE, _complete);

		#elseif js

			proxy = new pixi.extras.MovieClip(nativeTextures);
			
			proxy.animationSpeed = _fps;

			proxy.onComplete = function() { if (onComplete != null) onComplete(); };

		#end
	}

	#if flash
		function _complete(evt:starling.events.Event) {

			if (!loop && onComplete != null)
				onComplete();
		}
	#end

	public function addToJuggler() {

		#if flash
			starling.core.Starling.juggler.add(proxy);
		#end
	}

	public function removeFromJuggler() {

		#if flash
			starling.core.Starling.juggler.remove(proxy);
		#end
	}

	public function play() {

		proxy.play();
	}

	public function pause() {

		#if flash
			proxy.pause();
		#elseif js
			proxy.stop();
		#end
	}

	public function stop() {

		proxy.stop();

		#if js
			proxy.gotoAndStop(0);
		#end
	}

	function get_fps():Float {

		#if flash
			return _fps;
		#elseif js
			return _fps * 60;
		#end
	}

	function set_fps(value:Float) {

		#if flash
			_fps = value;
			if (proxy != null)
				proxy.fps = _fps;
			return _fps;

		#elseif js
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

		#if flash
			return proxy.currentFrame = value;
		#elseif js
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

		#if flash
			return proxy.numFrames;
		#elseif js
			return proxy.totalFrames;
		#end
	}
}
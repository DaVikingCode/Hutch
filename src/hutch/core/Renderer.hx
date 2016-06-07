package hutch.core;

#if flash
import starling.core.Starling;
#elseif js
import js.Browser;
import pixi.core.display.Container;
import pixi.core.renderers.SystemRenderer;
import pixi.core.renderers.Detector;
import pixi.plugins.app.Application;
#end

class Renderer extends #if flash AStarling #elseif js Application #end {

	static var _instance:Renderer;

	var _scene:Scene;
	public var scene(get, set):Scene;

	var _newScene:Scene;
	
	public function new() {
		super();

		_instance = this;

		onUpdate = _onUpdate;
	}

	static public function getInstance():Renderer {

		return _instance;
	}

	#if flash override #end public function setUpRenderer(options:RendererOptions) {

		#if flash
			super.setUpRenderer(options);

		#elseif js

			backgroundColor = options.backgroundColor;
			autoResize = options.autoResize;
			width = options.width;
			height = options.height;

			if (options.debugMode)
				var stats = new Perf(Perf.TOP_LEFT);

			super.start();

			initialize();

		#end
	}

	#if flash
		override function _starlingRootCreated(evt:starling.events.Event) {
			super._starlingRootCreated(evt);

			initialize();
		}
    #end

    public function initialize() {

    }

    function _onUpdate(elapsedTime:Float) {

    	if (_newScene != null) {

    		if (_scene != null) {

    			_scene.destroy();
    			#if flash
	    			cast(renderer.root, starling.display.Sprite).removeChild(_scene.proxy);
	    		#elseif js
	    			stage.removeChild(_scene.proxy);
	    		#end
    		}

    		_scene = _newScene;
    		_newScene = null;

    		#if flash
    			cast(renderer.root, starling.display.Sprite).addChild(_scene.proxy);
    		#elseif js
    			stage.addChild(_scene.proxy);
    		#end
    		_scene.initialize();
    	}

    	if (_scene != null)
    		_scene.update(elapsedTime);
    }

    function get_scene():Scene {
		
		if (_newScene != null)
			return _newScene;
		else
			return _scene;
	}

	function set_scene(value:Scene):Scene {
		
		return _newScene = value;
	}
}
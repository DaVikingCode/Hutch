package hutch.core;

#if starling
import starling.core.Starling;
#elseif pixi
import js.Browser;
import pixi.core.display.Container;
import pixi.core.renderers.SystemRenderer;
import pixi.core.renderers.Detector;
import pixi.plugins.app.Application;
#end

class Renderer extends #if starling AStarling #elseif pixi Application #end {

	static var _instance:Renderer;

	var _scene:Scene;
	public var scene(get, set):Scene;

	var _newScene:Scene;
	
	public function new() {
		super();

		_instance = this;

		onUpdate = _onUpdate;

		#if pixi

	        backgroundColor = 0x003366;
	        autoResize = false;
	        width = 800;
	        height = 600;

	        super.start();

	        initialize();
		#end
	}

	static public function getInstance():Renderer {

		return _instance;
	}

	#if starling
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
    			#if starling
	    			cast(renderer.root, starling.display.Sprite).removeChild(_scene.proxy);
	    		#elseif pixi
	    			stage.removeChild(_scene.proxy);
	    		#end
    		}

    		_scene = _newScene;
    		_newScene = null;

    		#if starling
    			cast(renderer.root, starling.display.Sprite).addChild(_scene.proxy);
    		#elseif pixi
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
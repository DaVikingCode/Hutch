package hutch.core;

#if starling
import starling.core.Starling;
#elseif pixi
import js.Browser;
import pixi.core.display.Container;
import pixi.core.renderers.SystemRenderer;
import pixi.core.renderers.Detector;
#end

class Renderer #if starling extends flash.display.Sprite #end {

	#if pixi
		var _stage:Container;
		var _renderer:SystemRenderer;
	#end
	
	public function new() {

		#if starling
		super();
		#end
		
		#if starling
			var renderer = new Starling(starling.display.Sprite, flash.Lib.current.stage);
			renderer.start();

			renderer.addEventListener(starling.events.Event.ROOT_CREATED, function(evt:starling.events.Event) {trace('okok');

				cast(renderer.root, starling.display.Sprite).addChild(new Game().proxy);
		});

		#elseif pixi

			var options:RenderingOptions = {};
	        options.backgroundColor = 0x003366;
	        options.resolution = 1;

			_stage = new Container();
			_renderer = Detector.autoDetectRenderer(800, 600, options);

			_stage.addChild(new Game().proxy);

			Browser.document.body.appendChild(_renderer.view);
        	Browser.window.requestAnimationFrame(cast _animate);
		#end
	}

	#if pixi
	function _animate() {
        Browser.window.requestAnimationFrame(cast _animate);
        _renderer.render(_stage);
    }
    #end
}
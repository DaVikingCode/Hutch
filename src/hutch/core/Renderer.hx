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

	var _game:Game;
	
	public function new() {
		super();

		onUpdate = _onUpdate;

		#if pixi

	        backgroundColor = 0x003366;
	        autoResize = false;
	        width = 800;
	        height = 600;

	        super.start();

			_game = new Game();

			stage.addChild(_game.proxy);
		#end
	}

	#if starling
		override function _starlingRootCreated(evt:starling.events.Event) {
			super._starlingRootCreated(evt);

			_game = new Game();

			cast(renderer.root, starling.display.Sprite).addChild(_game.proxy);
		}
    #end

    function _onUpdate(elapsedTime:Float) {

    	if (_game != null)
    		_game.onUpdate(elapsedTime);
    }
}
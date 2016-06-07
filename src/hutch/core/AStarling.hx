package hutch.core;

import flash.display.Sprite;
import flash.events.Event;

import starling.core.Starling;
import starling.events.Event;

class AStarling extends flash.display.Sprite {

	public var onUpdate:Float -> Void;

	public var renderer(default, null):Starling;

	var _startTime:Float;
	var _gameTime:Float;
	var _nowTime:Float;
	var _timeDelta:Float;
	
	public function new() {
		super();

		_gameTime = _startTime = Date.now().getTime();
	}

	public function setUpRenderer(options:RendererOptions) {

		renderer = new Starling(starling.display.Sprite, flash.Lib.current.stage);
		renderer.showStats = options.debugMode;
		renderer.start();

		addEventListener(flash.events.Event.ENTER_FRAME, _onRequestAnimationFrame);

		renderer.addEventListener(starling.events.Event.ROOT_CREATED, _starlingRootCreated);
	}

	function _starlingRootCreated(evt:starling.events.Event) {

		renderer.removeEventListener(starling.events.Event.ROOT_CREATED, _starlingRootCreated);
	}


	function _onRequestAnimationFrame(evt:flash.events.Event) {

		_nowTime = Date.now().getTime();
		_timeDelta = (_nowTime - _gameTime) * 0.001;
		_gameTime = _nowTime;

		if (onUpdate != null)
			onUpdate(_timeDelta);
	}
}
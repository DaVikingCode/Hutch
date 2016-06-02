package hutch.core;

import hutch.display.Sprite;
import hutch.display.Stage;

class Scene extends Sprite {

	var _renderer:Renderer;

	var _stage(default, null):Stage;

	public function new() {
		super();

		_renderer = Renderer.getInstance();

		#if flash
			touchable = true;
		#end

		_stage = Stage.instance;
	}

	public function initialize() {

	}

	public function update(elapsedTime:Float) {

	}

	public function destroy() {
		
	}
}
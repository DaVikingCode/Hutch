package hutch.core;

import hutch.display.Sprite;

class Scene extends Sprite {

	var _renderer:Renderer;

	public function new() {
		super();

		_renderer = Renderer.getInstance();

		#if starling
			touchable = true;
		#end
	}

	public function initialize() {

	}

	public function update(elapsedTime:Float) {

	}

	public function destroy() {
		
	}
}
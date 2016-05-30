package hutch.core;

import hutch.display.Sprite;

class Scene extends Sprite {

	public function new() {
		super();

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
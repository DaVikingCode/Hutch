package;

import hutch.core.Scene;
import hutch.display.Image;
import hutch.display.Sprite;

class DisplayListOperations extends Scene {

	var _container:Sprite;

	public function new() {
		super();
	}

	override public function initialize() {
		super.initialize();

		_container = new Sprite();

		for (i in 0...5)
			for (j in 0... 5) {

				var bunny = new Image(Main.assetManager.getTexture("bunny.png"));
				bunny.x = 40 * i;
				bunny.y = 40 * j;
				_container.addChild(bunny);
			}

		_container.x = 200;
		_container.y = 150;
		_container.pivotX = 80 + 26 * 0.5;
		_container.pivotY = 80 + 37 * 0.5;

		addChild(_container);
	}

	override public function update(elapsedTime:Float) {

		_container.rotation -= 0.01;
	}
}
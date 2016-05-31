package;

import hutch.core.Scene;
import hutch.display.DisplayObject;
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

		var monsters = [new Image(Main.assetManager.getTexture("eggHead.png")), new Image(Main.assetManager.getTexture("flowerTop.png")), new Image(Main.assetManager.getTexture("helmlok.png")), new Image(Main.assetManager.getTexture("skully.png"))];
		var i = 0;
		for (monster in monsters) {

			monster.pivotX = monster.width * 0.5;
			monster.pivotY = monster.height * 0.5;

			monster.x = _stage.width * 0.5 - 100 + i++ * 50;
			monster.y = _stage.height - 200;

			monster.useHandCursor = monster.touchable = true;

			monster.addTouchBeganListener();
			monster.onTouchBegan.add(_monsterTouched);

			addChild(monster);
		}
	}

	function _monsterTouched(target:DisplayObject) {

		setChildIndex(target, children.length - 1);
	}

	override public function update(elapsedTime:Float) {

		_container.rotation -= 0.01;
	}
}
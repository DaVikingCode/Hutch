package;

import hutch.core.Scene;
import hutch.display.Image;

class Interactivity extends Scene {

	public function new() {
		super();
	}

	override public function initialize() {
		super.initialize();

		var bg = new Image(Main.assetManager.getTexture("button_test_BG.jpg"));
		bg.width = _stage.width;
		bg.height = _stage.height;
		addChild(bg);

		var textureButton = Main.assetManager.getTexture("button.png");
		var textureButtonDown = Main.assetManager.getTexture("buttonDown.png");
		var textureButtonOver = Main.assetManager.getTexture("buttonOver.png");

		var btn1 = new Image(textureButton);

		addChild(btn1);

		haxe.Timer.delay(function() btn1.texture = textureButtonDown, 550);
	}
}
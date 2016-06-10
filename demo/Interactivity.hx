package;

import hutch.core.Scene;
import hutch.display.Image;
import hutch.events.TouchEvent;

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

		var btn = new Image(textureButton);
		btn.useHandCursor = btn.touchable = true;
		btn.x = btn.y = 200;
		addChild(btn);

		btn.onTouchStart = function(tEvt:TouchEvent) btn.texture = textureButtonDown;
		btn.onTouchHover = function(tEvt:TouchEvent) btn.texture = textureButtonOver;
		btn.onTouchEnded = function(tEvt:TouchEvent) btn.texture = textureButton;
		btn.onTouchOut = function(tEvt:TouchEvent) btn.texture = textureButton;
	}
}
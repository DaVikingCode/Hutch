package;

import hutch.core.Scene;
import hutch.display.Image;
import hutch.events.TouchEvent;
import hutch.textures.Texture;

class Interactivity extends Scene {

	var _textureButton:Texture;
	var _textureButtonDown:Texture;
	var _textureButtonOver:Texture;

	public function new() {
		super();
	}

	override public function initialize() {
		super.initialize();

		var bg = new Image(Main.assetManager.getTexture("button_test_BG.jpg"));
		bg.width = _stage.width;
		bg.height = _stage.height;
		addChild(bg);

		_textureButton = Main.assetManager.getTexture("button.png");
		_textureButtonDown = Main.assetManager.getTexture("buttonDown.png");
		_textureButtonOver = Main.assetManager.getTexture("buttonOver.png");

		var buttons = new Array<Image>();

		var buttonPositions = [
			175, 75,
			655, 75,
			410, 325,
			150, 465,
			685, 445
		];

		for (i in 0...5) {

			var button = new Image(_textureButton);

			button.pivotX = button.width * 0.5;
			button.pivotY = button.height * 0.5;

			button.useHandCursor = button.touchable = true;
			
			button.x = buttonPositions[i * 2];
			button.y = buttonPositions[i * 2 + 1];

			button.onTouchBegan = _onTouchBegan;
			button.onTouchHover = _onTouchHover;
			button.onTouchEnded = _onTouchEnded;
			button.onTouchOut = _onTouchOut;
			
			addChild(button);

			buttons.push(button);
		}

		buttons[0].scaleX = buttons[0].scaleY = 1.2;

		buttons[2].rotation = Math.PI / 10;

		buttons[3].scaleX = 0.8;

		buttons[4].scaleX = 0.8;
		buttons[4].scaleY = 1.2;
		buttons[4].rotation = Math.PI;
	}

	function _onTouchBegan(tEvt:TouchEvent) {

		cast (tEvt.target, Image).texture = _textureButtonDown;
	}

	function _onTouchHover(tEvt:TouchEvent) {

		cast (tEvt.target, Image).texture = _textureButtonOver;
	}

	function _onTouchEnded(tEvt:TouchEvent) {

		cast (tEvt.target, Image).texture = _textureButton;
	}

	function _onTouchOut(tEvt:TouchEvent) {

		cast (tEvt.target, Image).texture = _textureButton;
	}
}
package;

import hutch.core.Scene;
import hutch.display.Image;
import hutch.display.MovieClip;
import hutch.text.BitmapTextField;
import hutch.text.TextField;

import motion.Actuate;

class Game extends Scene {

	var bunny:Image;
	
	public function new() {
		super();
	}

	override public function initialize() {
		super.initialize();

		var text = new TextField("Welcome to Hutch :)", "Arial", 24, 0xFF0000);
		addChild(text);

		text.y = 150;

		var bitmapText = new BitmapTextField("We support bitmap font!", "Desyrel", 30, 0xFFFFFF);
		addChild(bitmapText);

		bunny = new Image(Main.assetManager.getTexture("bunny.png"));
		bunny.pivotX = bunny.width / 2;
		bunny.pivotY = bunny.height / 2;

		bunny.y = 50;
		addChild(bunny);

		var bird = new Image(Main.assetManager.getTexture("starling.png"));
		bird.x = bird.y = 300;
		addChild(bird);

		bird.useHandCursor = true;
		bird.touchable = true;

		bird.addTouchBeganListener();
		bird.onTouchBegan.add(function() {

			bird.scaleX = bird.scaleY += 0.1;
		});

		var mc = new MovieClip(Main.assetManager.getTextures("explosion_"), 30);
		mc.x = 400;
		addChild(mc);

		mc.play();

		Actuate.tween(bird, 1, {alpha:0.2}).repeat().reflect();

    	Actuate.tween(bunny, 1, {alpha:0.3, x:205});
	}

	override public function update(elapsedTime:Float) {
		super.update(elapsedTime);

		if (bunny != null) {
			bunny.rotation += 0.01;
		}
	}
}
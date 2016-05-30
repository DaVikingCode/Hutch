package;

import hutch.core.Scene;
import hutch.display.Image;
import hutch.display.MovieClip;
import hutch.text.TextField;
import hutch.textures.Texture;

import motion.Actuate;

class Game extends Scene {

	var bunny:Image;
	
	public function new() {
		super();

		var text = new TextField("Welcome to Hutch :)", "Arial", 24, 0xFF0000);
		addChild(text);

		text.y = 150;

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

		var mc = new MovieClip(Main.assetManager.getTextures("explosion_"));
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
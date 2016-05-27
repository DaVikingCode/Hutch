package;

import hutch.utils.AssetManager;
import hutch.display.Sprite;
import hutch.display.Image;
import hutch.textures.Texture;
import hutch.text.TextField;

import motion.Actuate;

class Game extends Sprite {

	var bunny:Image;
	
	public function new() {
		super();

		#if starling
			touchable = true;
		#end

		//var text = new TextField("Welcome to Hutch :)");
		//addChild(text);

		var assetManager:AssetManager = new AssetManager();
		assetManager.add("bunny.png");
		assetManager.add("starling.png");
		assetManager.load(function() {

			bunny = new Image(assetManager.getTexture("bunny.png"));
			bunny.anchorX = 0.5;
			bunny.anchorY = 0.5;

			bunny.y = 50;
			addChild(bunny);

			var bird = new Image(assetManager.getTexture("starling.png"));
			bird.x = bird.y = 300;
			addChild(bird);

			bird.buttonMode = true;
			bird.touchable = true;

			bird.addTouchBeganListener();
			bird.onTouchBegan.add(function() {

				bird.scaleX = bird.scaleY += 0.1;
			});

			Actuate.tween(bird, 1, {alpha:0.2}).repeat().reflect();

        	Actuate.tween(bunny, 1, {alpha:0.3, x:150});
		});
	}

	public function onUpdate(elapsedTime:Float) {

		if (bunny != null) {
			bunny.rotation += 0.01;
		}
	}
}
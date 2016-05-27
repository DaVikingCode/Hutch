package;

import hutch.display.Image;
import hutch.display.MovieClip;
import hutch.display.Sprite;
import hutch.text.TextField;
import hutch.textures.Texture;
import hutch.utils.AssetManager;

import motion.Actuate;

class Game extends Sprite {

	var bunny:Image;
	
	public function new() {
		super();

		#if starling
			touchable = true;
		#end

		var text = new TextField("Welcome to Hutch :)", "Arial", 24, 0xFF0000);
		addChild(text);

		text.y = 150;

		var assetManager = new AssetManager();
		assetManager.add("bunny.png");
		assetManager.add("starling.png");

		#if starling
			assetManager.add("explosion_starling.png");
			assetManager.add("explosion_starling.xml");
		#elseif pixi
			assetManager.add("explosion_pixi.json");
		#end

		assetManager.load(function() {

			bunny = new Image(assetManager.getTexture("bunny.png"));
			bunny.pivotX = bunny.width / 2;
			bunny.pivotY = bunny.height / 2;

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

			var mc:MovieClip;

			#if starling

				var frames = assetManager.getTextures("explosion_");

			#elseif pixi

				var frames = [];

				for (i in 0 ... 26)
					frames.push(pixi.core.textures.Texture.fromFrame("explosion_" + (i + 1) + ".png"));
			#end

			mc = new MovieClip(frames);
			mc.x = 400;
			addChild(mc);

			mc.play();

			Actuate.tween(bird, 1, {alpha:0.2}).repeat().reflect();

        	Actuate.tween(bunny, 1, {alpha:0.3, x:205});
		});
	}

	public function onUpdate(elapsedTime:Float) {

		if (bunny != null) {
			bunny.rotation += 0.01;
		}
	}
}
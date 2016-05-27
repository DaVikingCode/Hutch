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

			var starling = new Image(assetManager.getTexture("starling.png"));
			starling.x = starling.y = 300;
			addChild(starling);

			getChildAt(1).alpha = 0.2;

        	Actuate.tween(bunny, 1, {alpha:0.3, x:150});
		});
	}

	public function onUpdate(elapsedTime:Float) {

		if (bunny != null) {
			bunny.rotation += 0.01;
		}
	}
}
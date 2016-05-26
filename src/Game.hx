package;

import hutch.utils.AssetManager;
import hutch.display.Sprite;
import hutch.display.Image;
import hutch.textures.Texture;
import hutch.text.TextField;

import motion.Actuate;

class Game extends Sprite {
	
	public function new() {
		super();

		//var text = new TextField("Welcome to Hutch :)");
		//addChild(text);

		var assetManager:AssetManager = new AssetManager();
		assetManager.add("bunny.png");
		assetManager.add("starling.png");
		assetManager.load(function() {

			var image = new Image(assetManager.getTexture("bunny.png"));
			addChild(image);

			var starling = new Image(assetManager.getTexture("starling.png"));
			starling.x = starling.y = 300;
			addChild(starling);

			getChildAt(1).alpha = 0.2;

        	Actuate.tween(image, 1, {alpha:0.3, x:150});
		});
	}
}
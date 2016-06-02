package;

import hutch.core.Renderer;
import hutch.utils.AssetManager;

class Main extends Renderer {

	static public var assetManager = new AssetManager();

	static function main() {

        new Main();
	}

    public function new() {

        super();

        setUp(true);
    }

    override public function initialize() {

    	assetManager.add("bunny.png");
		assetManager.add("starling.png");
		assetManager.add("cells.png");
		assetManager.add("moby.png");
		assetManager.add("desyrel.fnt");

		#if flash
			assetManager.add("spritesheet_starling.png");
			assetManager.add("spritesheet_starling.xml");
			assetManager.add("desyrel.png");
		#elseif js
			assetManager.add("spritesheet_pixi.json");
		#end

		assetManager.load(function(percent:Float) {

			if (percent == 100) {

				scene = new Game();

				//scene = new DisplayListOperations();
			}
		});
    }
}

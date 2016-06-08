package;

import hutch.core.Renderer;
import hutch.core.RendererOptions;
import hutch.utils.AssetManager;

class Main extends Renderer {

	static public var assetManager = new AssetManager();

	static function main() {

		new Main();
	}

	public function new() {

		super();
		
		setUpRenderer({debugMode:true, backgroundColor:0x003366, autoResize:false, width:900, height:650});
	}

	override public function initialize() {

		assetManager.add("assets/bunny.png");
		assetManager.add("assets/starling.png");
		assetManager.add("assets/cells.png");
		assetManager.add("assets/moby.png");
		assetManager.add("assets/desyrel.fnt");

		#if flash
			assetManager.add("assets/spritesheet_starling.png");
			assetManager.add("assets/spritesheet_starling.xml");
			assetManager.add("assets/desyrel.png");
		#elseif js
			assetManager.add("assets/spritesheet_pixi.json");
		#end

		assetManager.load(function(percent:Float) {

			if (percent == 100) {

				scene = new Game();

				//scene = new DisplayListOperations();
			}
		});
	}
}

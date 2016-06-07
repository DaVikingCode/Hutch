package;

import hutch.core.Scene;
import hutch.display.AnimationSequence;
import hutch.display.Canvas;
import hutch.display.DisplayObject;
import hutch.display.Image;
import hutch.display.MovieClip;
import hutch.events.TouchEvent;
import hutch.filters.BlurFilter;
import hutch.filters.FilterChain;
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
		text.y = 250;
		addChild(text);

		var bitmapText = new BitmapTextField("Bitmap font support!", "Desyrel", 30, 0xFFFFFF);
		bitmapText.y = 100;
		addChild(bitmapText);

		bunny = new Image(Main.assetManager.getTexture("bunny.png"));
		bunny.pivotX = bunny.width / 2;
		bunny.pivotY = bunny.height / 2;

		bunny.y = 150;
		addChild(bunny);

		var bird = new Image(Main.assetManager.getTexture("starling.png"));
		bird.x = bird.y = 300;
		addChild(bird);

		bird.useHandCursor = true;
		bird.touchable = true;

		bird.addTouchBeganListener();
		bird.onTouchBegan.add(function(tEvt:TouchEvent) {

			bird.scaleX = bird.scaleY += 0.1;
		});

		var mc = new MovieClip(Main.assetManager.getTextures("explosion_"), 30);
		mc.x = 450;
		addChild(mc);

		mc.addToJuggler();
		mc.play();

		var animSeq = new AnimationSequence([
			new AnimationData("idle", new MovieClip(Main.assetManager.getTextures("Patch/idle"), 15)),
			new AnimationData("walk", new MovieClip(Main.assetManager.getTextures("Patch/walk"), 15), true),
			new AnimationData("jump", new MovieClip(Main.assetManager.getTextures("Patch/jump"), 15)),
			new AnimationData("die", new MovieClip(Main.assetManager.getTextures("Patch/die"), 15)),
			new AnimationData("duck", new MovieClip(Main.assetManager.getTextures("Patch/duck"), 15)),
			new AnimationData("fall", new MovieClip(Main.assetManager.getTextures("Patch/fall"), 15)),
			new AnimationData("hurt", new MovieClip(Main.assetManager.getTextures("Patch/hurt"), 15))
			], "idle");

		animSeq.x = 650;
		animSeq.y = 250;

		var filters = new FilterChain();
		filters.addFilter(new BlurFilter());

		animSeq.filter = filters;

		addChild(animSeq);

		var anims = [for (i in animSeq.mcSequences.keys()) i];
		// play random anims
		new haxe.Timer(1000).run = function() animSeq.changeAnimation(anims[Std.random(anims.length)]);

		var graphics = new Canvas();
		graphics.beginFill(0xFF0000, 0.2);
		graphics.drawRectangle(0, 0, 250, 75);
		graphics.endFill();

		graphics.x = _stage.width - 250;
		graphics.y = _stage.height - 75;
		addChild(graphics);

		//alpha mask is not supported by Starling
		var cells = new Image(Main.assetManager.getTexture("cells.png"));
		var mask = new Image(Main.assetManager.getTexture("moby.png"));

		cells.mask = mask;

		mask.scaleX = mask.scaleY = 0.5;

		cells.y = _stage.height - mask.height;

		#if js
			mask.y = cells.y;
			addChild(mask);
		#end

		addChild(cells);

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
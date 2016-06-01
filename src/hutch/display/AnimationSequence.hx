package hutch.display;

class AnimationSequence extends Sprite {

	var _mcSequences:Map<String, MovieClip>;
	var _previousAnimation:String;

	var _firstAnimation:String;

	public function new(animations:Array<AnimationData>, firstAnimation:String) {
		super();

		_mcSequences = new Map<String, MovieClip>();

		_previousAnimation = _firstAnimation = firstAnimation;

		for (animation in animations) {

			animation.mc.loop = animation.loop;

			_mcSequences.set(animation.name, animation.mc);
		}

		var firstMc = _mcSequences.get(firstAnimation);
		firstMc.addToJuggler();
		firstMc.play();
		addChild(firstMc);
	}

	public function changeAnimation(animation:String) {

		var oldMc = _mcSequences.get(_previousAnimation);
		oldMc.removeFromJuggler();
		oldMc.stop();
		removeChild(oldMc);

		if (!_mcSequences.exists(animation))
        	trace("no animation: " + animation);

        var mc = _mcSequences.get(animation);
        mc.addToJuggler();
        mc.play();
        addChild(mc);

        _previousAnimation = animation;
	}
}

class AnimationData {

	public var name(default, null):String;
	public var mc(default, null):MovieClip;
	public var loop(default, null):Bool;

	public function new(name:String, mc:MovieClip, ?loop:Bool = false) {

		this.name = name;
		this.mc = mc;
		this.loop = loop;
	}
}
package hutch.display;

import hutch.core.Renderer;

class Stage {

	static public var instance(get, null):Stage;

	public var proxy(default, null):Dynamic;

	public var height(get, null):Float;
	public var width(get, null):Float;

	public function new() {

		proxy = #if starling starling.core.Starling.current.stage; #elseif pixi Renderer.getInstance(); #end
	}

	static private function get_instance():Stage {

		if (instance == null)
			instance = new Stage();

		return instance;
	}

	function get_height():Float {

		#if starling
			return proxy.stage.stageHeight;
		#elseif pixi
			return proxy.height;
		#end
	}

	function get_width():Float {

		#if starling
			return proxy.stage.stageWidth;
		#elseif pixi
			return proxy.width;
		#end
	}
}
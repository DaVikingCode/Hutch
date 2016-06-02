package hutch.display;

import hutch.core.Renderer;

class Stage {

	static public var instance(get, null):Stage;

	public var proxy(default, null):Dynamic;

	public var height(get, null):Float;
	public var width(get, null):Float;

	public function new() {

		proxy = #if flash starling.core.Starling.current.stage; #elseif js Renderer.getInstance(); #end
	}

	static private function get_instance():Stage {

		if (instance == null)
			instance = new Stage();

		return instance;
	}

	function get_height():Float {

		#if flash
			return proxy.stage.stageHeight;
		#elseif js
			return proxy.height;
		#end
	}

	function get_width():Float {

		#if flash
			return proxy.stage.stageWidth;
		#elseif js
			return proxy.width;
		#end
	}
}
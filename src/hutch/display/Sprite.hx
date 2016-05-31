package hutch.display;

class Sprite extends DisplayObject {

	public var children(default, null):Array<DisplayObject>;

	public function new() {
		super();

		children = new Array<DisplayObject>();
	}

	override function _initProxy() {

		proxy = new #if starling starling.display.Sprite #elseif pixi pixi.core.display.Container #end();
	}

	public function addChild(child:DisplayObject):DisplayObject {

		proxy.addChild(child.proxy);

		children.push(child);

		return child;
	}

	public function addChildAt(child:DisplayObject, index:Int):DisplayObject {

		proxy.addChildAt(child.proxy, index);

		children.insert(index, child);

		return child;
	}

	public function getChildAt(index:Int):DisplayObject {

		return children[index];
	}

	public function getChildIndex(child:DisplayObject):Int {

		return children.indexOf(child);
	}

	public function removeChild(child:DisplayObject):DisplayObject {

		proxy.removeChild(child.proxy);

		children.remove(child);

		return child;
	}

	public function removeChildAt(index:Int):DisplayObject {

		proxy.removeChildAt(index);

		return children.splice(index, 1)[0];
	}

	public function removeChildren() {

		proxy.removeChildren();

		children.splice(0, -1);
	}
}
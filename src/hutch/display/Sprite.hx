package hutch.display;

class Sprite extends DisplayObject {

	var _children:Array<DisplayObject>;

	public function new() {
		super();

		_children = new Array<DisplayObject>();
	}

	override function _initProxy() {

		proxy = new #if starling starling.display.Sprite #elseif pixi pixi.core.display.Container #end();
	}

	public function addChild(child:DisplayObject):DisplayObject {

		proxy.addChild(child.proxy);

		_children.push(child);

		return child;
	}

	public function addChildAt(child:DisplayObject, index:Int):DisplayObject {

		proxy.addChildAt(child.proxy, index);

		_children.insert(index, child);

		return child;
	}

	public function getChildAt(index:Int):DisplayObject {

		return _children[index];
	}

	public function removeChild(child:DisplayObject):DisplayObject {

		proxy.removeChild(child.proxy);

		return child;
	}

	public function removeChildAt(index:Int):DisplayObject {

		proxy.removeChildAt(index);

		return _children.splice(index, 1)[0];
	}

	public function removeChildren() {

		proxy.removeChildren();

		_children.splice(0, -1);
	}
}
package hutch.display;

class Sprite extends DisplayObject {

	public var children(default, null):Array<DisplayObject>;

	public function new() {
		super();

		children = new Array<DisplayObject>();
	}

	override function _initProxy() {

		proxy = new #if flash starling.display.Sprite #elseif js pixi.core.display.Container #end();
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

	public function getChildByName(name:String):DisplayObject {

		for (child in children)
			if (child.name == name)
				return child;

		return null;
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

	public function setChildIndex(child:DisplayObject, index:Int) {

		proxy.setChildIndex(child.proxy, index);

		children.remove(child);
		children.insert(index, child);
	}

	public function swapChildren(child1:DisplayObject, child2:DisplayObject) {

		proxy.swapChildren(child1.proxy, child2.proxy);

		var index1 = getChildIndex(child1);
		var index2 = getChildIndex(child2);

		children[index1] = child2;
		children[index2] = child1;
	}
}
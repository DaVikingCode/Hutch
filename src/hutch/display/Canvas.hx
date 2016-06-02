package hutch.display;

class Canvas extends Sprite {

	public function new() {
		super();
	}

	override function _initProxy() {

		proxy = new #if flash starling.display.Canvas #elseif js pixi.core.graphics.Graphics #end();
	}

	public function beginFill(color:UInt = 0xFFFFFF, alpha:Float = 1) {

		proxy.beginFill(color, alpha);
	}

	public function clear() {

		proxy.clear();
	}

	public function drawCircle(x:Float, y:Float, radius:Float) {

		proxy.drawCircle(x, y, radius);
	}

	public function drawEllipse(x:Float, y:Float, width:Float, height:Float) {

		proxy.drawEllipse(x, y, width, height);
	}

	public function drawRectangle(x:Float, y:Float, width:Float, height:Float) {

		#if flash
			proxy.drawRectangle(x, y, width, height);
		#elseif js
			proxy.drawRect(x, y, width, height);
		#end
	}

	public function endFill() {

		proxy.endFill();
	}
}
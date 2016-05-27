# Hutch
Meet Hutch the best friend of Starxi!

Hutch is a [Haxe](http://haxe.org/) framework exporting on the web via WebGL (thanks to [Pixi.js](http://www.pixijs.com/)), on desktop and mobile via AIR (thanks to [Starling](http://gamua.com/starling/)). Hutch offers a nice layer of abstraction since (mostly) you don't have to bother if you're targeting Pixi or Starling.

## API
Starling & Pixi share a close architecture since they're based on the traditional Flash display list architecture. Hutch respects this architecture. It is closer to the Starling's one because it is itself a port of the Flash display list for Stage3D, whereas Pixi has mostly borrowed the display list architecture to help Flash developers move on HTML5.

Hutch is pretty new, there are many things to do! In a long run, only the raw assets will depend of the targeted platform. Its goal is to have exactly the same behavior regardless the targeted platform.

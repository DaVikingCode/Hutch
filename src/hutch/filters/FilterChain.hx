package hutch.filters;

class FilterChain {

	public var proxy(default, null):Dynamic;

	public function new() {

		#if flash
			proxy = new starling.filters.FilterChain();
		#elseif js
			proxy = new Array<AFilter>();
		#end
	}

	public function addFilter(filter:AFilter) {

		#if flash
			proxy.addFilter(filter.proxy);
		#elseif js
			proxy.push(filter.proxy);
		#end
	}
}
{
	//solution 1
    // Get a function f and return a function g such that f (g) = g
	const A = (f) => f((x) => A(f)(x))
	const f1 = A(f => (x) => x <= 1 ? 1 : x * f(x - 1));
	
    
    //solution  2
	//use combinator
	const U = (func) => func(func);
	const f2 = U(func => x => x <= 1 ? 1 : x * func(func)(x - 1));
	
    
    //solution  3
    // use arguments.callee
	const f3 = function(n) {
		let g = arguments.callee;
		return n <= 1 ? 1 : n * g(n - 1);
	}


    // print result
	console.log(f1(10))
	console.log(f2(10))
	console.log(f3(10))
    
}
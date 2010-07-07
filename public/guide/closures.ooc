/* What makes <i>ooc</i> so special is its ability to abstract the low-level power of C into various
high-level goodies, and break them back down into C. Two such goodies will be covered in this section: <a href="http://en.wikipedia.org/wiki/Closure_(computer_science)">Closures</a> and <a href="http://en.wikipedia.org/wiki/Higher-order_function">Higher-order functions</a> */

/* Simply put, a higher-order function is a function that takes another function as input. Using pseudocode, 
lets say I have a function that adds two numbers together */
function add(x,y)
  return(x+y)

/* Calling the function with two numbers would yield an expected result */
add(1,2)
// 3

/* To make <code>add</code> a higher-order function, it would have to take a function as an argument */
function x(n)
  return n
  
function add(x,y)
  return x(1) + y
  
/* Calling x(1) would return 1 (x could be considered an <a href="http://en.wikipedia.org/wiki/Identity_function">identity function</a>) */
add(x,2)
// 3

/* <i>ooc</i> currently has two different ways of implementing functions, both using this construct known as
a closure */

/* A closure is a first-class function. Basically, this means that just like 1, "hello", and 5.0 are literal pieces of data,
functions are too. Just like all random pieces of data, closures can be stored and passed around (even as parameters to higher-order functions).
Closures are bound to the scope of the variables specified. */


/* The first method involves using the <code>func</code> literal */
x: func (n: Int) -> Int { n }
add: func(x: Func(Int) -> Int, y: Int) -> Int { x(1) + y }

add(x,2) toString() println()
// 3

/* <code>x</code> is a function that takes an argument we call <code>n</code> of type <code>Int</code> and
returns a value of type <code>Int</code>, which is the integer that it is passed. */

/* <code>add</code> is a higher-order function that takes an argument we call <code>x</code> (we could call this bob, and change the call to bob(1)) 
of type <code>Func</code>, which is a function that takes an Int and returns an Int, an argument we call <code>y</code> of type <code>Int</code>, and then <code>add</code> returns an Int which is the result of adding 1 and 2 */

/* The second method involves using a very familiar construct for Rubyists, a block. Using a <code>cover</code>, let us 
implement the ruby <code>#times</code> function on all integers */
Int: cover {
  times: func (f: Func(This)) {
    for(i in 0..this) {
      f(i)
    }
  }
}

5 times(|n| (n+1) toString() print())
// 12345
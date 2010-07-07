/* Function definitions are flexible. They can consist of arguments, return value, suffix (for 
overloading), and several special keywords. Usage of all these parts is optional. */

/* A function <code>add</code> with two arguments, both are of type <code>Int</code>, and a return of type
<code>Int</code> */
multiply: func (n: Int, m: Int) -> Int {
  return n*m
}

/* Since both arguments are Int, let us simplify */
multiply: func (n, m: Int) -> Int {
  return n*m
}

/* In <i>ooc</i>, last statement in function is an inferred return. Let us take advantage of that. */
multiply: func (n, m: Int) -> Int { n*m }

/* A function without a return type */
println: func (str: String) { print(str + "\n") }

/* As mentioned earlier, function overloading is possible through the use of <code>~</code>. Overloading 
allows functions to have similar names, yet receive arguments or return values of different types. */
divide: func ~withInt (n, m: Int) -> Int { n/m }
divide: func ~withDouble (n, m: Float) -> Float { n/m }

divide(22,7) toString() println()
// 3
divide(22.0,7.0) toString() println()
// 3.14

/* We can also call a specific version of the function; note how the arguments and return type are casted to a Double */
divide~withDouble(22,7) toString() println()
// 3.14

/* Functions could also be written to use generic types */
printType: func <T> (param: T) {
  if(T == Int) printf("It's an Int! and its value is %d\n", param as Int)
  else if(T == Char) printf("It's a char! and its value is '%c'\n", param as Char)
}

printType('c')
// It's a char! and its value is 'c'
printType(42)
// It's an Int! and its value is 42

/* There exist several other keywords we can put before <code>func</code>:
<ul>
  <li><code>proto</code>: Adds function prototypes in the generated C file (e.g. when you’re missing a header)</li>
  <li><code>inline</code>: Just like C inline (Hint to the compiler to make calling this function faster, usually by substituting calls to this function with the actual code of the function. It’s generally used for functions that will be called very often)</li>
  <li><code>extern</code>: Means it is defined elsewhere, e.g. in some C code. By default it uses the name of the ooc function being defined but you can also use it with an argument to wrap a C function with a different name</li>
</ul> */

/* wraps C <code>exit</code> */
exit: extern func (status: Int)

/* wraps C <code>puts</code>, but will be called in ooc as putString(s) */
putString: extern(puts) func (str: String) -> Int

/* exactly the same as above; naming extern arguments is optional */
putString: extern(puts) func (String) -> Int
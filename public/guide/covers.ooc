/* Covers got to be my favorite aspect of <i>ooc</i>. In essence, a cover is nothing more than
a C <code>typedef</code> on rails. Covering primitive types extends functionality and allows for higher-level 
manipulation. Every type in <i>ooc</i> is a cover off of C types. */

/* Notice how all <i>ooc</i> types are capitalized? In fact, we cannot create variables with C types. */
chr = 'c' : char
// [ERROR] Undefined type 'char'

chr = 'c' : Char
// No error

/* Covering is as simple as creating a new class. Notice that we can define functions for covers. */
String: cover from Char* {
  roll?: func -> Bool { this == "rock" }
}

if("rock" roll?()) "Rock n' Roll" println()
// Rock n' Roll

/* */
/* Once we have a cover already defined, there's no need to specify what we are are covering from (the <code>Int</code> cover
is defined in the standard). */
Int: cover {
  seconds2minutes: func -> This { this / 60 }
}

2520 seconds2minutes() toString() println()
// 42

/* */
/* <h2>This n' this</h2> */
/* Let us sidestep a bit to better understand the usage of <code>This</code> and <code>this</code>.
<code>This</code> is a reference to a type, in the <code>seconds2minutes</code> example above, <code>This</code>
refers to the <code>Int</code> type. Hence, we can say <code>seconds2minutes</code> is a function that 
returns a value of type <code>Int</code> */

/* <code>this</code> is the reference to the actual object of type <code>This</code>. In the example
above, <code>this == 2520</code> and <code>This == Int</code> */

/* When used in a class, <code>This</code> refers to the class while <code>this</code> refers to the instance
of that class */
Animal: class {
  animal: func -> This { return this } // Simply returns the object animal was called on (object is of type Animal)
}

/* */
/* <h2>Extending classes without subclassing</h2> */
/* In <i>ooc</i>, it is possible to define additional behavior for a class without subclassing it, rather
by using covers and clever polymorphism. */
Human: class {
  height: Int
  init: func (=height)
}

me := Human new(6)

ExtendedHuman: cover from Human {
  printHeight: func {
    this as Human height toString() println()
  }
}

me as ExtendedHuman printHeight()
// 6
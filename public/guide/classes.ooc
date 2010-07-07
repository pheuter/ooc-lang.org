/* Classes in <i>ooc</i> are like classes anywhere else, with a few available optimizations */
Human: class {
  name: String
  weight, height: Int
  
  init: func (name: String, weight, height: Int) {
    this name = name
    this weight = weight
    this height = height
  }
  
  println: func {
    ("Name: "+this name+", weight: "+this weight+", and height: "+this height) println()
  }
}

me := Human new("Mark", 150, 6)
me println()
// Name: Mark, weight: 150, and height: 6

/* Since <code>name</code>, <code>weight</code>, and <code>height</code> are already class members, specifying 
their types is redundant */
init: func (.name, .weight, .height) {
  this name = name
  this weight = weight
  this height = height
}

/* Heck, why write so much in a standard constructor? */
init: func (=name, =weight, =height)

/* */
/* <h2>Abstract</h2> */
Programmer: abstract class {
  coolness: abstract func
}

Ooc: class extends Programmer {
  coolness: func { "epic" println() }
}

Else: class extends Programmer {
  coolness: func { "great" println() }
}

inquire: func (programmer: Programmer) {
  programmer coolness()
}

inquire(Ooc new())
// epic
inquire(Else new())
// great

/* */
/* <h2>Static fields</h2> */
Person: class {
  people: static Int
  init: func { This people += 1 }
  getPeople: static func -> Int { This people }
}

for(i in 0..42) {
  Person new()
}

Person getPeople() toString() println()
// 42

/* */
/* <h2>Generics</h2> */
Container: class <T> {
  content: T
  init: func (=content)
  get: func -> T { content }
  set: func (=content)
}

cont1 := Container<Int> new(42)
number := cont1 get()
printf("number is an %s, and its value is %d\n", number class name, number)
// number is an Int, and its value is 42

cont2 := Container<String> new("Hi, world!")
message := cont2 get()
printf("message is a %s, and its value is %s\n", message class name, message)
// message is a String, and its value is Hi, world!
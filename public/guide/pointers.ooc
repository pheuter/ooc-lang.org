/* are not as scary as you think. <i>ooc</i>'s postfix notation makes them even less scary to think about, and
that much more fun to work with. The examples provided traveled across the tubes from <a href="http://crowbarcentral.tumblr.com/">crowbar central</a> */

/* */
/* <h2>Primitives and addressing</h2> */
/* <code>Int</code> is a primitive type, so it's passed by-value (e.g. a copy is made of it). You can get the 
address of something by appending <code>&</code>. Primitive types are passed by-value, so their addresses will differ */
takeInt: func (i: Int) {
    printf("The int's value is %d, its address is %p\n", i, i&)
}

takeInt(5)
// The Int's value is 5, its address is 0x7fff5fbfd5cc

/* */
/* Modifying the value of an <code>Int</code> doesn't change its address. Modifying a copy of an <code>Int</code> doesn't modify the original. */
fightInt: func (i: Int) {
    printf("The int's value is %d, its address is %p\n", i, i&)
    // The int's value is 42, its address is 0x7fff5fbfd5dc
    i = 0
    printf("The int's value is %d, its address is %p\n", i, i&)
    // The int's value is 0, its address is 0x7fff5fbfd5dc
}

j := 42
printf("The int's value is %d, its address is %p\n", j, j&)
// The int's value is 42, its address is 0x10002dbe0
fightInt(j)
printf("The int's value is %d, its address is %p\n", j, j&)
// The int's value is 42, its address is 0x10002dbe0

/* */
/* Question is, how can we actually modify the value of an <code>Int</code>? Simple, pass its address instead (pass-by-reference).
<code>@</code> is the de-reference operator. It gives the value of the <code>Int</code> that lives at the address */
fightInt: func (i: Int*) {
    printf("The int's value is %d, its address is %p\n", i@, i)
    // The int's value is 42, its address is 0x10002dbe0
    i@ = 5
}


j := 42
printf("The int's value is %d, its address is %p\n", j, j&)
// The int's value is 42, its address is 0x10002dbe0
fightInt(j&)
printf("The int's value is %d, its address is %p\n", j, j&)
// The int's value is 5, its address is 0x10002dbe0

/* */
/* There exists a neat optimization that saves us the trouble of constantly appending <code>@</code>. Instead,
we can specify <code>Int@</code> in the argument list, and refer to the object in a straightforward manner */
fightInt: func (i: Int@) {
    i = 0
    // i& still returns the address :)
}

/* */
/* <h2>Covers</h2> */
/* All covers are primitive types, therefore passing covers by-value will modify a copy, while passing them by-reference
will modify the original */
Float3: cover {
    x, y, z: Float
}

takeFloat3: func (f3: Float3) {
    f3 x = -f3 x
    f3 y = -f3 y
    f3 z = -f3 z
}

takeFloat3Ref: func (f3: Float3@) {
    f3 x = -f3 x
    f3 y = -f3 y
    f3 z = -f3 z
}

f3: Float3
f3 x = 42; f3 y = 36; f3 z = 25
printf("(%.2f, %.2f, %.2f)\n", f3 x, f3 y, f3 z)
// (42.00, 36.00, 25.00)
takeFloat3(f3)
printf("(%.2f, %.2f, %.2f)\n", f3 x, f3 y, f3 z)
// (42.00, 36.00, 25.00)
takeFloat3Ref(f3&)
printf("(%.2f, %.2f, %.2f)\n", f3 x, f3 y, f3 z)
// (-42.00, -36.00, -25.00)

/* */
/* Ok, so covers are by-value, but what does this <i>mean</i>. It implies, for example, that any member method cannot modify the content
of the original, but only of the copy */
FlawedFloat3: cover {
    x, y, z: Float
    
    init: func (=x, =y, =z) {}
}

ff3 := FlawedFloat3 new(1.23, 2.64, 3.14)
printf("(%.2f, %.2f, %.2f)\n", ff3 x, ff3 y, ff3 z)

/* If you do that, you will get random values for ff3 x, ff3 y, ff3 z.
why? because covers are allocated on the stack, and they aren't
zero-ed out. Thus, they are initially filled with random data
(which is why you should always initialize them) */

/* So, how do we fix that? First we have to understand how member methods work. When we call FlawedFloat3 above, here's what it really does: */
FF3_init: func (this: FlawedFloat3, x, y, z: Float) {
    this x = x
    this y = y
    this z = z
}

otherFf3: FlawedFloat3 // allocate on the stack = filled with garbage
FF3_init(otherFf3, 1.23, 2.64, 3.14) // call init - modifies a copy of otherFf3
printf("(%.2f, %.2f, %.2f)\n", otherFf3 x, otherFf3 y, otherFf3 z) // print the original

/* */
/* So is there an easy workaround to use constructors in covers? Indeed there is note: we'll make it a Float2 to avoid clashing with variable names) */
Float2: cover {
    x, y: Float
    
    init: func@ (=x, =y) {}
}

ff2 := Float2 new(3.14, 6.22)
printf("(%.2f, %.2f)\n", ff2 x, ff2 y)

/* */
/* Why does it work? Because the init function generated looks something like this: */
FF2_init: func (this: Float2@, x, y: Float) // etc.

/* */
/* Note that it's not a trick only for the init function, it works so, when would we want 
functions that are not func@ on covers? Well, when we <i>want</i> to work on a copy. For example: */
Float1: cover {
    x: Float
    
    init: func@ (=x) {}
    copy: func -> This { this }
}

f1 := Float1 new(3.14)
f2 := f1 copy()
printf("Value of f1 = %.2f, f2 = %.2f, address of f1 = %p, of f2 = %p\n", f1 x, f2 x, f1&, f2&)

// here, f2 is really a copy of f1: same content, different address.

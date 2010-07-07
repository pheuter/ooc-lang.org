/* <i>ooc</i> features several useful data stuctures for containing data. */

/* */
/* <h2>Raw arrays</h2> */
/* An array of strings */
strings := ["rock", "hard", "place"]

for (i in 0..2) (strings[i] + ", ") print(); "and place" println()
// rock, hard, and place

/* An array of classes */
Greg: class {}
Naga: class {}

back := [Greg new(), Naga new()]

for (i in 0..2) (back[i] class name + " ") print()
// Greg Naga

/* */
/* <h2>ArrayList</h2> */
/* Note the <code>import</code> */
import structs/ArrayList

list := ArrayList<Int> new()

for (i in 1..11) list add(i*i)
for (elem in list) (elem toString() +" ") print()
// 1 4 9 16 25 36 49 64 81 100

/* Using <code>toArray</code> to convert list to a raw C array */
array := list toArray()
for (i in 0..11) (((array as Int*) + i)@ toString() + " ") print()
// 0 1 4 9 16 25 36 49 64 81 100

/* Hold the phone, what just happend? For those familiar with C, the expression above may
not seem all that unfamiliar. <code>toArray</code> is an <code>ArrayList</code> function that converts 
lists to raw C arrays. */
toArray: func -> Pointer {
    arr : T* = gc_malloc(size() * T size)
    for(i in 0..size()) {
        arr[i] = this[i]
    }
    return arr& as Pointer
}

/* As <code>toArray</code> is a general function that deals with no specific type, a generic pointer is created. To 
properly deal with the data contained, we must cast the pointer to an <code>Int</code> pointer. Now, <code>array</code>
is a pointer (array) of <code>Int</code>'s. */
array as Int*

/* <code>@</code> is the de-reference operator. <code>array@</code> returns the value of the first block 
in memory under the array. It is equivalent to writing <code>array[0]</code>. Likewise, <code>(array + 1)@</code> 
is synonymous with <code>array[1]</code>. */
for (i in 0..11) ((array as Int*)[i] toString() + " ") print()
// 0 1 4 9 16 25 36 49 64 81 100

/* */
/* <h2>HashMap</h2> */
/* Just like <code>ArrayList</code> */
import structs/HashMap

map := HashMap<String, String> new()

map add("language", "ooc")
map add("awesomeness", "epic")
map add("awesomeness", "very epic!")

map get("awesomeness") println()
// very epic

/* <code>each</code> takes a function. Let us give it an awesome closure */
map each(|k, v| (k + " is " + v) println())
// language is ooc 
// awesomeness is very epic!

/* <code>getKeys</code> returns an ArrayList of keys */
map getKeys() each(|k| (k + " ") print())
// language awesomeness

/* */
/* <h2>Styles of iteration</h2> */
/* As evident in the various examples above, there are several ways of iterating through arrays, lists, 
and maps. */

/* One way is to use the good ole' <code>for</code> loop */
for(i in 0..10) // i assumes the values in the range from 0 to 9
for(i in list) // i assumes the value of each element in the ArrayList

/* Another is to use closures */
list := ArrayList<Int> new()
f: func <T> (elem: T) { ((elem as Int) toString() + " ") print() }
for(i in 0..20) list add(i)

list each(f)
// 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19

list each(|elem| (elem toString() + " ") print()) // preferred method
// 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19

/* Most, if not all, container data structures have built-in iterators that provide a more procedural approach 
to traversing their elements */
iter := list iterator()

while(iter hasNext()) {
  (iter next() toString() + " ") print()
}

/* Same applies for HashMaps, where <code>next</code> returns the value associated with the next key.
Keys are sorted in order of insertion */
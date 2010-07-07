/* Let us begin by writing the universal Hello World program */

main: func {
  "Hello, World" println()
}

/* First, we create our program's entry point, the <code>main</code> function */
main: func

/* This is the same <code>main</code> that you write in C */
int main()
{
}

/* Finally, we call <code>println</code> on the string literal "Hello, World". Notice how we ommit the dot operator and instead use a space.
 The string literal is actually a cover of the C char*, but more on that later. */
"Hello, World" println()

/* Note, you don't even need to write a main function. The function expression alone will be automagically
wrapped in a main function for you during translation. */
"Hello, World" println()

/* Save the file as hello_world.ooc, open up terminal, and run    
<code>rock hello_world.ooc</code> (<i>if you have textmate ooc set up,</i> ⌘r <i>will do the job</i>)*/

/* A binary file <code>hello_world</code> is produced, which you can run with <code>./hello_world</code> */

/* That is all very magical, but being the inquisitive minds that we are, a more throrough explanation 
of what just happened would be nice. */

/* The first thing that happens when you run <code>rock hello_world.ooc</code> is the parsing stage. Parsing 
will always take place to scan code for changes in runtime dependencies and library imports. */
- Parsing ./hello_world.ooc
- Parsing /Users/Mark/Desktop/rock/sdk/lang/memory.ooc
- Parsing /Users/Mark/Desktop/rock/sdk/lang/stdio.ooc
- Parsing /Users/Mark/Desktop/rock/sdk/lang/string.ooc
- Parsing /Users/Mark/Desktop/rock/sdk/lang/system.ooc
- Parsing /Users/Mark/Desktop/rock/sdk/lang/types.ooc
- Parsing /Users/Mark/Desktop/rock/sdk/lang/vararg.ooc
- Parsing /Users/Mark/Desktop/rock/sdk/structs/List.ooc
- Parsing /Users/Mark/Desktop/rock/sdk/text/Buffer.ooc
- Parsing /Users/Mark/Desktop/rock/sdk/io/Writer.ooc
- Parsing /Users/Mark/Desktop/rock/sdk/io/Reader.ooc
- Parsing /Users/Mark/Desktop/rock/sdk/structs/ArrayList.ooc
Finished parsing, now tinkering...


/* The next stage, libcaching, depends upon the parsing. Notice that there now exists a .libs directory in your current directory. It contains
translated C header files that are essential to the compile time of your program. In this case, <code>stdio.h</code> 
and <code>string.h</code> will be used (in addition to other boilerplate runtime libraries). Libcaching will happen
once per program per directory, meaning that if you <code>mv hello_world.ooc</code> elsewhere, compiling 
it with rock will create a .libs in that new directory. Also, if you import new libraries or implement new
ooc constructs, .libs will be updated accordingly. */
sdk, Compiling all modules...
gcc -std=gnu99 -Wall -I/Users/Mark/Desktop/rock/libs/headers/ -Irock_tmp -c rock_tmp/sdk/lang/memory.c 
-o rock_tmp/sdk/lang/memory.o -I/Users/Mark/Desktop/rock/libs/headers/ -Irock_tmp -D__OOC_USE_GC__ 
-I.libs/cool_ooc -I.libs/sdk

/* Why is this necessary? Libcaching helps speed up all future compilations of a program. If you run 
<code>rock hello_world.ooc</code> a second time, the libcaching stage will be skipped, and hello_ooc will 
be compiled against the libraries in .libs, cool eh?*/
gcc -std=gnu99 -Wall -I/Users/Mark/Desktop/rock/libs/headers/ 
-Irock_tmp .libs/cool_ooc-osx.a .libs/sdk-osx.a .libs/cool_ooc-osx.a .libs/sdk-osx.a 
-D__OOC_USE_GC__ -I.libs/cool_ooc -I.libs/sdk -o test -lpthread /Users/Mark/Desktop/rock/libs/osx/libgc.a 

/* If you would like to see the actual C files that are produced, run rock with the <code>-noclean</code> option. 
You could then find the files in the <code>rock_tmp</code> directory. */

/* If you'd like to see what happens behind the scenes as you compile the program, run rock with the <code>-v</code> option. */

/* <code>rock --help</code> contains a full list of arguments you can pass to <code>rock</code> that will
change some aspect of the translation/compilation process. If you want to pass to rock a <code>gcc</code>
option, use a <code>+</code>. Example, <code>rock +-framework +sfml-graphics</code> will add 
<code>-framework sfml-graphics</code> to <code>gcc</code> during compilation. */
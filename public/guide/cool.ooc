/* Welcome to the <b>cool <i>ooc</i></b> tutorials. Apart from radiating its epic palindrome name, this series will cover <i>ooc</i> 
from beginner to advanced. */

/* Before we get started, you'll need a rock compiler and a text editor of your choice. I perfer to use 
TextMate, since there is a great ooc <a href="http://github.com/nilium/ooc.tmbundle">bundle</a> available for it. Some other text editor plugins:
<ul>
  <li><a href="http://github.com/crooter/ooc.vim">vim</a></li>
  <li><a href="http://github.com/nixeagle/ooc-mode/">emacs</a></li>
  <li><a href="http://github.com/denisshepelin/ooc-gedit-support">gedit</a></li>
</ul>
*/


/* The quickest and easiest way to install <i>rock</i> is using the one-line installer. */


/* For users with curl: 

<code>bash -c "`curl -L http://ooc-lang.org/install.sh`"</code>

with wget:

<code>bash -c "`wget -O - http://ooc-lang.org/install.sh`"</code> */


/* You can always compile it yourself: 
<ol>
  <li><code>git clone http://github.com/nddrylliog/rock.git</li>
  <li><code>cd rock</code></li>
  <li>Download <a href="/boots">bootstrap source</a> and extract into the rock directory. A folder called <i>build</i> should appear.</li>
  <li><code>make</code></li>
  <li><code>export ROCK_DIST=/path/to/rock</code></li>
  <li><code>export PATH=$ROCK_DIST/bin:$PATH</code></li>
</ol>
...and you're good!
*/

/* If the two methods above did not play nicely with you, you could always download a pre-compiled binary
for your system. I recommend against doing so, especially when new features and changes are released quite often, and
the binaries are not updated as frequently. Anyway, you can find them <a href="http://github.com/nddrylliog/rock/downloads">here</a>. */
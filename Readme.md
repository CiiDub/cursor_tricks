# Curser Tricks

Curser Tricks is a BBEdit package that massages the app to work better with my habits and intuition, using customizations I made or found.  Most of these scripts, clippings and such are grounded or anchored to a native BBEdit command conceptually.  Often I’m just trying to lean into a muscle memory.

 “If I can move a line down, it would be nice if I could copy a line down in a similar way.” 

 “If this key-command does this work in this context it should do that in another. “

This is the kind of work I want this package to do. Little friction reducers that don’t take you out of what your doing, and are harmonious with the BBedit defaults.

## Installation, and Rake Commands

Download or clone this project. Give it the file extension .bbpackage and double click it. BBedit will install it into _~/Library/Application Support/BBEdit/Packages_. This will not install the menu scripts. There are further instructions below. 

All the AppleScripts in this package are in sub-folders of the folder _Uncompiled Applescripts_. These are plain text versions of the scripts. The compiled versions are in a corresponding folder under _Contents_ and are the versions used by BBedit. 

The Menu Scripts are different. They are in the package only in a plain text version. You can open them with Script Editer and save them into _~/Library/Application Support/BBEdit/Menu Scripts_ as compiled scripts.  There are [Rake](https://github.com/ruby/rake) commands to help install and manage the package if you wish.

### Rake commands

- __rake install__, installs this project as a Curser Tricks.bbpackage into BBedits Packages folder. It runs backup, and compile as prerequisites before installing the package.
- __rake compile__, compiles all applescripts except the menu scripts.
- __rake backup__,   backs up the installed (and presumably working) copy of this package as Curser Tricks.backup.
- __rake lines:compile__, compiles all applescripts in the Lines directory.
- __rake white\_space:compile__, compiles all applescripts in White Space.
- __rake resources:compile__, compiles all applescripts in resources.
- __* rake menu\_scripts:install__, compiles & installs into ../BBedit/Menu Scripts/. It doesn’t run as part of the install command, you must run this command explicitly.
-__rake -T__ to list these commands.
## Scripts

### Lines:

- __Copy Line Down__, takes the selected lines duplicates them as new lines. The new lines, below the originals, will be selected. Sort of moving down the document.
- __Copy Line Up__, duplicates the selected lines but leaves the selection put.

These a two scripts are meant as to compliments BBedits __Edit > Lines > Move Line Down__ & __Edit > Lines > Move Line Up__.  The two native commands have the default keyboard shortcuts of _Ctrl_  ⇣ &  _Ctrl_ ⇡. So I use and recommend the shortcuts  _Ctrl Option_ ⇣ &  _Ctrl Option_ ⇡ respectively.

- __Smart Home Move__, moves the curser to start of the line not including prepended white space.
- __Smart Home Select__, selects to the start of the line not including prepended white space.

These two are meant to replace  the default behavior of _Ctrl ⇠_ and _Ctrl Shift ⇠_ . 
They are pulled directly from this blog post. It’s well written and worth a read. 
[Extending BBEdit with AppleScript](https://jonbeebe.net/2017/07/extending-bbedit-with-applescript/)

They don’t work in search fields, which is a bummer.

### White Space: 
_\* The curser will be represented with a_ |

- __Wrap with Spaces__, wraps the curser or selection in spaces.

```
It makes this, {|}  
Into this, { | }
```

This script could be a BBEdit clipping. But making it a script seems appropriate, and keeps it from popping up in code suggestions. 
 
- __Clever  Indent__, looks at the text on the current line, then changes and indents the next line according to what it sees.


The default behavior is to make a new line and indent it. 

```
Text|

Text
    |
``` 

If it detects one of these characters __(, {, [, “, ‘, \`__ (bracket characters), or a xml/html tag on the leading side of the curser it will close it wrapping the curser.  

```
{|  

{|}
```

```
<div>|

<div>|</div>
```

If the curser is wrapped in bracket characters it will make two new lines and indent the first one.   

```Javascript
function () {|} 

function () {
    |
}
```

If it detects a Ruby key word or control statement it will make two new lines indenting the first one and adding the _end_ statement.  

```Ruby

Array.each do |

Array.each do
    |
end

```

Currently the script will close a tag in these doc types : HTML, XML, Ruby in HTML, PHP in HTML. Your “_Language in HTML_” can be added pretty easy.  Add it to  _markup\_docs_ a list set near the top of the script (line 31).

The __Cleaver Indent__ script was inspired by this: [Smart New Line](http://www.angelwatt.com/words/2011/04/11/bbedit-smart-newline-open-line/). I was actually shopping for something ruby specific but ran across this. I was impressed by how flexible it was.  _Smart New Line_ does more than my script, such as incrementing numbered list. It’s pretty cool and you should check it out, but it doesn’t quite fit for me.

I use auto-pairing for bracket characters. I wanted my script to know when the curser was wrapped. 

Also I wanted it to fit with BBedits __New Line After Paragraph__. It uses the key-command _command return_ and will make a new line without disturbing the current line / paragraph. Kind of jumping you down there.

I set __Clever Indent__ to _command option return_.  It’s function is to encapsulate. So “__{}__” from a Javascript function, ” __do end__” from a Ruby block, or  a new line with and indent with Python or Haml.  It might make sense for it to indent and name a new section of an outline but not to increment a flat list.

The script doesn’t just insert text but inserts a BBedit clipping. It’s useful because I can take advantage of clippings features. Such as the #INDENT# placeholder, so I don’t have to be concerned with capturing the current lines leading whitespace.

I also made  __Clever Indent__ respect expanded tabs with a separate terse script “_ex\_tabs.scpt_” that is called by it’s clippings and lives right there in _Contents/Resources/_. It simplifies the big script and can be used by any clipping (or AppleScript) added in the future.

So my mental model is:

- _Return_ for a new line at the curser.
- _Command Return_ for a new line ignoring the curser possition.  
_* Its odd to me that this doesn’t auto indent_
- _Command Option Return_ to encapsulate the curser or new line.

### Menu Scripts

- __Window•Scratchpad & Window•Unix Worksheet__, activates the project versions of Scratchpad and Unix Worksheet if a project window is active.

This is my favorite, because it uses my three favorite features in BBEdit.

_Menu Scripts_ let you prepend a script to a native menu command, optionally continue to the command, as well as append a script.  Just a great idea.

_Scratchpad_ is a persistent document in BBedit.  The name really kind of says it. It doesn’t sound like much but in practise it’s great.

_Unix Worksheets_ are documents that will execute shell commands when you _Control Return_ a line. It’s the command line meets a text document. You can make and save as many as you like but BBedit also has a persistent one available through the _Window_ menu just like Scratchpad.

I have these two persistent documents assigned to _Command 1_ and _Command 2_ respectively.

What I recently discovered was that every BBEdit project also get a Scratchpad and a persistent Unix Worksheet. With this script the project versions are just as easy to activate. _Command 1_ and _Command 2_ in my case, when a project is the frontmost window.

If you wish to access the app level documents while leaving a project in front, then hold _Option_ and activate them from the _Window_ menu. You can also get them by right clicking the BBEdit icon in the dock.

## Planned Maybe Additions
- Might add auto-indenting to New Line After Paragraph with menu script
- Maybe a smart copy line down script with some fancy list stuff.


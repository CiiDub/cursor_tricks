# Cursor Tricks

_*Warning: This readme is ..._ 🤔  _self-indulgent._

Cursor Tricks is a BBEdit package that massages the app to work better with my habits and intuition, using customizations I made or found. Most of these scripts, clippings and such are grounded or anchored to a native BBEdit command. Often I’m just trying to lean into a muscle memory.

 “If I can move a line down, it would be nice if I could copy a line down in a similar way.” 

 “If this key-command does this work in this context it should do that in another.“

This is the kind of work I want this package to do. Little friction reducers that don’t don’t fight with the BBedit default commands and settings.

It’s my throw rug for my text editor. I think it really brings the room together. 

## Installation, and Rake Commands

Download or clone this project. Give it the file extension .bbpackage and double click it. BBedit will install it into _~/Library/Application Support/BBEdit/Packages_. This will not install the menu scripts. There are further instructions below. 

All the AppleScripts in this package are in sub-folders of the folder _Uncompiled Applescripts_. These are plain text versions of the scripts. The compiled versions are in a corresponding folder under _Contents_ and are the versions used by BBedit. 

The Menu Scripts are different. They are in the package only in a plain text version. You can open them with Script Editor and save them into _~/Library/Application Support/BBEdit/Menu Scripts_ as compiled scripts. There are [Rake](https://github.com/ruby/rake) commands to help install and manage the package if you wish.

Any of these scripts can be copied and installed outside of the package of course.

### Rake commands

- __rake install__, installs this project as a Cursor Tricks.bbpackage into BBedits Packages folder. It runs backup, and compiles as prerequisites before installing the package.
- __rake compile__, compiles all applescripts except the menu scripts.
- __rake backup__, backs up the installed (and presumably working) copy of this package as Cursor Tricks.backup.
- __rake lines:compile__, compiles all applescripts in the Lines directory.
- __rake white\_space:compile__, compiles all applescripts in White Space.
- __rake resources:compile__, compiles all applescripts in resources.
- __* rake menu\_scripts:install__, compiles & installs into ../BBedit/Menu Scripts/. It doesn’t run as part of the install command, you must run this command explicitly.
- __rake -T__ to list these commands.

## Scripts

### Lines:

- __Copy Line Down__, takes the selected lines duplicates them. The new lines, below the originals, will be selected. Sort of moving down the document.
- __Copy Line Up__, duplicates the selected lines but leaves the selection put.

These a two scripts are meant as to compliments BBedits __Edit > Lines > Move Line Down__ & __Edit > Lines > Move Line Up__. The two native commands have the default keyboard shortcuts of __⌃ ↓__ &  __⌃ ↑__. So I use and recommend the shortcuts  __⌃ ⌥ ↓__ &  __⌃ ⌥ ↑__ respectively.

- __Smart Home Move__, moves the cursor to start of the line not including prepended white space.
- __Smart Home Select__, selects to the start of the line not including prepended white space.

These two are meant to replace  the default behavior of __⌃ ←__ and __⌃ ⇧ ←__ . 
They are pulled directly from this blog post. It’s well written and worth a read. 
[Extending BBEdit with AppleScript](https://jonbeebe.net/2017/07/extending-bbedit-with-applescript/)

I made a small change to make them work in search fields. Kind of a hack and will bring up a accessibility security dialog. It tells System Events to keystroke _⌘ ↑_. Which takes you to the beginning of a document. In a one line search field that is a pretty good fallback.

### White Space: 
_\* The cursor will be represented with a_ ∫

- __Wrap with Spaces__, wraps the cursor or selection in spaces.

```
It makes this, {∫}  
Into this, { ∫ }
```

This script could be a BBEdit clipping. But making it a script seems appropriate, and keeps it from popping up in code suggestions. 
 
- __Clever  Indent__, looks at the text on the current line, then changes and indents the next line according to what it sees.


The default behavior is to make a new line and indent it.  
This should works great for languages and markup with significant indentation like Python and Haml.

```
Text∫

Text
    ∫
``` 

If it detects one of these characters __(, {, [, “, ‘, \`__ (bracket characters), or a xml/html tag on the left side of the cursor it will close it wrapping the cursor. 

```
{∫  

{∫}
```

```HTML
<div>∫

<div>∫</div>
```

If you use a tag but you don’t have the document type set to a markup language , it will start the closing tag for you but you will have to finish the name.

```HTML
<div>∫

<div></∫
```

If the cursor is wrapped in bracket characters it will make two new lines and indent the first one.  

```Javascript
function () {∫} 

function () {
    ∫
}
```

It works the same for tags.

```HTML
<div>∫</div>

<div>
	∫
</div>
```

If it detects a Ruby key word or control statement it will make two new lines indenting the first one and adding the _end_ statement. 

```Ruby

Array.each do ∫

Array.each do
    ∫
end

```

Special case for ruby block parameter delimiters.  

```Ruby
Array.each do |∫
	
Array.each do | ∫ |
```

Then this still works of course.

```Ruby
Array.each do | param | ∫

Array.each do | param |
    ∫
end
```

Currently the script will close a tag in these doc types : HTML, XML, Ruby in HTML, PHP in HTML. Your “_Language in HTML_” can be added pretty easy. Add it to  _markup\_docs_ a list set near the top of the script (line 31).

The __Cleaver Indent__ script was inspired by this: [Smart New Line](http://www.angelwatt.com/words/2011/04/11/bbedit-smart-newline-open-line/). I was actually shopping for something ruby specific but ran across this. I was impressed by how flexible it was. _Smart New Line_ does more than my script, such as incrementing numbered list. It’s pretty cool and you should check it out, but it doesn’t quite fit for me.

I use auto-pairing for bracket characters. I wanted my script to know when the cursor was wrapped. 

Also I wanted it to fit with BBedits __New Line After Paragraph__. It uses the key-command _command ↵_ and will make a new line without disturbing the current line / paragraph. Kind of jumping you down there.

I set __Clever Indent__ to __⌘  ⌥ ↵__. It’s function is to encapsulate. So “_{}_” from a Javascript function, ” _do end_” from a Ruby block, or  a new line with and indent with Python or Haml. It might make sense for it to indent and name a new section of an outline but not to increment a flat list.

The script doesn’t just insert text but inserts a BBedit clipping. It’s useful because I can take advantage of clippings features. Such as the #INDENT# placeholder, so I don’t have to be concerned with capturing the current lines leading whitespace.

I also made  __Clever Indent__ respect expanded tabs with a separate terse script “_ex\_tabs.scpt_” that is called by it’s clippings and lives right there in _Contents/Resources/_. It simplifies the big script and can be used by any clipping (or AppleScript) added in the future.

So my mental model is:

- __↵__ for a new line at the cursor.
- __⌘ ↵__ for a new line ignoring the cursor position. 
- __⌘ ⌥ ↵__ to encapsulate the cursor or new line.

I like this a lot. I find I’m simplifying my Clippings and using less of them. I don’t have to think ahead just to use a fancy clipping with a bunch of placeholders. This works really well with me in the flow of things.

### Menu Scripts

- __Window•Scratchpad & Window•Unix Worksheet__, activates the project versions of Scratchpad and Unix Worksheet if a project window is active.

This is my favorite, because it uses my three favorite features in BBEdit.

_Menu Scripts_ let you prepend a script to a native menu command and optionally continues with command. As well as append a script so it runs after the command. Just a great idea.

_Scratchpad_ is a persistent document in BBedit. The name really kind of says it. It doesn’t sound like much but in practice it’s great.

_Unix Worksheets_ are documents that will execute shell commands when you __⌃ ↵__ at the end of a line. It’s the command line meets a text document. You can make and save as many as you like but BBedit also has a persistent one available through the _Window_ menu just like Scratchpad.

I have these two persistent documents assigned to __⌘ 1__ and __⌘ 2__ respectively.

What I recently discovered was that every BBEdit project also get a Scratchpad and a persistent Unix Worksheet. With this script the project versions are just as easy to activate. __⌘ 1__ and __⌘ 2__ in my case, when a project is the frontmost window.

If you wish to access the app level documents while leaving a project in front, then hold __⌥__ and activate them from the _Window_ menu. You can also get them by right clicking the BBEdit icon in the dock.

- __Lines•New Line After Paragraph__, captures the leading white space from the current line, then applies it to the new line. 

I found that I pretty much always want auto indenting. This command can save you a little “arrowing” around but it’s pointless if you have to tab over to your current indention. 

- __Search•Find & Select All__ after selection is made , it brings Document 1 forward if Find Window is the frontmost window. The default key command is __⌘ ⌥ ⌃ G__, which is in a family of __⌘ G__ and __⌘ E__ key commands that are pretty powerful when used in combination.

- __Select•Live Search Results__ after selection, dismisses Live Find bar so you can edit selection immediately.

Both these scripts exist for the same reason. I feel if a command makes a selection that selection should immediately be available to edit. It frustrates me every time I have to dismiss an iterface element to get to my selection.

The command _Select > Live Search Results_ has a sister command called _Select > Highlighted Matches_. When the curser is over a word BBEdit will “highlight” every other occurrence. Hit the command and it will select them all for editing. I set it to -and I’m kind of proud of this- __⌘ ⌥ ⌃ H__. It is so much like _Search•Find & Select All_ with __⌘ ⌥ ⌃ G__. The functionality is basically the same and _H_ both stands for highlight and is next to _G_. I truly think it should be the default.

I also think __⌘ ⌥ ⌃ G__ should do double duty and run _Select > Live Search Results_ if live search is open. I haven’t figured out a way to make that happen. Well, I have an idea but it would litter up the script menu and I don’t use live search that much anyway. Also, it might not work.

## Planned Maybe Additions

- Maybe add some fancy list stuff to the Copy Line Down script.
- Probably should add some AppleScript affordances  to Clever Indent script.
- Add some outlining features to Clever Indent

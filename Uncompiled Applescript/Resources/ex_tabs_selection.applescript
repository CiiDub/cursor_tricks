# Expands tabs if indicated in app settings and indents selection.
set old to AppleScript's text item delimiters
set AppleScript's text item delimiters to {linefeed}
tell application "BBEdit"
	tell text window 1
		set _indent to ""
		set ex_tabs to expand tabs
		set tab_width to tab width
		set sel to contents of selection
		set sel_list to every text item of sel
	end tell
	
	if ex_tabs then
		repeat tab_width times
			set _indent to _indent & " "
		end repeat
	else
		set _indent to "	"
	end if
	
	if (count of sel_list) is 1 and item 1 of sel_list is " " then
		set AppleScript's text item delimiters to old
		return _indent
	end if
	
	if (count of sel_list) > 0 then
		if item 1 of sel_list is "" or item 1 of sel_list is " " then set sel_list to rest of sel_list
		if item -1 of sel_list is linefeed then set sel_list to reverse of rest of reverse of sel_list
		repeat with _line in sel_list
			set contents of _line to _indent & contents of _line
		end repeat
		set output to sel_list as string
		set AppleScript's text item delimiters to old
		return output
	else
		set AppleScript's text item delimiters to old
		return _indent
	end if
end tell
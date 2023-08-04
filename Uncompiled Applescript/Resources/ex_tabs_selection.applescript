# Expands tabs if indicated in app settings and indents selection.
set old to AppleScript's text item delimiters
set AppleScript's text item delimiters to {linefeed}
tell application "BBEdit"
	tell text window 1
		set _indent to ""
		set ex_tabs to expand tabs
		set tab_width to tab width
		set sel to contents of selection
		if (count of sel) > 0 and (text -1 of sel) is "
" then
			set sel to texts 1 thru -2 of sel
		end if
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
		
		set _min_indent to 1000
		repeat with _line in sel_list
			set _cmd to "echo " & quoted form of _line & " | " & "grep -o '^[ 	]*'"
			set cmd_output to do shell script _cmd
		end repeat
		
		set _line_indent to (count of cmd_output)
		if _min_indent > _line_indent then
			set _min_indent to _line_indent
		end if
		
		repeat with _line in sel_list
			set new_line to contents of _line
			# Remove min number of indents
			set _cmd to "echo " & quoted form of _line & " | " & " sed -r 's/^[ 	]{" & _min_indent & "}//' "
			set new_line to do shell script _cmd
			set contents of _line to _indent & new_line
		end repeat
		
		set output to sel_list as string
		set AppleScript's text item delimiters to old
		return output
	else
		set AppleScript's text item delimiters to old
		return _indent
	end if
end tell
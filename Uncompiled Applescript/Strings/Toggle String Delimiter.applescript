property strLib : load script POSIX path of (((path to application support folder from user domain) as text) & "BBEdit") & "/Packages/Cursor Tricks.bbpackage/Contents/Resources/string_lit.scpt"
# Check getHoveredString in Resources folder
set strHovered to strLib's getHoveredString()

tell application "BBEdit"
	tell text window 1
		set cursor to characterOffset of selection
		set highlight to (length of selection) + cursor
		set playBeep to true
		
		if hover of strHovered then
			if regex of strHovered then return beep
			set re_quote to "\""
			if double_quote of strHovered then set re_quote to "'"
			set character (str_start_char of strHovered) to re_quote
			set character (str_end_char of strHovered) to re_quote
			set playBeep to false
		end if
		
		if highlight is cursor then
			select insertion point before character cursor
		else
			select (characters cursor thru (highlight - 1))
		end if
		
		if playBeep then beep
	end tell
end tell
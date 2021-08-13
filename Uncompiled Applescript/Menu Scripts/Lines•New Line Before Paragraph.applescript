on menuselect(menu_name, item_name)
	if menu_name = "Lines" and item_name = "New Line Before Paragraph" then
		tell window 1 of application "BBEdit"
			set this_line to startLine of selection
			set white_space to find "^[ 	]+" options {search mode:grep} searching in line this_line of document 1
			if found of white_space = true then
				set indent to found text of white_space
				set indent_length to length of indent
				make new line at line (this_line -1) with data indent
				select insertion point after character indent_length of line this_line
				return true
			else
				return false
			end if
		end tell
	end if
end menuselect
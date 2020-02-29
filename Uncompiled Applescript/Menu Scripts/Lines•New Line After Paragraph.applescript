on get_indent()
	tell application "BBEdit"
		get properties of project window 1
		set current_line to startLine of selection of project window 1
		set white_space to find "^[ 	]+" options {search mode:grep} searching in line (current_line - 1) of document 1
		if found of white_space then
			return found text of white_space
		else
			return false
		end if
	end tell
end get_indent

on menuselect(menu_name, item_name)
	return false
end menuselect

on postmenuselect(menu_name, item_name)
	if menu_name = "Lines" and item_name = "New Line After Paragraph" then
		tell application "BBEdit"
			tell project window 1
				set current_line to startLine of selection
				set indent to my get_indent()
				if indent is false then return
				set text of line current_line to indent
				select insertion point after last character of line current_line
			end tell
		end tell
	end if
end postmenuselect
on menuselect(menu_name, item_name)
	if menu_name = "view" and item_name = "Balance" then
		set highjack_command to false
		set bumpSelection to false
		tell window 1 of application "BBEdit"
			try
				set cursor to (characterOffset of selection)
				set selectionEnd to ((length of selection) + cursor - 1)
				set leadChar to character (cursor - 1)
				set trailingChar to character (selectionEnd + 1)
				set leadPattern to quoted form of "[\\(\\{\\[“‘]"
				set trailingPattern to quoted form of "[\\}\\)”’]|\\]"
			end try
			try
				do shell script "echo '" & leadChar & "' | grep -q " & leadPattern
				do shell script "echo '" & trailingChar & "' | grep -Eq " & trailingPattern
				set highjack_command to true
				set bumpSelection to true
			end try
			if bumpSelection then select (characters (cursor - 1) thru (selectionEnd + 1))
		end tell
		return highjack_command
	end if
end menuselect
property strLib : load script POSIX path of (((path to application support folder from user domain) as text) & "BBEdit") & "/Packages/Cursor Tricks.bbpackage/Contents/Resources/string_lit.scpt"
set strHovered to strLib's getHoveredString()

tell application "BBEdit"
	tell text window 1
		if hover of strHovered then
			set cursor to (characterOffset of selection) - 1
			set cursorEnd to (length of selection) + cursor
			if cursor = ((str_start_char of strHovered)) and cursorEnd + 1 = (str_end_char of strHovered) then
				select (characters (str_start_char of strHovered) thru (str_end_char of strHovered))
			else
				select (characters ((str_start_char of strHovered) + 1) thru ((str_end_char of strHovered) - 1))
			end if
		else
			beep
		end if
	end tell
end tell

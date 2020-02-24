# Expands tabs if indicated in app settings.
tell application "BBEdit"
	set ex_tabs to expand tabs of window 1
	set tab_width to tab width of window 1
	set output to ""
	
	if ex_tabs then
		repeat tab_width times
			set output to output & " "
		end repeat
	else
		set output to "	"
	end if
	
	return output
end tell
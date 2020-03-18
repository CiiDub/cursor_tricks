on menuselect(menu_name, item_name)
	if menu_name = "Search" and item_name = "Find & Select All" then
		return false
	end if
end menuselect

on postmenuselect()
	tell application "BBEdit"
		if name of window 1 is "Find" then
			tell project window 1
				set index to 1
			end tell
		end if
	end tell
end postmenuselect
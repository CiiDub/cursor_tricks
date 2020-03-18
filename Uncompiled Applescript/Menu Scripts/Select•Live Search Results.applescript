on menuselect(menu_name, item_name)
	if menu_name = "Search" and item_name = "Find & Select All" then
		return false
	end if
end menuselect

on postmenuselect()
	tell application "BBEdit"
		tell project window 1
			set live search bar visible to false
		end tell
	end tell
end postmenuselect
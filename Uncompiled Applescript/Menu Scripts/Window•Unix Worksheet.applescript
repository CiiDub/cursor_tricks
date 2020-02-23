use framework "Foundation"
use framework "AppKit"
property NSEvent : a reference to current application's NSEvent
set mod_key to NSEvent's modifierFlags() as integer

on menuselect(menuName, itemName)
	if menuName = "Window" and itemName = "Unix Worksheet" then
		# If option key is pressed, then use menus normally
		set mod_key to NSEvent's modifierFlags() as integer
		if mod_key = 524288 then
			return false
		end if
		
		tell application "BBEdit"
			tell window 1
				set w_name to name
				set ext_test to ".bbprojectd"
				try
					set ext to characters -1 thru -11 of w_name as string
				on error
					set ext to ""
				end try
				if ext = ext_test then
					set is_proj to true
				else
					set is_proj to false
				end if
			end tell
			if is_proj is true then
				set proj to file of (project document 1)
				set ws to proj & "Unix Worksheet.worksheet" as string as alias
				open file ws opening in project window 1 with «class MdDa» and «class Scrt» without adding to recent list
				return true
			else
				return false
			end if
		end tell
	end if
end menuselect

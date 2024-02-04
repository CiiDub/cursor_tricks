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
			tell project document 1
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
				set cur_doc to name of document 1 of project window 1
				# Open project unix worksheet or toggle back to previously open document.
				# Try block catches if there is no previously open document.
				if cur_doc = "Unix Worksheet.worksheet" then
					try
						select document 2 of project window 1
					on error
						return true
					end try
				else
					set ws_path to ((file of project document 1 as text) & "Unix Worksheet.worksheet")
					open file ws_path opening in project window 1 with «class MdDa» and «class Scrt» without adding to recent list
				end if
				return true
			else
				return false
			end if
		end tell
	end if
end menuselect

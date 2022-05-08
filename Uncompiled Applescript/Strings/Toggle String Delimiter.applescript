on get_hovered_str(cursor, str)
	set app_sup to POSIX path of (path to application support folder from user domain) as text
	set scrp to app_sup & "BBEdit/Packages/Cursor Tricks.bbpackage/Contents/Resources/hoverstring.rb"
	set hover_str to do shell script "ruby " & quoted form of scrp & " " & cursor & " " & quoted form of str
	set oldDelimiters to AppleScript's text item delimiters
	set AppleScript's text item delimiters to " "
	set hover_arr to every text item of hover_str
	set AppleScript's text item delimiters to oldDelimiters
	hover_arr
end get_hovered_str

on reset_selection(sel_start, sel_end)
	tell application "BBEdit" to tell text window 1
		if sel_start is sel_end then return select insertion point before character sel_start
		select (characters sel_start thru (sel_end - 1))
	end tell
end reset_selection

tell application "BBEdit" to tell text window 1
	set doc to contents
	set sel_start to (characterOffset of selection)
	set sel_end to (length of selection) + sel_start
	set str_data to my get_hovered_str(sel_start, doc)
	
	if item 1 of str_data is "false" then return beep
	
	set str_start to item 2 of str_data as number
	set str_end to item 3 of str_data as number
	set str_style to item 4 of str_data
	
	if str_style is "regex" then retrun beep
	
	if str_style is "single" then set re_quote to "\""
	if str_style is "double" then set re_quote to "'"
	set character str_start to re_quote
	set character str_end to re_quote
	
	my reset_selection(sel_start, sel_end)
end tell
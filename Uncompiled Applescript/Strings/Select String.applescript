on get_hovered_str(cursor, str)
	set app_sup to POSIX path of (path to application support folder from user domain) as text
	set scrp to app_sup & "BBEdit/Packages/Cursor Tricks.bbpackage/Contents/Resources/hoverstring.rb"
	set hover_str to do shell script "export " & quoted form of "LANG=en_US.UTF-8" & "; ruby " & quoted form of scrp & " " & cursor & " " & quoted form of str
	set oldDelimiters to AppleScript's text item delimiters
	set AppleScript's text item delimiters to " "
	set hover_arr to every text item of hover_str
	set AppleScript's text item delimiters to oldDelimiters
	hover_arr
end get_hovered_str

on is_no_text_str(s_start, s_end, cursor)
	if s_end - s_start is not 1 then return false
	if s_start is cursor then return false
	true
end is_no_text_str

on is_text_selected(s_start, s_end, sl_start, sl_end)
	if s_start is not sl_start then return false
	if s_end - 1 is not sl_end then return false
	true
end is_text_selected

tell application "BBEdit" to tell text window 1
	set doc to contents
	set sel_start to (characterOffset of selection) - 1
	set sel_end to (length of selection) + sel_start
	set str_data to my get_hovered_str(sel_start, doc)
	
	if item 1 of str_data is "false" then return beep
	
	set str_start to item 2 of str_data as number
	set str_end to item 3 of str_data as number
	
	if my is_no_text_str(str_start, str_end, sel_start) then
		return select insertion point before character str_end
	end if
	
	if my is_text_selected(str_start, str_end, sel_start, sel_end) then
		return select (characters str_start thru str_end)
	end if
	
	select (characters (str_start + 1) thru (str_end - 1))
end tell

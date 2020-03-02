# Copies selected line while leaving the selection at the origin line.

tell application "BBEdit"
	set start_line to startLine of selection
	set end_line to endLine of selection
	set line_end to ""
	tell window 1
		set line_data to contents of lines start_line thru end_line
		
		try
			set testChar to last character of line_data
		on error
			set testChar to ""
		end try
		
		if ((count of lines) = 1) then
			make new line at line 1
		end if
		
		if (ASCII character 10) ≠ testChar then
			set line_end to "
"
		end if
		
		select insertion point before line (start_line)
		set selection to line_data & line_end
	end tell
end tell

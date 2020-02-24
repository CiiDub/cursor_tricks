# Copies selected line while leaving the selection at the origin line.

tell application "BBEdit"
	set start_line to startLine of selection
	set end_line to endLine of selection
	
	tell window 1
		set line_data to contents of lines start_line thru end_line
		set copy_offset to length of line_data
		set testChar to last character of line_data
		
		if (ASCII character 10) ≠ testChar then
			make new line at line (start_line - 1)
		end if
		
		select insertion point before line (start_line)
		set selection to line_data
	end tell
end tell

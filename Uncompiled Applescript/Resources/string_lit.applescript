on getHoveredString()
	tell application "BBEdit"
		tell text window 1
			set output to {hover:false}
			set docSize to count of characters of contents
			set cursor to (characterOffset of selection)
			set cursorLine to startLine of selection
			set searchStart to (characterOffset of line cursorLine)
			set searchEnd to searchStart + (length of line cursorLine)
			if searchStart ≥ searchEnd then return output
			if searchEnd > docSize then set searchEnd to docSize
			set searchRange to characters searchStart thru searchEnd
			set stringLit to "(?P<double>(?<!\\\\)\"[^\"\\\\]*(\\\\.[^\"\\\\]*)*\")|(?P<single>(?<!\\\\)'[^'\\\\]*(?:\\\\.[^'\\\\]*)*')"
			set go to true
			repeat while go
				set stringLitMatch to find stringLit searching in searchRange options {search mode:grep, backwards:true}
				if found of stringLitMatch then
					set match to found object of stringLitMatch
					set matchStart to (characterOffset of match)
					set matchEnd to matchStart + (length of match)
					if cursor > matchStart then set go to false
					if cursor = searchEnd and matchEnd = searchEnd then set go to false
					if cursor ≥ matchStart and cursor ≤ matchEnd then
						set output to {hover:true, str_start_char:matchStart, str_end_char:(matchEnd - 1), double_quote:true}
						if character 1 of found text of stringLitMatch is "'" then set double_quote of output to false
						set go to false
					else
						if searchStart > matchStart then exit repeat
						set searchRange to characters searchStart thru matchStart
					end if
				else
					set go to false
				end if
			end repeat
			return output
		end tell
	end tell
end getHoveredString
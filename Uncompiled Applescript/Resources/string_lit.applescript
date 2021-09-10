on getHoveredString()
	tell application "BBEdit"
		tell text window 1
			set output to {hover:false}
			set cursor to (characterOffset of selection) - 1
			set cursorLine to startLine of selection
			set searchStart to (characterOffset of line cursorLine)
			set searchEnd to searchStart + (length of line cursorLine) - 1
			if searchStart ³ searchEnd then return output
			set searchRange to characters searchStart thru searchEnd
			set stringLit to "(?P<double>(?<!\\\\)\"[^\"\\\\]*(\\\\.[^\"\\\\]*)*\")|(?P<single>(?<!\\\\)'[^'\\\\]*(?:\\\\.[^'\\\\]*)*')"
			set go to true
			repeat while go
				set stringLitMatch to find stringLit searching in searchRange options {search mode:grep}
				if found of stringLitMatch then
					set match to found object of stringLitMatch
					set matchStart to (characterOffset of match)
					if cursor < matchStart then set go to false
					set matchEnd to matchStart + (length of match) - 1
					if cursor = searchEnd and matchEnd = searchEnd then set go to false
					if cursor ³ matchStart and cursor < matchEnd then
						set output to {hover:true, str_start_char:matchStart, str_end_char:matchEnd, double_quote:true}
						if character 1 of found text of stringLitMatch is "'" then set double_quote of output to false
						set go to false
					else
						try
							set searchRange to characters (matchEnd + 1) thru searchEnd
						on error
							set go to false
						end try
					end if
				else
					set go to false
				end if
			end repeat
			return output
		end tell
	end tell
end getHoveredString
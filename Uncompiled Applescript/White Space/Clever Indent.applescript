# Sub-routines
# Input: String, Regex and Sub-Capture Group  | Output: Record with entry success:bool and optional entry capture:string
on testString(search_this, regex, cap_g)
	set _script to POSIX path of (path to application support folder from user domain) & "BBEdit/Packages/Cursor Tricks.bbpackage/Contents/Resources/check_string.rb"
	try
		set x to do shell script "ruby " & quoted form of _script & " " & quoted form of search_this & " " & quoted form of regex & " " & cap_g
		set caps to theSplit(x, "◊")
		return {success:true, captured:(item 1 of caps), sub_cap:(item 2 of caps)}
	on error
		return {success:false}
	end try
end testString

on theSplit(theString, theDelimiter)
	# save delimiters to restore old settings
	set oldDelimiters to AppleScript's text item delimiters
	# set delimiters to delimiter to be used
	set AppleScript's text item delimiters to theDelimiter
	# create the array
	set theArray to every text item of theString
	# restore the old setting
	set AppleScript's text item delimiters to oldDelimiters
	# return the result
	return theArray
end theSplit

# Reset selection after cleaning up whitespace
on reset_selection(c, c_l)
	tell window 1 of application "BBEdit" to select (characters (c - 1) thru (c_l - 2))
end reset_selection

on clean_up_whitespace(_captured_of, _cursor, _cursor_length)
	tell document 1 of application "BBEdit"
		if character -1 of _captured_of = " " then
			set contents of characters (_cursor - 1) thru (_cursor - 1) to ""
			if _cursor < _cursor_length then my reset_selection(_cursor, _cursor_length)
		end if
	end tell
end clean_up_whitespace

# Clippings
# This is the equivalent to ../../../ POSIX path. Thank you Dr. Drang
tell application "Finder" to set c_path to container of container of container of (path to me) as text
set home to POSIX path of c_path & "Resources/"
set one_over to POSIX file (home & "one_over")
set wrapped to POSIX file (home & "wrapped")
set ended to POSIX file (home & "ended")
set block_param to POSIX file (home & "block_param")
set bash_loop to POSIX file (home & "bash_loop")
set bash_if to POSIX file (home & "bash_if")
set bash_case to POSIX file (home & "bash_case")
set bash_elif to POSIX file (home & "bash_elif")

set open_bracket to "[{\\[('\"\\`] ?$|(<[a-z]*) ?[0-9a-z\"= ]*>$"
set close_bracket to "^ ?[\\]})'\"\\`]|^ ?</[a-z]+ ?>"

tell window 1 of application "BBEdit"
	try
		set doc_lang to source language of document 1
	on error
		set doc_lang to "missing value"
	end try
	set start_line to startLine of selection
	set line_offset to characterOffset of line start_line
	set line_length to length of line start_line
	
	set end_line to endLine of selection
	set end_line_offset to characterOffset of line end_line
	set end_line_length to length of line end_line
	
	set cursor to characterOffset of selection
	set cursor_length to (length of selection) + cursor
	set doc_length to count of lines
	
	tell document 1
		# Set start_text to text on the current line between the cursor and the beginning of the line.
		# The cursor sits on top of one character so it is offset by one.
		# Set start_text to empty string if at beginning of line.
		if line_offset = cursor then
			set start_text to ""
		else
			set start_text to contents of characters line_offset thru (cursor - 1) as string
		end if
		# Set end_text to line text (including) cursor to end of line.
		# Set end_text to empty sting when at end of line/document.
		if cursor_length ≥ end_line_offset + end_line_length then
			set end_text to ""
		else
			set ll_offset to 0
			if doc_length = end_line then set ll_offset to 1
			set end_text to contents of characters cursor_length thru (end_line_offset + end_line_length - ll_offset) as string
		end if
		
		# Check the line in front (start_text) and behind (end_text) the cursor against a regex.
		set start_results to my testString(start_text, open_bracket, "")
		set end_results to my testString(end_text, close_bracket, "")
		
		
		### INDENTION LOGIC 
		
		
		# Note: Indent wrapped cursor
		# If there is a bracketing character on both sides of the cursor
		if success of start_results and success of end_results then
			# Whitespace clean up.
			# I allowed for an optional space when detecting the bracket characters.
			# Because I like to pad my brackets, I even have a clipping for it, I figured it could be an issue.
			# Also tapping a space is an easy way to dismiss autofill.
			
			my clean_up_whitespace((captured of start_results), cursor, cursor_length)

			# clean_up_whitespace handler but uses cursor_length instead of cursor for range.
			if character 1 of (captured of end_results) = " " then
				set contents of characters (cursor_length - 1) thru (cursor_length - 1) to ""
				if cursor < cursor_length then my reset_selection(cursor, cursor_length)
			end if
			
			return insert clipping wrapped
		end if
		
		## LANGUAGE SPECIFIC/SPECIAL CASES BEGINS
		
		# Note: Ruby
		if doc_lang = "Ruby" then
			set param_regex to "do \\|$|{ ?\\|$"
			set ruby_regex to "^[	 ]*class [A-Z][a-z]+ ?|def [a-z]+ ?.* ?|if .+ ?|unless .+ ?|case .+ ?|while .+ ?|until .+ ?|begin ?|rescue ?"
			set do_regex to "do ?(\\|.*\\|)? ?"
			set param_results to my testString(start_text, param_regex, "")
			set ruby_results to my testString(start_text, ruby_regex, "")
			set do_results to my testString(start_text, do_regex, "")
			if success of param_results then
				return insert clipping block_param
			end if
			if success of ruby_results then
				# Whitespace clean up.
				my clean_up_whitespace((captured of ruby_results), cursor, cursor_length)
				return insert clipping ended
			end if
			if success of do_results then
				# Whitespace clean up.
				my clean_up_whitespace((captured of do_results), cursor, cursor_length)
				return insert clipping ended
			end if
		end if
		
		# Note: AppleScript
		if doc_lang = "AppleScript" then
			set osa_regex to "^[	 ]*(?:if .+ then ?|tell .+ ?|try ?|considering .+ ?|ignoring .+ ?|repeat ?.* ?|with (timeout|transaction) .+ ?|using terms from .+ ?)"
			set keyword_regex to "if|tell|try|considering|ignoring|repeat|timeout|transaction|using terms from"
			set handler_regex to "^[ 	]?(?:(on|to) (?!error)([a-zA-Z_-]+)[(]?.*[)]? ?)"
			set osa_results to my testString(start_text, osa_regex, "")
			set handler_results to my testString(start_text, handler_regex, "2")
			if cursor = cursor_length then
				set sel_space_offset to 0
				set ender_spacer to "  "
			else
				set sel_space_offset to 1
				set ender_spacer to " "
			end if
			if success of osa_results then
				set keyword_results to my testString((captured of osa_results), keyword_regex, "")
				set contents of character cursor_length to ender_spacer & (captured of keyword_results) & linefeed
				select (characters cursor thru (cursor_length - sel_space_offset))
				return insert clipping ended
			end if
			if success of handler_results then
				set contents of character cursor_length to ender_spacer & (sub_cap of handler_results) & linefeed
				select (characters cursor thru (cursor_length - sel_space_offset))
				return insert clipping ended
			end if
		end if
		
		# Note: Bash
		if doc_lang = "Unix Shell Script" or doc_lang = "Shell Worksheet" then
			set bash_regex to "^[ 	]*(if|elif|case) ?(\\[.+\\]|test.+|[a-zA-Z@$#_\\(\\)]+ in)"
			set bash_loops_regex to "^[ 	]*(while|until|select|for) ?(\\[.+\\]|test.+|[a-zA-Z@$#_\\(\\)]+ in [a-zA-Z@$#_\\(\\)]+) ?"
			
			set bash_loops_results to my testString(start_text, bash_loops_regex, "")
			if success of bash_loops_results then
				my clean_up_whitespace((captured of bash_loops_results), cursor, cursor_length)
				return insert clipping bash_loop
			end if
			set bash_results to my testString(start_text, bash_regex, "1")
			if success of bash_results then
				if sub_cap of bash_results = "if" then
					my clean_up_whitespace((captured of bash_results), cursor, cursor_length)
					return insert clipping bash_if
				end if
				if sub_cap of bash_results = "case" then
					my clean_up_whitespace((captured of bash_results), cursor, cursor_length)
					return insert clipping bash_case
				end if
				if sub_cap of bash_results = "elif" then
					my clean_up_whitespace((captured of bash_results), cursor, cursor_length)
					return insert clipping bash_elif
				end if
			end if
		end if
		
		# Note: Fish
		if doc_lang = "Fish Shell" then
			set fish_regex to "^[\t ]*function [a-z_]+ ?.* ?|if .+ ?|switch .+ ?|while .+ ?|for [\\w]+ in .+ ?|begin ?"
			set fish_results to my testString(start_text, fish_regex, "")
			if success of fish_results then
				# Whitespace clean up.
				my clean_up_whitespace((captured of fish_results), cursor, cursor_length)
				return insert clipping ended
			end if
		end if
		
		## LANGUAGE SPECIFIC/SPECIAL CASES ENDS
		
		# Note: Character Pairing ( Brackets and Tags )
		# Character Pairing removed. Its redundent and I didn't like how I implemented it.
		# But if I deside to redo it, this is the spot → ✘ ←.
		
		# Note: The simple indention
		return insert clipping one_over
	end tell
end tell
# Sub-routines
# Input: String and Regex | Output: Record with entry success:bool and optional entry capture:string
on testString(search_this, regex)
	try
		set x to do shell script "echo " & quoted form of search_this & " | egrep -o " & quoted form of regex
		return {success:true, captured:x}
	on error
		return {success:false}
	end try
end testString

#Match bracket character.
on match_bracket(l_brac)
	if l_brac = "'" then
		return "'"
	else if l_brac = "\"" then
		return "\""
	else if l_brac = "`" then
		return "`"
	else if l_brac = "{" then
		return "}"
	else if l_brac = "[" then
		return "]"
	else if l_brac = "(" then
		return ")"
	else if l_brac = ">" then
		return "</"
	end if
end match_bracket

set markup_docs to {"HTML", "XML", "Ruby in HTML", "PHP in HTML"}

# Clippings
# This is the equivalent to ../../../ POSIX path. Thank you Dr. Drang
tell application "Finder" to set c_path to container of container of container of (path to me) as text
set home to POSIX path of c_path & "Resources/"
set one_over to POSIX file (home & "one_over")
set wrapped to POSIX file (home & "wrapped")
set ended to POSIX file (home & "ended")
set block_param to POSIX file (home & "block_param")

set open_bracket to "[{[('\"\\`] ?$|(<[a-z]*) ?[0-9a-z\"= ]*>$"
set close_bracket to "^ ?[]})'\"\\`]|^ ?</[a-z]+ ?>"

tell window 1 of application "BBEdit"
	try
		set doc_lang to source language of text document 1
	on error
		set doc_lang to "missing value"
	end try
	set start_line to startLine of selection
	set line_offset to characterOffset of line start_line
	set line_length to length of line start_line
	set cursor to characterOffset of selection
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
		# Line length is offset to remove line ending "\n"
		# Set end_text to empty sting when at end of line/document.
		if cursor = line_offset + line_length then
			set end_text to ""
		else
			set end_text to contents of characters cursor thru (line_offset + line_length - 1) as string
		end if
		
		# Check the line in front (start_text) and behind (end_text) the cursor against a regex.
		set start_results to my testString(start_text, open_bracket)
		set end_results to my testString(end_text, close_bracket)
		 

		# INDENTION LOGIC

		
		# Note: Indent wrapped cursor
		# If there is a bracketing character on both sides of the cursor
		if success of start_results and success of end_results then
			# White space clean up.
			# I allowed for an optional space when detecting the bracket characters.
			# Because I like to pad my brackets, I even have a clipping for it, I figured it could be an issue.
			# Also tapping a space is an easy way to dismiss autofill.
			if character -1 of (captured of start_results) = " " then set contents of characters (cursor - 1) thru (cursor - 1) to ""
			if character 1 of captured of end_results = " " then set contents of characters (cursor - 1) thru (cursor - 1) to ""
			return insert clipping wrapped
		end if
		
		# LANGUAGE SPECIFIC BEGINS
		
		# Note: Ruby
		if doc_lang = "Ruby" then
			set param_regex to "do \\|$|{ ?\\|$"
			set ruby_regex to "^[	| ]*class [A-Z][a-z]+ ?|def [a-z]+ ?.* ?|if .+ ?|unless .+ ?|case .+ ?|while .+ ?|until .+ ?|begin ?|rescue ?"
			set do_regex to "do ?(\\|.*\\|)? ?"
			set param_results to my testString(start_text, param_regex)
			set ruby_results to my testString(start_text, ruby_regex)
			set do_results to my testString(start_text, do_regex)
			if success of param_results then
				return insert clipping block_param
			end if
			if success of ruby_results then
				# White space clean up.
				if character -1 of (captured of ruby_results) = " " then set contents of characters (cursor - 1) thru (cursor - 1) to ""
				return insert clipping ended
			end if
			if success of do_results then
				# White space clean up.
				if character -1 of (captured of do_results) = " " then set contents of characters (cursor - 1) thru (cursor - 1) to ""
				return insert clipping ended
			end if
		end if
		
		# Note: AppleScript
		if doc_lang = "AppleScript" then
			
		end if
		# Note: Fish
		# As far as I can tell there is no fish language module.
		
		# LANGUAGE SPECIFIC ENDS
		
		# Note: Character Pairing
		# If there is only a bracketing character on the leading side of the cursor, pairs the character.
		if success of start_results then
			if markup_docs contains doc_lang then
				select insertion point before character (cursor - 1)
				set _tag to inside tag
				set tag_name to name of tag of _tag
				select insertion point before character cursor
				set close_tag to "</" & tag_name & ">"
				if (line_offset + line_length) = cursor then set close_tag to close_tag & "
"
				set contents of character cursor to close_tag
				select insertion point before character cursor
				return
			end if
			# White space clean up.
			if character -1 of (captured of start_results) = " " then set contents of characters (cursor - 1) thru (cursor - 1) to ""
			set match_char to my match_bracket(character -1 of (captured of start_results))
			# If the cursor is at the end of a line it will write over the line endings.
			# This pertects against that.
			if (line_offset + line_length) = cursor then set match_char to match_char & "
"
			set contents of character cursor to match_char
			# Fallback if markup doc not selected or isn't supported.
			# Starts a tag and sets the cursor in position to type tag name. 
			if match_char = "</" or match_char = "</"& linefeed then
				select insertion point before character (cursor + 2)
				return
			else
				select insertion point before character cursor
				return
			end if
		end if
		 
		return insert clipping one_over
	end tell
end tell
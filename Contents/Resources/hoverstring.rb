#!/usr/bin/env ruby

def get( cursor_offset, doc )
	processed_doc = process_doc( doc )
	hovered_match = find_hovered_match( find_all_matches( processed_doc, str_pattern ), cursor_offset )
	return make_output_string( nil ) if hovered_match.nil?

	hovered_nested_match =
		find_hovered_match(
			find_all_matches( hovered_match.to_s[1..-2], str_pattern ).reject { | nm | nm[:regex] },
			cursor_offset,
			hovered_match
		)
	hovered_nested_match.nil? ? make_output_string( hovered_match ) : make_output_string( hovered_nested_match, hovered_match )
end

def str_pattern
	single = /(?<single>(?<!\\)'[^'\\]*(?:\\.[^'\\]*)*')/
	double = /(?<double>(?<!\\)"[^"\\]*(?:\\.[^"\\]*)*")/
	regex  = %r{(?<regex>(?<!\\\|[#!]|\w)/.*/)}

	Regexp.union( single, double, regex )
end

def process_doc( doc )
	# Weird case where with strings in Applescript with a double excaped quote would throw off offset.
	replace_double_escaped_quote = -> { doc.gsub( '\\"', '**' ) }

	# BBEdit (utf-16?) counts emoji as two chars, while Ruby (utf-8) counts them as one.
	replace_four_byte_chars = -> {
		doc.chars.map do | char |
			next char unless char.bytesize == 4

			'**'
		end.join
	}

	# I can't figure out how to account for apostrophes so I will remove them.
	replace_apostrophes = -> { doc.gsub( /\w'\w/, '***' ) }

	doc = replace_double_escaped_quote.call
	doc = replace_four_byte_chars.call
	doc = replace_apostrophes.call
end

def find_all_matches( str, regex )
	match_objects = []
	str.scan( regex ) { match_objects << Regexp.last_match }
	match_objects
end

def find_hovered_match( matches, cursor, parent_match = nil )
	p_offset = parent_match.nil? ? 0 : parent_match.begin( 0 ) + 1
	matches.reverse.find do | m |
		( m.begin( 0 ) + p_offset ) <= cursor && ( m.end( 0 ) + p_offset ) >= cursor
	end
end

def make_output_string( match, parent_match = nil )
	return false if match.nil?

	p_offset = parent_match.nil? ? 0 : parent_match.begin( 0 ) + 1
	s_type = ->( m ) {
		return 'double' if m[:double]

		return 'single' if m[:single]

		'regex' if m[:regex]
	}

	# Output format: Found String=True|False, Cursor OffsetA=Int, Cursor OffsetB=Int, String Type=Double Quotes|Single Qoutes|Regex literal
	"true #{match.begin( 0 ) + p_offset + 1} #{match.end( 0 ) + p_offset} #{s_type.call( match )}"
end

puts get( ARGV[0].to_i, ARGV[1] )

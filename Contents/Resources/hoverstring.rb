#!/usr/bin/env ruby

def get( cursor_offset, doc )
	str_pattern = /(?<double>(?<!\\)"[^"\\]*(?:\\.[^"\\]*)*")|(?<single>(?<!\\)'[^'\\]*(?:\\.[^'\\]*)*')|(?<regex>(?<!\\\|[#!]|\w)\/.*\/)/
	
	processed_doc = -> {
		doc.gsub('\\"','&&')
	}.call
	 
	hovered_match = -> {
		all_matches = get_all_matches( processed_doc, str_pattern )
		find_hovered_match( all_matches, cursor_offset )
	}.call
	
	return make_output_hash( nil ) if hovered_match.nil?
	
	hovered_nested_match = -> {
		nested_matches = get_all_matches( hovered_match.to_s[1..-2], str_pattern ).reject{ |nm| nm[:regex] }
		find_hovered_match( nested_matches, cursor_offset, hovered_match )
	}.call
	
	hovered_nested_match.nil? ? make_output_hash( hovered_match ) : make_output_hash( hovered_nested_match, hovered_match )
end

def get_all_matches( str, regex )
	match_objects = []
	str.scan( regex ){ match_objects << Regexp.last_match }
	match_objects
end

def find_hovered_match( matches, cursor, parent_match=nil )
	p_offset = parent_match.nil? ? 0 : parent_match.begin(0) + 1
	matches.reverse.find do | m |
		( m.begin(0) + p_offset ) <= cursor && ( m.end(0) + p_offset ) >= cursor
	end
end

def make_output_hash( match, parent_match=nil )
	return false if match.nil?
	p_offset = parent_match.nil? ? 0 : parent_match.begin(0) + 1
	s_type = -> ( m ) {
		return 'double' if m[ :double ]
		return 'single' if m[ :single ]
		'regex' if m[ :regex ]
	}
	"#{true} #{( match.begin(0) + p_offset + 1 )} #{( match.end(0) + p_offset )} #{s_type.call( match )}"
end

puts get( ARGV[0].to_i, ARGV[1] )
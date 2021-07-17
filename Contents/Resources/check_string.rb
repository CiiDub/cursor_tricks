str       = ARGV[ 0 ]
regex     = ARGV[ 1 ]
success   = false
captured  = ""
sub_cap   = ""
ARGV[ 2 ] ? cap_group = ARGV[ 2 ] : cap_group = "0"

if m = str.match( regex )
	success  = true
	captured = m[ 0 ]
	m[ cap_group.to_i ] ? sub_cap  = m[ cap_group.to_i ] : sub_cap = captured
end

output = "#{captured}◊#{sub_cap}"

if success	
	print output
end
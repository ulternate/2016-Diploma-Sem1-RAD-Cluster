# A function to print addressess

joe_addr = {
	street: "23 St George St.",
	city: "Perth",
	state: "WA",
	postcode: "1234"
}

darin_addr = {
	street: "324 Campus Dr.",
	city: "Adelaide",
	state: "SA",
	postcode: "6111"
}

# Print the address
# @param address = the hash of the address you're wanting to print.
def print_addr(address)
	puts "Address: #{address[:street]}\n" + \
			"City: #{address[:city]}\n" + \
			"State: #{address[:state]}, Postcode: #{address[:postcode]}"
end

puts "Joe: "
print_addr(joe_addr)

puts "\n\nDarin: "
print_addr(darin_addr)

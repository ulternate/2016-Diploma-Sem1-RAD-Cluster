# A class file for addresses
# Note, if you use attr_accessor then the getter and setter methods are automatically
# created when you create an instance of the Address class, so I only need to
# provide a way of initialising the class.
class Address
	attr_accessor :street, :city, :state, :postcode

	def initialize(street, city, state, postcode)
		@street = street
		@city = city
		@state = state
		@postcode = postcode
	end
end

# Create a new address just to demonstrate the class working.
address = Address.new("23 St. George Street.", "Perth", "WA", "6000")

# Print the address
# @param address = the object you're wanting to print. 
# You can see that address.street is the inbuild accessor for the @street variable, which
# attr_accessor creates for me and I don't need to write.
def print_addr(address)
	puts "Address: #{address.street}\n" + \
			"City: #{address.city}\n" + \
			"State: #{address.state}, Postcode: #{address.postcode}"
end

# Print our address.
print_addr(address)

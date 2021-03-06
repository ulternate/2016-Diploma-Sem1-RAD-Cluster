# A class file for addresses
# Note, if you use attr_accessor then the getter and setter methods are automatically
# created when you create an instance of the Address class, so I only need to
# provide a way of initialising the class.
class Address
	attr_accessor :street, :city, :state, :postcode

	# Initialise the Address class.
	def initialize(street, city, state, postcode)
		@street = street
		@city = city
		@state = state
		@postcode = postcode
	end

	# return a string to print out the full address.
	def to_s
		return "Address: #{@street}\n" + \
			"City: #{@city}\n" + \
			"State: #{@state}, Postcode: #{@postcode}"
	end
end

# A class for a Person
class Person
	attr_accessor :first_name, :email, :last_name, :address

	def initialize(first_name, last_name, email="", address)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@address = Address.new(address.street, address.city, address.state, address.postcode)
	end

	def full_name
		return "#{@first_name} #{@last_name}"
	end

	def to_s
		return "Name: #{full_name()}\n" + \
				"Email: #{@email}\n" + \
				"#{@address.to_s()}"
	end

end

# Create a new person and address just to demonstrate the classes working.
# Note, as email has a default value of "" I can pass nil to it and get the default value
address = Address.new("23 St. George Street.", "Perth", "WA", "6000")
person = Person.new("Sandy", "Koh", nil, address)

# Testing, these can be commented out if you want.
# Print the full name of the person by calling the full_name method in the Person class.
# puts person.full_name()

# Print the address using the Address.to_s method to get the string of the entire address.
# puts address.to_s()

# Exercise 1:
# Print the person using the Person.to_s method, which will call the Address.to_s method too
puts person.to_s()

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


# A class for our addressbook.
class AddressBook
	attr_accessor :persons

	def initialize
		@persons = []
	end

	def add(person)
		@persons << person
		@persons.sort! { |a, b| sort_by_name(a, b) }
	end

	def remove(person)
		@persons.delete(person)
	end

	# Iterators
	
	# Each  method
	# This will yield person.full_name to the calling block
	# person.full_name is used to only get the name as person.to_s includes the address.to_s
	def each
		@persons.each { |p| yield p.full_name }
	end

	# Each_address
	# This will yield person.address to the calling block
	def each_address
		@persons.each { |p| yield p.address }
	end

	# Sort Method

	# Sort method to sort by first then last name
	def sort_by_name(a, b)
		if a.first_name == b.first_name
			a.last_name <=> b.last_name
		else
			a.first_name <=> b.first_name
		end
	end


end

# Create a new person and address just to demonstrate the classes working.
# Note, as email has a default value of "" I can pass nil to it and get the default value
address = Address.new("23 St. George Street.", "Perth", "WA", "6000")
person1 = Person.new("Sandy", "Koh", nil, address)
person2 = Person.new("John", "Smyth", nil, address)
person3 = Person.new("Sandy", "Apples", nil, address)

# Testing, these can be commented out if you want.
# Print the full name of the person by calling the full_name method in the Person class.
# puts person.full_name()

# Print the address using the Address.to_s method to get the string of the entire address.
# puts address.to_s()

# Create an address book and then print the entries, this tests our sort, it should go
# John, then Sandy Apples, then Sandy Koh
addressbook = AddressBook.new()
addressbook.add(person1)
addressbook.add(person2)
addressbook.add(person3)

# Use the newly created each methods and for each obj the each method will yield back
# a resulting object that we are printing using puts obj.
puts "Each person:"
addressbook.each { |obj| puts obj }
puts "\nEach address:"
addressbook.each_address { |obj| puts obj }

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
	# This will yield the person object to the calling block
	def each
		@persons.each { |p| yield p }
	end

	# Each_address
	# This will yield person.address to the calling block
	def each_address
		@persons.each { |p| yield p.address }
	end

	# Private methods, used only in the class itself
	private

	# Sort method to sort by first then last name
	def sort_by_name(a, b)
		if a.first_name == b.first_name
			a.last_name <=> b.last_name
		else
			a.first_name <=> b.first_name
		end
	end
end

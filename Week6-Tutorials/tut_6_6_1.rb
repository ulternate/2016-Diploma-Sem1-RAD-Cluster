require_relative "tut_6_6"

# The code above will use our addressbook code from tut_6_6.rb
# And allow us to add addresses, persons and entries to our AddressBook

# Variables we'll use to refer to our AddressBook.
@address_book = AddressBook.new()

# Get and save all the user entered info to the address_book
# Display a helpful message if the times parameter is provided
# i.e. 'Enter contact 3's first name: '
def create_and_add_person(times = "")
	if times == ""
		intro_msg = "\nEnter the contact's first name: "
	else
		intro_msg = "\nEnter contact #{times}'s first name: "
	end
	print intro_msg 
	first_name = gets.chomp
	print "Enter their last name: "
	last_name = gets.chomp
	print "Enter their email address: "
	email = gets.chomp
	print "Enter their street address: "
	street = gets.chomp
	print "Enter their city: "
	city = gets.chomp
	print "Enter their state: "
	state = gets.chomp
	print "Enter their postcode: "
	postcode = gets.chomp

	# Add the new person and address in the address book. This will be sorted naturally by full_name
	@address_book.add(Person.new(first_name,
								last_name,
								email,
								Address.new(street,
											city,
											state,
											postcode)
								)
					)

	puts "Successfully added #{first_name} #{last_name} to the address_book\n"
end


# -------------------------Exercise 1----------
# Get and add user info once
puts "Exercise 1:"
puts "I'll let you add a contact to the addressbook\n"
create_and_add_person() 


# -------------------------Exercise 2----------
# Get and add user info three times.
puts "\n\nExercise 2:"
puts "Ok, you've added one contact, now I'll let you add three.\n"
3.times { |n| create_and_add_person((n+1).to_s) }


# -------------------------Exercise 3----------
# List all the objects in the address book, including their addresses.
puts "\n\nExercise 3:"
puts "Ok, here are all the contacts you've added:\n"
# Print the person and address using the Person.to_s method.
@address_book.each { |person| puts "#{person.to_s}\n\n" } 

# -------------------------Exercise 4----------
# Remove a person from the address book if it matches the full_name of a person in it.
# Otherwise print an error message.
puts "Exercise 4:"
puts "Ok, now lets remove a contact from the list\n"
print "Enter the name of the person to remove: "
full_name = gets.chomp
match = false
@address_book.each do |person|
	if person.full_name == full_name
		@address_book.remove(person)
		match = true
	end
end
if match
	puts "\n\nSuccessfully deleted #{full_name}."
else
	puts "\n\nNo match found in the address book for #{full_name}."
end


# -------------------------Exercise 5----------
# Reprint the full address book, printing a different message if no-one was removed in Exercise 4
puts "\n\nExercise 5:"
if match
	puts "Ok, here are all the contacts you have now:\n"
else
	puts "I couldn't find #{full_name} so nothing has changed, but here's your addressbook:\n"
end
# Print the person and address using the Person.to_s method.
@address_book.each { |person| puts "#{person.to_s}\n\n" } 

# Goodbye
puts "\n\nGoodbye"

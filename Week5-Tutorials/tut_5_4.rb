#
# An address book example, the tutorial exercises will extend on this 
#

# An empty array we'll use to store the address book entries in
address_book = []

# An address shall have a Street, City, State, PC & email
# A person shall have a first name, surname, phone number and address (which points to the hash)

puts "\n\nWelcome to my address book program\n\n"
puts "This covers exercises 1 and 2\n\n"

#Variables used by the program
first_name = ""
surname = ""
phone_number = 0

# I'm looping through to ensure the name is of the correct type.
repeat = true
while repeat
	puts "Please enter the name of the person you'd like to add " + \
		"You can add their whole name ie. Daniel Swain or Daniel Christopher Swain is supported\n\n"
	name = gets.chomp
	name_arr = name.split(" ")
	#set the first name, last name and middle names
	case 
	when name_arr.length == 0
		puts "\nNo name was added, please try again\n\n"
		repeat = true
	when name_arr.length == 1
		puts "\nNo surname/middle names were added\n\n"
		repeat = true
	when name_arr.length > 1
		# grab the first name and the surname, with the surname being a combination of the last name
		# and middle name, last name being first.
		first_name = name_arr[0]
		(1...name_arr.length).each { |n| surname += "#{name_arr[name_arr.length - n]} " }
		repeat = false
	end
end

#not to fussed about the type of the input for the remainder of the program
puts "\n\nPlease enter their phone number\n"
phone_number = gets.chomp

puts "\n\nPlease enter their street address, i.e. 20 Unit Street (Don't enter their suburb)\n"
street_address = gets.chomp

puts "\n\nPlease enter their city, i.e. Perth\n"
city = gets.chomp

puts "\n\nPlease enter their state, i.e. WA\n"
state = gets.chomp

puts "\n\nPlease enter their post code, i.e 6000\n"
post_code = gets.chomp

puts "\n\nPlease enter their email address, i.e. address@email.com\n"
email = gets.chomp

#Ok, now lets save all of these into our hash
person = {
	first_name: first_name,
	surname: surname,
	phone_number: phone_number,
	address: {
		street_address: street_address,
		city: city,
		state: state,
		post_code: post_code,
		email: email
	}
}

# Add the person to the address book
address_book << person

#We've added the person, lets show the user
puts "\n\nYou have added #{name} to the addressbook as evidenced below.\n\n"
print address_book

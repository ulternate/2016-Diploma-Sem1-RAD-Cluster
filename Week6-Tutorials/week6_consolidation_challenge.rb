# I would like you to create a system that will store contacts (name, address, location,email, telephone, DOB, favourite)
# I want to be able to search for a contact, add a new contact, remove a contact, update a contact.

# Ohh heres the catch....
# Only one programmer, Only one helper, take turns 5 mins coding each....
#

#
# array with array of hashs for contacts
@contacts = []

def add_contact
	#add user
	puts "Enter Name " 
	name = gets.chomp

	puts "Enter Address"
	address = gets.chomp
	
	puts "Enter location"
	location  = gets.chomp
	
	puts "Enter email"
	email = gets.chomp
	
	puts "Enter telephone"
	phone = gets.chomp
	
	puts "Enter DOB"
	dob = gets.chomp
	
	puts "Are they favourite (Y/N)"
	fav = gets.chomp

	# We now have all the user input, lets save that to our contact hashs and then save that to our contacts array
	contact = {
		name: name,
		address: address,
		location: location,
		email: email,
		phone: phone,
		dob: dob,
		fav: fav
	}

	# Save the hash to our array of contacts
	@contacts.push(contact)

	puts "The user was added:"
	# print the user to the console (it will be a hash)
	print contact

end



# To edit the contact we need to know where it is in the contacts[] array, this will return a hash with the symbols defined in add contact which we can then edit
def edit_contact(contact_id)
	puts "This is the contact you are editing\n\n"
	puts "Please enter the field you wish to edit? Name: address: location: email: phone: dob: fav, or Exit to exit \n\n"
    
    oldcontact = @contacts[contact_id]

	#Cycle through and get the new value for the key value pair in the contact hash
	command = gets.chomp.downcase
	case command
	when "name", "n"
		puts "Please edit the name: #{oldcontact[:name]}"
		puts "New name: "
		new_value = gets.chomp

		#save the new name to the array
		@contacts[contact_id][:name] = new_value
	when "address", "a"
		puts "Please edit the name: #{oldcontact[:address]}"
		puts "New address: "
		new_value = gets.chomp

		#save the new name to the array
		@contacts[contact_id][:address] = new_value
	when "location", "l"
		puts "Please edit the name: #{oldcontact[:location]}"
		puts "New location: "
		new_value = gets.chomp

		#save the new name to the array
		@contacts[contact_id][:location] = new_value
	when "email", "e"
		puts "Please edit the name: #{oldcontact[:email]}"
		puts "New email: "
		new_value = gets.chomp

		#save the new name to the array
		@contacts[contact_id][:email] = new_value
	when "phone", "p"
		puts "Please edit the name: #{oldcontact[:phone]}"
		puts "New phone: "
		new_value = gets.chomp

		#save the new name to the array
		@contacts[contact_id][:phone] = new_value
	when "dob", "d"
		puts "Please edit the name: #{oldcontact[:dob]}"
		puts "New dob: "
		new_value = gets.chomp

		#save the new name to the array
		@contacts[contact_id][:dob] = new_value
	when "fav", "f"
		puts "Please edit the name: #{oldcontact[:fav]}"
		puts "New fav: "
		new_value = gets.chomp

		#save the new name to the array
		@contacts[contact_id][:fav] = new_value
	when "exit"
		return
	end

end

def display_contacts
	count = 0
	# for each hash (representing the contact) in the contacts array print the values
	@contacts.each do |contact|
		puts "Contact #{count} => Name: #{contact[:name]}\n" + \
				" Address: #{contact[:address]}" +\
				" Location: #{contact[:location]}\n" +\
				" Email: #{contact[:email]} " +\
				" Phone: #{contact[:phone]}\n" +\
				" DOB: #{contact[:dob]} " +\
				" Fav: #{contact[:fav]}\n\n"
		count += 1
	end
end 

def delete_contact(contact_id)
	@contacts.delete_at(contact_id)

	puts "Contact deleted \n\n"
end


# This needs more work
def get_contact(name)
	#loop through the array of contact hash's and compare the entered name to the values stored

	@contacts.each do |contact|
		if contact[:name] == name
			puts "Name: #{contact[:name]}\n" + \
				" Address: #{contact[:address]}" +\
				" Location: #{contact[:location]}\n" +\
				" Email: #{contact[:email]} " +\
				" Phone: #{contact[:phone]}\n" +\
				" DOB: #{contact[:dob]} " +\
				" Fav: #{contact[:fav]}\n\n"
		end
	end
end


repeat = true

while repeat
	puts "Welcome to the contact searcher, please enter either Add, Search, Edit, Delete or Exit to find or add a contact\n\n"
	command = gets.chomp
	case command.downcase
	
	when "add"
		puts "I'll now let you add a program\n\n"
		add_contact()

	when "edit"
		puts "Select contact to edit:name, address, location, email, phone, dob, fav\n\n"
        display_contacts()

        puts "Please select the contact you would like to edit i.e. 0, or 1\n\n"
        contact_id = gets.chomp.to_i
        edit_contact(contact_id)

	when "delete"
		puts "These are your contacts\n\n"
        display_contacts()

        puts "Select contact to delete (enter the index i.e. 0 or 1)\n\n"
        delete_index = gets.chomp.to_i
        delete_contact(delete_index)

	when "search"
		puts "Please enter the name you would like to search for"
		name = gets.chomp
		get_contact(name)
	
	when "exit"
		puts "exiting"
		repeat = false
	else
		puts "I didn't recognise that command"
	end
end

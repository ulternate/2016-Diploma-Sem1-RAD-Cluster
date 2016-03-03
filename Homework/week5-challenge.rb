# Created By: Daniel Swain
# Date: 03/03/2016
# 
# Purpose: 
#     Allow users to add properties with house_type, bedrooms, bathrooms, toilets, land size and location as entry types
#     Users also able to search database using any of these categories
# 	
# Classes: 
#     Property: logic for Property Object's and saving them to the database
# 	
#     Property methods:
#         Property.initialize("Street Address", "House Type", "Number of Bedrooms", "Number of Bathrooms", "Number of Toilets", "Land Size", "Location")
#         Property.save_to_file
#
# Methods: 
#     add_property: Get user input and initialize and save a Property Object 
#     search_properties: Search database for properties that match the query for the specified property property (i.e. "Number of Toilets").
#     print_properties: Print the list to the console of all the properties in the database
# 
# Dependencies: 
#     A file will be created upon first addition of a property, this file will be required in the same folder as this file for this program to work.
#   
# Variables:
#     See top of file for constants and instance variables.
# 	
# Todo: 
#     search_properties method
# 

DATABASE_NAME = "/week5-challenge.txt"
SOURCE_PATH = File.expand_path("../", __FILE__)
COMMANDS_TEXT = "\n\nThe following commands are available: add, search, print or exit." + \
				"\nPlease enter a command to begin."
PROPERTY_PROPERTIES = ["Street Address", "House Type", "Number of Bedrooms", "Number of Bathrooms", "Number of Toilets", "Land Size", "Location"]
@repeat = true
@search_repeat = true

# Welcome text
puts "Welcome to Daniel's property program."
puts "\n\nWith this program you can add a property to a database or search for an existing property."

# Property object class
class Property
	attr_accessor :street_address, :house_type, :no_of_bedrooms, :no_of_bathrooms, :no_of_toilets, :land_size, :location

	# Initialize a new class with address, type, number of rooms, bathrooms and toilets, the land size and location.
	def initialize(street_address, house_type, no_of_bedrooms, no_of_bathrooms, no_of_toilets, land_size, location)
		@street_address = street_address
		@house_type = house_type
		@no_of_bedrooms = no_of_bedrooms
		@no_of_bathrooms = no_of_bathrooms
		@no_of_toilets = no_of_toilets
		@land_size = land_size
		@location = location
	end

	# Method to save to the database as a new property. A Property object is required.
	# The File.open("Path",'a') command will create a new file if it doesn't exist, otherwise it will modify the existing file.
	def save_to_file
		File.open(SOURCE_PATH + DATABASE_NAME, 'a') do |file| 
			file.puts("#{@street_address}|" + \
						"#{@house_type}|" + \
						"#{@no_of_bedrooms}|" + \
						"#{@no_of_bathrooms}|" + \
						"#{@no_of_toilets}|" + \
						"#{@land_size}|" + \
						"#{@location}")
		end
	end
end

# Prompt the user to add a property to the database
# Save the property using the Property class. Propmts are done using the PROPERTY_PROPERTIES Array for the types required.
def add_property
	temp_property = []
	PROPERTY_PROPERTIES.each do |type|
		puts "\nPlease enter the #{type}"
		temp_property << gets.chomp
	end
	puts "\n\nYou've entered the following information."
	print temp_property
	puts "\n\nDo you wish to save this property, Y or N?"
	ans = gets.chomp
	case ans
	when "Y", "Yes", "yes", "y"
		property = Property.new(temp_property[0],
								temp_property[1],
								temp_property[2],
								temp_property[3],
								temp_property[4],
								temp_property[5],
								temp_property[6])
		property.save_to_file
	else
		puts "\n\nProperty has been discarded."		
	end
end

# Ask the user for a search term and search the database for that house or houses that match it.
# Allows the user to search via the types listed in PROPERTY_PROPERTIES
def search_properties
	while @search_repeat
		puts "\n\nPlease enter which parameter you wish to search via?"
		print PROPERTY_PROPERTIES
		puts "\nYou can either enter the number in the array or use the key phrase from the array above. First array item is numbered '0'."
		puts "\nInput 'exit' if you wish to quit the search."
		parameter = gets.chomp
		case parameter
		when "0", "Street Address", "Street", "Address", "street", "address"
			
		when "1", "House Type", "House", "Type", "house", "type"

		when "2", "Number of Bedrooms", "Bedrooms", "bedrooms"

		when "3", "Number of Bathrooms", "Bathrooms", "bathrooms"

		when "4", "Number of Toilets", "Toilets", "toilets"

		when "5", "Land Size", "Land", "Size", "land", "size"

		when "6", "Location", "location"

		when "Exit", "exit", "E", "e"
			@search_repeat = false
		else
			puts "\n\nI didn't recognise that command, please try again."
		end
	end
end

# Print the saved properties  
# First, get the properties from the DB into an array by line, split each line into the display text, removing the "|"  and saving to 
# a properties array for printing.
def print_properties
	puts "\n\nThe following properties are stored in the database:"
	properties_by_line = File.foreach(SOURCE_PATH + DATABASE_NAME).map { |line| line }
	properties = []
	properties_by_line.each do |line|
		property = ""
		split_property = line.split('|')
		(0...split_property.length).each { |i| (i != split_property.length - 1) ? property += "#{PROPERTY_PROPERTIES[i]}: #{split_property[i]}, " : property += "#{PROPERTY_PROPERTIES[i]}: #{split_property[i]}" }
		properties << property
	end
	properties.each { |property| puts property }
end

# The code to run the program.
# It will loop through and get user commands to add, search, print or exit.
while @repeat
	puts COMMANDS_TEXT
	command = gets.chomp
	case command
	when "add", "Add", "a", "A"
		add_property()
	when "search", "Search", "s", "S"
		search_properties()
	when "print", "Print", "p", "P"
		print_properties()
	when "exit", "Exit", "e", "E"
		puts "\n\nThank you for using this program, your changes have been saved here:\n#{SOURCE_PATH + DATABASE_NAME}"
		@repeat = false
	else
		puts "\n\nSorry, I didn't recognise this command: #{command}"
	end
end

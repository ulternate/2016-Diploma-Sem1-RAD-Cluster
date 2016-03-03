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
#     get_properties: 
#         Get a 2D array of properties from the database of form: @properties[index_of_property][index_of_property_feature]
#     handle_query(index_of_property_feature, search_phrase, parameter): 
#         Perform the actual database search using the query passed from search_properties
#     add_property: 
#         Get user input and initialize and save a Property Object into the database
#     search_properties: 
#         Prompt the user for the field in PROPERTY_PROPERTIES they would like to search under and get their query. Pass that to handle_query to perform the search
#     print_properties(property_array, query_string="All"):
#         Print the properties that are passed in the property array (2D like in get_properties) this is used by the handle_query method to also print the results
#         of the database search, otherwise the program looper will call this with the get_properties array of all properties.
# 
# Dependencies: 
#     A file will be created upon first addition of a property, this file will be required in the same folder as this file for this program to work.
#   
# Variables:
#     See top of file for constants and instance variables.
# 	
# Todo: 
#     Extend search method to be a bit fuzzier, at the moment it's only supporting exact matches (case insensitive though).
# 

DATABASE_NAME = "/week5-challenge.txt"
SOURCE_PATH = File.expand_path("../", __FILE__)
COMMANDS_TEXT = "\n\nThe following commands are available: add, search, print or exit.\n"
PROPERTY_PROPERTIES = ["Street Address", "House Type", "Number of Bedrooms", "Number of Bathrooms", "Number of Toilets", "Land Size", "Location"]
@repeat = true
@search_repeat = true
@properties = []

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
	add_repeat = true
	temp_property = []
	PROPERTY_PROPERTIES.each do |type|
		print "Please enter the #{type}: "
		temp_property << gets.chomp
	end
	while add_repeat
		puts "\n\nYou've entered the following information."
		print temp_property
		puts "\n\nDo you wish to save this property, Y or N?\n"
		print "Enter command: "
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
			add_repeat = false
		when "N", "No", "no", "n"
			puts "\n\nProperty has been discarded."
			add_repeat = false
		else
			puts "\n\nI didn't understand that command '#{ans}', please try again."
		end
	end
end

# Return a 2D array of properties from the database, accessed like: @properties[index_of_property][index_of_property_feature]
# First each line is split into an array of property features
# Then the individual property features are stripped of any new line or encoding to ensure they're just standard strings.
def get_properties
	if File.exists?(SOURCE_PATH + DATABASE_NAME)
		properties_by_line = File.foreach(SOURCE_PATH + DATABASE_NAME).map { |line| line }

		@properties.clear
		properties_by_line.each { |line| @properties << line.split('|') }
		@properties.each do |arr|
			arr.each { |s| @properties[@properties.index(arr)][arr.index(s)] = s.strip }
		end
	end
	return @properties
end

# Handle the query of the properties database using case compare to match the search_phrase with the values at the index.
# Note, the index refers to the properties feature and is in the second column of the array
# i.e. @property[index_of_property][index_of_property_feature]
# Returns an array of properties (2d) that match the query
def handle_query(index_of_property_feature, search_phrase, parameter)
	search_properties ||= get_properties()
	if search_properties.empty?
		puts "It looks like there's no database created yet, or it is empty. Why not 'add' a property first."
	else
		result_properties = []
		search_properties.each do |property|
			result_properties << property if property[index_of_property_feature].casecmp(search_phrase) == 0
		end
		if result_properties.length > 0
			print_properties(result_properties, search_phrase)
			@search_repeat = false
		else
			puts "\n\nSorry, but no matches were found in '#{parameter}' matching: #{search_phrase}."
			@search_repeat = true
		end
	end
end


# Ask the user for a search term and search the database for that house or houses that match it.
# Allows the user to search via the types listed in PROPERTY_PROPERTIES
def search_properties
	test_for_properties = get_properties()
	if test_for_properties.empty?
		puts "It looks like there's no database created yet, or it is empty. Why not 'add' a property first."
	else
		@search_repeat = true
		while @search_repeat
			puts "Please enter which parameter you wish to search via from the array below?\n"
			print PROPERTY_PROPERTIES
			puts "\n\nYou can either enter the number in the array or use the phrase value. The first array item is numbered '0', last is numbered '6'."
			puts "Input 'exit' if you wish to quit the search."
			puts "At the moment only exact matches are supported (case insensitive matches are supported however).\n\n"
			print "Enter Search Field: "
			parameter = gets.chomp
			case parameter
			when "0", "Street Address", "Street", "Address", "street", "address"
				puts "\n\nPlease enter the '#{PROPERTY_PROPERTIES[0]}' you want to search for.\n"
				print "#{PROPERTY_PROPERTIES[0]}: "
				query = gets.chomp
				handle_query(0, query, PROPERTY_PROPERTIES[0])

			when "1", "House Type", "House", "Type", "house", "type"
				puts "\n\nPlease enter the '#{PROPERTY_PROPERTIES[1]}' you want to search for.\n"
				print "#{PROPERTY_PROPERTIES[1]}: "
				query = gets.chomp
				handle_query(1, query, PROPERTY_PROPERTIES[1])

			when "2", "Number of Bedrooms", "Bedrooms", "bedrooms", "Bed", "bed", "Rooms", "rooms"
				puts "\n\nPlease enter the '#{PROPERTY_PROPERTIES[2]}' you want to search for.\n"
				print "#{PROPERTY_PROPERTIES[2]}: "
				query = gets.chomp
				handle_query(2, query, PROPERTY_PROPERTIES[2])

			when "3", "Number of Bathrooms", "Bathrooms", "bathrooms", "Bath", "bath"
				puts "\n\nPlease enter the '#{PROPERTY_PROPERTIES[3]}' you want to search for.\n"
				print "#{PROPERTY_PROPERTIES[3]}: "
				query = gets.chomp
				handle_query(3, query, PROPERTY_PROPERTIES[3])

			when "4", "Number of Toilets", "Toilets", "toilets", "WC", "wc"
				puts "\n\nPlease enter the '#{PROPERTY_PROPERTIES[4]}' you want to search for.\n"
				print "#{PROPERTY_PROPERTIES[4]}: "
				query = gets.chomp
				handle_query(4, query, PROPERTY_PROPERTIES[4])

			when "5", "Land Size", "Land", "Size", "land", "size"
				puts "\n\nPlease enter the '#{PROPERTY_PROPERTIES[5]}' you want to search for.\n"
				print "#{PROPERTY_PROPERTIES[5]}: "
				query = gets.chomp
				handle_query(5, query, PROPERTY_PROPERTIES[5])

			when "6", "Location", "location", "Loc", "loc"
				puts "\n\nPlease enter the '#{PROPERTY_PROPERTIES[6]}' you want to search for.\n"
				print "#{PROPERTY_PROPERTIES[6]}: "
				query = gets.chomp
				handle_query(6, query, PROPERTY_PROPERTIES[6])

			when "Exit", "exit", "E", "e"
				@search_repeat = false
			else
				puts "\n\nSorry, I didn't recognise this parameter: #{parameter}"
			end
		end
	end
end

# Print the properties. This requires a 2D array of properties and a query_string (if passed)
# The property array should be as follows: @properties[index_of_property][index_of_property_feature]
# Calling get_properties will default to get all the properties with the correct arangement.
def print_properties(property_array, query_string="All")
	if property_array.empty?
		puts "It looks like there's no database created yet, or it is empty. Why not 'add' a property first."
	else
		puts "\n\nThe following properties are stored in the database matching the following query: #{query_string}"
		properties = "" 
		property_array.each do |property|
			(0...property.length).each do |i|
				if i != property.length - 1
					properties += "#{PROPERTY_PROPERTIES[i]}: #{property[i]}, "
				else
					properties += "#{PROPERTY_PROPERTIES[i]}: #{property[i]}\n"
				end
			end
		end
		print properties
	end
end

# The code to run the program.
# It will loop through and get user commands to add, search, print or exit.
while @repeat
	puts COMMANDS_TEXT
	print "Enter command: "
	command = gets.chomp
	print "\n"
	case command
	when "add", "Add", "a", "A"
		add_property()
	when "search", "Search", "s", "S"
		search_properties()
	when "print", "Print", "p", "P"
		print_properties(get_properties())
	when "exit", "Exit", "e", "E"
		puts "\n\nThank you for using this program, your changes have been saved here:\n#{SOURCE_PATH + DATABASE_NAME}"
		@repeat = false
	else
		puts "\n\nSorry, I didn't recognise this command: #{command}"
	end
end

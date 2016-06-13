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
#     fuzzy_match(string1, string2):
#         Calculate the Sorensen-Dice coefficient, comparing the two provided strings for a match.
#     handle_query(index_of_property_feature, search_phrase, parameter, match = 0.25): 
#         Perform the actual database search using the query passed from search_properties
#         Use fuzzy_match to compare the string provided with the database, if no match percentage is provided it will default to a 25% match trigger
#         i.e. "night" and "nacht" will match.
#     add_property: 
#         Get user input and initialize and save a Property Object into the database
#     search_properties: 
#         Prompt the user for the field in PROPERTY_PROPERTIES they would like to search under and get their query. Pass that to handle_query to perform the search
#         An optional match percentage (as a float i.e. 0.50) can be passed to handle_query if a more stringent match than 25% is requried.
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

DATABASE_NAME = "/week5-challenge.txt"
SOURCE_PATH = File.expand_path("../", __FILE__)
COMMANDS_TEXT = "\n\nYou can use this Property Database Programme with the following commands: add, search, print or exit.\n"
PROPERTY_PROPERTIES = ["Street Address", "House Type", "Number of Bedrooms", "Number of Bathrooms", "Number of Toilets", "Land Size", "Location"]
@repeat = true
@search_repeat = true
@properties = []

# The logic to handle the user commands and run the database program
# It will loop through and get user commands to add, search, print or exit.
def run_program
	while @repeat
		puts COMMANDS_TEXT
		print "Enter command: "
		command = gets.chomp
		print "\n"
		case command.downcase
		when "add", "a"
			add_property()
		when "search", "s"
			search_properties()
		when "print", "p"
			print_properties(get_properties(), "All")
		when "exit", "e"
			puts "\n\nThank you for using this program, your changes have been saved here:\n#{SOURCE_PATH + DATABASE_NAME}"
			@repeat = false
		else
			puts "\n\nSorry, I didn't recognise this command: #{command}"
		end
	end
end

# Property object class
# This contains the method to save the Property Object to the database after it has been initialised.
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
	# Get the user input for each Property feature (i.e 'Address', 'Size'...)
	PROPERTY_PROPERTIES.each do |type|
		print "Please enter the #{type}: "
		temp_property << gets.chomp
	end
	# Prompt the user to save the Property, giving them an option to discard. This repeats to give the user a chance to change their mind
	# or allow for a mistaken click of something other than 'Y' or 'N' without losing their data.
	while add_repeat
		puts "\n\nYou've entered the following information."
		print temp_property
		puts "\n\nDo you wish to save this property, Y or N?\n"
		print "Enter command: "
		ans = gets.chomp
		case ans.downcase
		when "yes", "y"
			property = Property.new(temp_property[0],
									temp_property[1],
									temp_property[2],
									temp_property[3],
									temp_property[4],
									temp_property[5],
									temp_property[6])
			property.save_to_file
			add_repeat = false
		when "no", "n"
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
		# Clear the @properties array and add each property as an array of property features
		@properties.clear
		properties_by_line.each { |line| @properties << line.split('|') }
		@properties.each do |arr|
			arr.each { |s| @properties[@properties.index(arr)][arr.index(s)] = s.strip }
		end
	end
	return @properties
end

# Calculate the Sorensen Dice coefficient for two strings to see how they compare, whether they share bigrams.
# This is used to allow a fuzzy match
# The current trigger for a match is 0.25 meaning "night" and "nacht" would match.
def fuzzy_match(string1, string2)
	shared_bigram_count = 0.0
	dice_coefficient = 0.0
	string1_bigrams = []
	string2_bigrams = []
	# Check length of the strings, if they aren't 2 or more we can't check using bigrams and should exact match.
	if string1.length && string2.length < 2
		# As these are short string we can exact match them if they exact match then return 1 (casecmp = 0 for exact match)
		string1.casecmp(string2) == 0 ? dice_coefficient = 1.0 : dice_coefficient = 0.0
		return dice_coefficient
	else
		# Get each bigram (2d ngrams) for each string so "night" => ['ni', 'ig', 'gh', 'ht']
		string1.chars.each_cons(2) { |pairs| string1_bigrams << pairs.join }
		string2.chars.each_cons(2) { |pairs| string2_bigrams << pairs.join }
		# Count the shared bigrams and return the Sorensen-Dice coefficient
		string2_bigrams.each { |bg2| string1_bigrams.each { |bg1| shared_bigram_count += 1.0 if bg2 == bg1 } }
		return dice_coefficient = (2.0 * shared_bigram_count) / (string1_bigrams.length + string2_bigrams.length)
	end
end

# Handle the query of the properties database using case compare to match the search_phrase with the values at the index.
# Note, the index refers to the property feature and is in the second column of the array
# i.e. @property[index_of_property][index_of_property_feature]
# Prints an array of properties (2d) that match the query, otherwise notify user of failure to find match with the phrase they entered.
# A match is when the Sorensen Dice coefficient is greater than 25% by default.
def handle_query(index_of_property_feature, search_phrase, parameter, match = 0.25)
	search_properties ||= get_properties()
	if search_properties.empty?
		puts "It looks like there's no database created yet, or it is empty. Why not 'add' a property first."
	else
		result_properties = []
		search_properties.each do |property|
			# Check each word in the property against the search phrase, exit early if a fuzzy_match returns greater than match.
			temp_string1_array = property[index_of_property_feature].split(' ')
			temp_string1_array.each do |string|
				if fuzzy_match(string, search_phrase) > match
					result_properties << property
					break
				end
			end
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
# If you want a more strict match then add a float percentage match value to each handle_query call
# i.e. handle_query(0, query, PROPERTY_PROPERTIES[0]) => handle_query(0, query, PROPERTY_PROPERTIES[0], 0.50)
def search_properties
	test_for_properties = get_properties()
	if test_for_properties.empty?
		puts "It looks like there's no database created yet, or it is empty. Why not 'add' a property first."
	else
		@search_repeat = true
		while @search_repeat
			puts "Please enter which property feature you wish to search:\n"
			print PROPERTY_PROPERTIES
			puts "\n\nInput 'exit' if you wish to quit the search."
			puts "String matches are fuzzy so 'night' and 'nacht' are likely to match.\n\n"
			print "Enter Search Field (eg 'Address' or 'Size'): "
			parameter = gets.chomp
			case parameter.downcase
			when "0", "street address", "street", "address"
				puts "\n\nPlease enter the '#{PROPERTY_PROPERTIES[0]}' you want to search for.\n"
				print "#{PROPERTY_PROPERTIES[0]}: "
				query = gets.chomp
				handle_query(0, query, PROPERTY_PROPERTIES[0])

			when "1", "house type", "house", "type"
				puts "\n\nPlease enter the '#{PROPERTY_PROPERTIES[1]}' you want to search for.\n"
				print "#{PROPERTY_PROPERTIES[1]}: "
				query = gets.chomp
				handle_query(1, query, PROPERTY_PROPERTIES[1])

			when "2", "number of bedrooms", "bedrooms", "bed", "rooms"
				puts "\n\nPlease enter the '#{PROPERTY_PROPERTIES[2]}' you want to search for.\n"
				print "#{PROPERTY_PROPERTIES[2]}: "
				query = gets.chomp
				handle_query(2, query, PROPERTY_PROPERTIES[2])

			when "3", "number of bathrooms", "bathrooms", "bath"
				puts "\n\nPlease enter the '#{PROPERTY_PROPERTIES[3]}' you want to search for.\n"
				print "#{PROPERTY_PROPERTIES[3]}: "
				query = gets.chomp
				handle_query(3, query, PROPERTY_PROPERTIES[3])

			when "4", "number of toilets", "toilets", "wc"
				puts "\n\nPlease enter the '#{PROPERTY_PROPERTIES[4]}' you want to search for.\n"
				print "#{PROPERTY_PROPERTIES[4]}: "
				query = gets.chomp
				handle_query(4, query, PROPERTY_PROPERTIES[4])

			when "5", "land size", "land", "size"
				puts "\n\nPlease enter the '#{PROPERTY_PROPERTIES[5]}' you want to search for.\n"
				print "#{PROPERTY_PROPERTIES[5]}: "
				query = gets.chomp
				handle_query(5, query, PROPERTY_PROPERTIES[5])

			when "6", "location", "loc"
				puts "\n\nPlease enter the '#{PROPERTY_PROPERTIES[6]}' you want to search for.\n"
				print "#{PROPERTY_PROPERTIES[6]}: "
				query = gets.chomp
				handle_query(6, query, PROPERTY_PROPERTIES[6])

			when "exit", "e"
				@search_repeat = false
			else
				puts "\n\nSorry, I didn't recognise this parameter: #{parameter}"
			end
		end
	end
end

# Print the properties. This requires a 2D array of properties and a query_string
# The property array should be as follows: @properties[index_of_property][index_of_property_feature]
# Calling print_properties(get_properties()) will print all the properties.
def print_properties(property_array, query_string)
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

# Print welcome text and start the program
puts "Welcome to Daniel's property program."
puts "With this program you can add a property to a database or search for an existing property."
run_program()

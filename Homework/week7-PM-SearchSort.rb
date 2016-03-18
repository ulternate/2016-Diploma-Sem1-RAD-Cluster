# Daniels lottery game.
# 
# This will generate an array of lottery numbers for either the user specified weeks, balls per week and max ball value
# or will use the default values listed below.
# 
# The user is asked to enter their lottery number
# 
# The system searches the array and displays how many times this number was called.
# 
# Also, you can search the array and give the user the 6 top common numbers. 

repeat = true
@number_array = []
@game_in_progress = false
INSTRUCTIONS = "\nEnter one of the following commands:\n" + \
				"1) Configure the lottery draw variables and constants. Starting a custom draw.\n" + \
				"2) Start a normal draw.\n" + \
				"3) Exit."

# The variables and constants that can be configured
MAX_NUMBER_IN_DRAW = @max = 45
NUMBER_OF_WEEKS = @weeks = 20
BALLS_PER_WEEK = @balls = 6
TOP_N_BALLS = 6

# Start the program
puts "\nWelcome to Daniel's Lottery"
puts "What would you like to do?"

# Generate the initial number_array by generating a random number from 1 to the max number in draw for each ball of each week
def start_game(weeks = NUMBER_OF_WEEKS, balls = BALLS_PER_WEEK, max_number = MAX_NUMBER_IN_DRAW)
	prng = Random.new
	@number_array.clear
	(weeks * balls).times { |n| @number_array << prng.rand(1..max_number) }
	@game_in_progress = true
end

# Set up the lottery variables. if no entry is entered then use the default value.
def configure
	puts "\n\nEnter the values you want to configure and a new draw will start."
	print "Input number of weeks: "
	num_weeks = gets.chomp.to_i
	num_weeks == 0 ? @weeks = NUMBER_OF_WEEKS : @weeks = num_weeks

	print "Input number of balls per week: "
	num_balls = gets.chomp.to_i
	num_balls == 0 ? @balls = BALLS_PER_WEEK  : @balls = num_balls

	print "Input maximum value of each ball (i.e. 45): "
	max_val = gets.chomp.to_i
	max_val == 0 ? @max = MAX_NUMBER_IN_DRAW  : @max = max_val

	puts "\nStarting a game for #{@weeks} weeks, with #{@balls} balls per week, and a maximum ball value of #{@max}."
end

# Count the unique balls and return the top 'n' number of balls in the @number_array.
def print_results
	# get the unique values
	unique_balls = @number_array.uniq
	results = []
	# add to the results a 2d array, results[n] = [value of ball, times it was drawn], only for the unique balls.
	unique_balls.each { |n| results.push([n, @number_array.count(n)]) }
	
	# Sort the results array
	results.sort! { |a,b| b[1] <=> a[1] }

	# Calculate the percentage that the top n balls were drawn and print this to the player.
	print_message = "\n\nThe #{TOP_N_BALLS} most frequent balls in the draw are: \n"
	TOP_N_BALLS.times do |n|
		percentage = (((results[n][1].to_f)/(@weeks.to_f * @balls.to_f)) * 100.0).round(2)
		print_message += "#{n+1}: #{results[n][0]} was drawn #{results[n][1]} times, for #{percentage}% of all balls.\n"
	end
	puts print_message
	puts "\n\nThanks for playing."
end

def play_game
	err_msg = ""
	# Ask the user for their number
	puts "\n\nLet's test your luck..."
	print "Please enter your favourite/lucky number: "
	input = gets.chomp.to_i

	# Search the array for that number and return how many times this occured
	count = @number_array.count(input)
	puts "#{input} was in the draw #{count} time(s)"

	# Return the top n numbers.
	puts "\nWould you like me to show you the most frequent numbers?"
	print "Enter Y/N: "
	gets.chomp.downcase == "y" ? print_results() : err_msg = "\n\nOk, thanks for playing then."
	puts err_msg
	# Set the game in progress checker to false so we can play again.
	@game_in_progress = false
end

# Loop through and get the user's choices until the game is exited.
while repeat
	puts INSTRUCTIONS
	print "Command: "
	command = gets.chomp
	case command.downcase
	when "1", "1)", "configure", "g"
		# Configure the game
		configure()
		start_game(@weeks, @balls, @max) unless @game_in_progress
		play_game()

	when "2", "2)", "start", "s"
		# Play a default game
		start_game() unless @game_in_progress
		play_game()

	when "3", "3)", "exit", "e"
		# Exit a game
		puts "\n\nThanks for playing, I hope your number was lucky!"
		repeat = false

	end
end

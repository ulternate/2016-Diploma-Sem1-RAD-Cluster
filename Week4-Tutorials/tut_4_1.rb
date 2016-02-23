puts "Exercise 1:\n\n"

puts 12.is_a?(Integer)
puts 12.is_a?(Float)
puts 12.is_a?(String)

puts '12'.is_a?(Integer)
puts '12'.is_a?(Float)
puts '12'.is_a?(String)

puts 12.0.is_a?(Integer)
puts 12.0.is_a?(Float)
puts 12.0.is_a?(String)

puts "Hit enter to continue"
do_nothing = gets.chomp

puts "\n\nExercise 2:\n"
puts "I see that 12 is an integer '12' is a string and 12.0 is a float\n\n"

puts "Hit enter to continue"
do_nothing = gets.chomp

puts "Exercise 3:\n\n"

puts 12 + 12
puts '12' + '12'

puts '12'.to_i + 12
puts '12' + 12.to_s

puts 12 * 12
puts '12' * 12

puts "Hit enter to continue"
do_nothing = gets.chomp

puts "\n\nExercise 4:\n"
puts "I got the results that I expected.\n\n"

puts "Hit enter to continue"
do_nothing = gets.chomp

puts "Exercise 5:\n\n"
puts "The number 12 is an integer, it has no remainders and is a whole number\n\n"
puts "'12' is a string, so it is like a grouping of letters that form a word, Ruby allows for anything to be classed as a string when it is quoted by '' characters.\n\n"
puts "12.0 is a float, think of that as a number with a decimal place, in computer programs this allows for numbers to calculate the decimal places when calculating the result whereas with an integer only whole numbers will be returned."

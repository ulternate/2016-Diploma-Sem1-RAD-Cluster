puts "Exercise 1:\n"
puts "Please enter two words that I'll jumble\n\n"

#Grab the input and split the spaces from it
input = gets.chomp.split(" ")
#put the input in reverse order if only 2 words were given
puts input.length == 2 ? "\n#{input[1]} #{input[0]}" : "\nYou didn't give me two words, you gave me #{input.length}"

puts "Hit enter to continue"
do_nothing = gets.chomp

puts "\n\nExercise 2:\n"
puts "What is your name?\n"
name = gets.chomp
puts "How old are you?\n"
age = gets.chomp
puts "\n#{name} was born in #{2016 - age.to_i}"

puts "Hit enter to continue"
do_nothing = gets.chomp

puts "\n\nExercise 3:\n"
puts "Please enter a sentance\n"
sentance = gets.chomp
puts "Please enter how many times you'd like that sentance repeated backwards\n"
repeats = gets.chomp.to_i

puts "\nOk, here I go, I'll print out your sentance #{repeats} times\n\n"
repeats.times {|n| puts sentance.reverse}

puts "Hit enter to continue"
do_nothing = gets.chomp

puts "\n\nExercise 4:\n"
puts "I think number = gets.chomp.to_i will get the user input, get rid of the '\\n' character and convert it to an integer if possible"

puts "Hit enter to continue"
do_nothing = gets.chomp

puts "\n\nExercise 5:\n"
puts "Note, if the input was a string then the number will be 0"

puts "Hit enter to continue"
do_nothing = gets.chomp

puts "\n\nExercise 6:\n"
puts "Ok, I'll figure out the factorial of the number you enter next"
puts "In case you forgot, the factorial is the number times all numbers below it"
number = gets.chomp.to_i
factorial = number
(1...number).each{|n| factorial *= n }
puts "\nThe factorial of #{number} is = #{factorial}"

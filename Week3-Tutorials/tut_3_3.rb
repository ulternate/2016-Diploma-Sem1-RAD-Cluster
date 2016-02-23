puts "Exercise 1"
puts "Will result in 'Helloworldworld' as we didn't add spaces and we added world twice.\n"

var1 = "hello"
var1 = var1 + "world"
var1 += "world"

puts var1

puts "Hit enter to continue"
do_nothing = gets.chomp

puts "\nExercise 2"
puts "I think that 'string *= 3' will print out 'hihihi'\n"

string = "hi"
string *= 3

puts string

puts "Hit enter to continue"
do_nothing = gets.chomp

puts "\nExercise 3"
puts "Hi Elisha, Ruby is awesome, pretty much everything is an object and the same rules apply, so If I was to say to you lets multiply a coke can by 3 you would expect 3 coke can's right? The Coke can is the object and in ruby the same logical operations work on all types of objects (* within reason, but that's for another discussion). Now get out of my room."

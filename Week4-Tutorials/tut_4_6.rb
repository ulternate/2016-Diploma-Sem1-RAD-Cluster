puts "Exercise 1:\n"
puts "Rearange '2, u, A, 4, w, f, R, y' in ASCIIbetical order:"

#The original array
arr = [2, 'u', 'A', 4, 'w', 'f', 'R', 'y']

#Convert the elements to strings
(0...arr.length).each {|i| arr[i] = arr[i].to_s }

#print the original array
puts "The original array\n\n"
print arr

#sort the array in place and print it
puts "\n\nThe sorted array\n\n"
print arr.sort!

puts "Hit enter to continue"
do_nothing = gets.chomp

puts "\n\nExercise 2\n"

# ? less than 0
puts "Is ? less than 0\n"
puts "#{"?" < "0"}\n\n"

# ? after 9 but before A
puts "Is ? after 9 but before A?\n"
puts "#{"?" > "9" && "?" < "A"}\n\n"

# ? After Z but before a
puts "Is ? After Z but before a?\n"
puts "#{"?" > "Z" && "?" < "a"}\n\n"

# Is ? after z?
puts "Is ? after z?\n"
puts "#{"?" > "z"}\n\n"

puts "Hit enter to continue"
do_nothing = gets.chomp

puts "Exercise 3\n"
puts "Enter the character you'd like to check whether:\n*A) Before 0\n*B) After 9 but before A\n*C) After Z but before a\n*D) Adter z.\n\n"

#lets run the tests
input = gets.chomp
#ensure it's a string
input.to_s if !input.is_a?(String)
result = ""

if input < "0"
    result += "#{input} is before 0"
elsif input > "9" && input < "A"
    result += "#{input} is after 9 but before A"
elsif input > "Z" && input < "a"
    result += "#{input} is after Z but before a"
else
    result += "#{input} is after z"
end

puts result
puts "Nichola, when I looked online here: http://www.asciitable.com/ I saw that some of the examples you gave are wrong (i.e. '-' is less than 0)"

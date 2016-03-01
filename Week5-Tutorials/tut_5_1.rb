#
# Week 5 While tutorial#
#
#

# Calculate the highest power of 2 less than a provided number
puts "Exercise 1 & 2:\n"
puts "I'll calculate the hightest power 2 less than the number you give me\n\n"

#Need to convert limit to float to support exponentials
limit = gets.chomp.to_f

num = 1
while num < limit
	num *= 2
end

# number now represents the largest power of 2 greater than the limit
# Divide by 2 to get the value we want

puts "The hightest power of two less than #{limit} is #{num/2}"

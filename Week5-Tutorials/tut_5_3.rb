
puts "Exercise 1\n\n"
puts "Lets sort the friends array, see the original below\n"
friends = ["Melisa", "Jeff", "Ashley", "Rob"]
print friends
#get it in reverse order
puts "\n\nHere's the one sorted in reverse order\n"
print friends.sort.reverse


puts "\n\nExercise 2\n\n"
puts "Hit enter to start the Beer song singing"
do_nothing = gets.chomp
(0..99).each do |n|
    lyrics = ""
    count = 99 - n
    if count != 0
        # Got anal about it saying bottles when only one was left, probably a better way of doing this though
        if count == 1
            lyrics = "#{count} Bottle of beer on the wall, " + \
                "#{count} bottle of beeeeeer." + \
                "You take one down and drink it all down, " + \
                "#{count - 1} bottles of beer on the wall!"
        else
            lyrics = "#{count} Bottles of beer on the wall, " + \
                "#{count} bottles of beeeeeer." + \
                "You take one down and drink it all down, " + \
                "#{count - 1} bottles of beer on the wall!"
        end
    else
        lyrics = "Oh no, all the beer's gone!"
    end
    puts lyrics
    sleep 0.05 #<- Wanted it to not print all at once
end

puts "\n\nExercise 3\n\n"
puts "I'm going to capitalise the names in the following array\n"
names = ["daniel", "eduardo", "alejandro", "enrique"]
print names
#Capitalise the names
puts "\n\nHere are the names capitalised\n"
names.each { |name| puts "#{name.capitalize}" }

puts "\n\nDone"
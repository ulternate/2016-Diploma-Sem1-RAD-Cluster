puts "Exercise 1:\n"
puts "This is the sum of all integers from 1 to 1000\n\n"

#For each number 0 to 1000 add them together
sum = 0
(0..1000).each {|n| sum += n }
puts "#{sum} (nb, I've included 1000 in the sum)"

puts "Hit enter to continue"
do_nothing = gets.chomp

puts "\n\nExercise 2:\n"
puts "This is the sum of all integers from 1 to 100"

#For each number 0 to 100 add them together
sum = 0
(0..100).each {|n| sum += n }
puts "#{sum} (nb, I've included 1000 in the sum)"

puts "Hit enter to continue"
do_nothing = gets.chomp

puts "\n\nExercise 3:\n"
puts "I'm going to sing 99 bottles of beer now\n"
puts "Hit enter to start the song\n\n"
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

puts "Hit enter to continue"
do_nothing = gets.chomp

puts "\n\nExercise 4:\n"
puts "Wow, I'm a little tipsy now, but yay for Christmas\n"
puts "Hit enter to start the song\n\n"
do_nothing = gets.chomp

days_of_christmas = {
    first: "a partridge in a pear tree",
    second: "two Turtle Doves",
    third: "three French Hens",
    forth: "four Calling Birds",
    fifth: "five Golden Rings",
    sixth: "six Geese a Laying",
    seventh: "seven Swans a Swimming",
    eigth: "eight Maids a Milking",
    ninth: "nine Ladies Dancing",
    tenth: "ten Lords a Leaping",
    eleventh: "eleven Pipers Piping",
    twelve: "twelve Drummers Drumming"
}
# The array and count are used to grab the previous gifts
days_of_christmas_arr = days_of_christmas.to_a
count = 0
#For each element of the gift hash, lets say what came then and before it
days_of_christmas.each do |key,value|
    lyrics = "On the #{key.to_s} day of Christmas, " + \
        "my true love gave to me"
    (0..count).each do |n|
        #Loop through and add the previous gifts for this element
        n == count ? lyrics += " and " : lyrics += ", "
        #Note, the ternary there prefaces the next line with and or , depending on what is required by the song (i.e. the last gift is and)
        lyrics += "#{days_of_christmas_arr[count - n][1].to_s}"
    end
    #iterate the count and put the verse
    count += 1
    puts lyrics + "\n\n"
    sleep 1 #<- To make it more song like
end

#OK, each day I get the same gifts from the previous day
gifts = 0
(1..12).each do |n|
    # 1 - 12 represents the new gifts
    count = n - 1
    (1..count).each do |m|
        #1 - count represent the gifts from the previous days
        # notice I start count at 0, because I didn't get anything day 0.
        gifts += m
    end
    #So on day four I get
    # 4 for the day + 6 for the previous gifts (1 + 2 + 3) (1 - count where count = 4 - 1)
    gifts += n
end
puts "\nWow, I got #{gifts} gifts!!!!"

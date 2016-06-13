# I'm making it look more like an old cli program
puts "\n\n------------------ Super Awesome Ruby Homework Program ----------------"
puts "\n----compiling----"
loading = ["#"," "," "," "," "," "," "," "," "," "," "," "," "," "," "," ","|"]

#print out a loading bar
16.times do |n|
    loading[n]="#"
    puts loading.join
    sleep 0.2
end
puts "Ok, I'm ready to go."

#Enter your name and print it
puts "Please enter your name"
name = gets.chomp
puts "\n\nWelcome #{name}"

#The intro message and the choice are initialised
message = "\n\nSelect what you would like to do:" + \
    "\n1)Add two numbers together." + \
    "\n2)Display a welcome message." + \
    "\n3)Calculate your wages." + \
    "\n4)Exit this program." + \
    "\n\nEnter your choice as a number."
choice = 0

# So you can keep playing with the program, do everything until 4, or exit is input.
until (choice == "4" || choice == 4 || choice == "exit") do
    #Print the message each time and get the user's choice
    puts message
    choice = gets.chomp

    #logic for the program
    case choice
    when "1", 1, "one", "add"
        #add user numbers together
        puts "\n\nPlease enter two numbers to add\n"
        numbers = gets.chomp.split(" ")
        sum = 0
        numbers.each{|n| sum += n.to_i }
        puts "\n\nThe sum of #{numbers} is = #{sum}"
        sleep 1

    when "2", 2, "two", "welcome"
        #User enters a custom welcome message
        puts "\n\nPlease enter a custom welcome message\n"
        welcome = gets.chomp
        sleep 0.5
        puts "Your welcome message is: #{welcome}"
        sleep 1

    when "3", 3, "three", "calculate"
        #Calculate the user's wages
        puts "\n\nI'm going to calculate your wage now\n"
        puts "Please enter your hours worked.\n"
        hours = gets.chomp.to_f
        puts "Please enter your hourly salary.\n"
        salary = gets.chomp.to_f
        puts "\n\nAfter working #{hours} at $#{salary}/hr, you're owed: $#{hours*salary}. See your boss for your paycheck."
        sleep 1

    end
end

#Handle the exit stuff here
puts "\n\nThanks #{name} for playing around with my awesome program."

questions = {
    Q1: "Q1. How many hours in a year?",
    Q2: "Q2. How many minutes in a decade?",
    Q3: "Q3. How many seconds old are you?",
    Q4: "Q4. What is 3.24 * ((34/2) - 54)/33.4 * 3.4?",
    Q5: "Q5. What do you think happens when you combine floats and integers? try computing these\n3.0/2\n3/2.0\n4**2.0\n4.1%2\n Is the answer a float or an integer?",
    Q6: "Q6. What is Infinity? One of the uses of the class Float is to represent numbers that might be too large or too small for an Integer. Try computing these\n1/0\n1.0/0\n1/0.0.",
    Q7: "Q7. Notice that 1/0 gives you an error, and the others do not. Can you imagine why?",
    Q8: "Q8. Type the following.\n(1.0/0).is_a?(Integer)\(1.0/0).is_a?(Float)",
    Q9: "Q9. What class is infinity? Can you guess why 1/0 did not work in the previous exercise?",
    Q10: "Q10. What would happen if you tried to represent a googolplex using Float's instead of Integer's? Try \n googol = 10.0 ** 100 \n googolplex = 10.0 ** googol.",
    Q11: "Q11. How is this different from when we used the integer class?",
    Q12: "Q12. A googolplex is a very large number, but is it infinite? Based on our experiments, how should we answer these questions?\n Is there a number too large for Ruby? \nIs infinity too large for Ruby?"
}

answers = Hash.new
answers[1] = 356 * 24
answers[2] = 10 * 365 * 24 * 60
age = 27
answers[3] = age * 365 * 24 * 60 * 60
answers[4] = 3.24 * ((34/2) - 54)/33.4 * 3.4
ans5_1 = 3.0 / 2
ans5_2 = 3 / 2.0
ans5_3 = 4 ** 2.0
ans5_4 = 4.1 % 2
answers[5] = ans5_1.to_s + "\n" + ans5_2.to_s + "\n" + ans5_3.to_s + "\n" + ans5_4.to_s + "\n"
ans6_1 = "An ZeroDivisionError will be returned for 1/0."
ans6_2 = "Infinity is returned for 1.0/0"
ans6_3 = "Infinity is returned for 1/0.0"
answers[6] = ans6_1 + "\n" + ans6_2 + "\n" + ans6_3 + "."
answers[7] = "I'm guessing it's because Ruby treats infinity as a float not an integer and as Ruby interperates what you put it it evaluates the 1/0 as integers whilst 1.0/0 and 1/0.0 are evaluated as floats."
ans8_1 = "(1.0/0).is_a?(Integer) will return false."
ans8_2 = "(1.0/0).is_a?(Float) will return true."
answers[8] = ans8_1 + "\n" + ans8_2
answers[9] = answers[7]
answers[10] = "When evaluated using integers an integer is returned so we see all 1*10^100 zeros, or as many as irb can display. When calculated as float we get exponential notation. googolplex calculation returns 'Infinity' I guess it's reached Ruby's limit."
answers[11] = answers[10]
answers[12] = "I think there's a number too large for Ruby, when it's reached it'll return infinity, I assume it comes to memory storage limits. I think 'Infinity' is a built in type or variable and isn't stored as a big number but a type with the properties of infinity."

puts "Please enter the question number from 1 to 12 you want to see an answer for.\n Enter 'All' to see all answers."
question_number = gets.chomp

if question_number.is_a?(String) && question_number.capitalize == "All"
    answers.each {|k, v| puts "#{k}: #{v} \n \n"}
else
    symbol = "Q" + question_number.to_s
    puts "\n" + questions[symbol.to_sym].to_s + "\n" + answers[question_number.to_i].to_s
end

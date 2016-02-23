answers = {
    Q1: "I expect the following results 10, true, true, cut\n Testing: #{"hello".length + "world".length}, #{"".empty?}, #{"Zoo".include?"oo"}, #{"cute".chop}",
    Q2: "Ruby applied it's built in methods to the strings.",
    Q3: "Result = #{"Daniel".reverse}",
    Q4: "It'll result in 'Nichola', testing: #{"Nichola".reverse.reverse}",
    Q5: "Result = #{"Daniel".reverse.downcase.capitalize}",
    Q6: "When I rand 'Daniel'.reverse.capitalize I get the same result as 'Daniel'.reverse.lowercase.capitalize which is weird because I expect to get 'LeinaD' when I don't downcase the name. \n Testing: #{"Daniel".reverse.downcase.capitalize} vs #{"Daniel".reverse.capitalize}",
    Q7: "'A man a plan a canal Panama' is a palindrome, reads the same backwards and forwards (when lenient with grammer).",
    Q8: "Results of calling .reverse on the given phrases \n a: #{"A car, a man, a maraca".reverse}\n b:#{"And DNA and DNA and DNA".reverse}\n c:#{"did".reverse}\n d:#{"hannah".reverse}\n e#{"Did Hanna say as Hannah did?".reverse}",
    Q8b: "Here's one you can use as well ;) A Toyota's a Toyota \n Testing: #{"A Toyotas a Toyota".reverse}",
    Q9: "I like gsub or global substitition it will subsitute the characters in the test area with what's provided \n i.e. 'Daniel'.gsub(/[a]/,'@') will replace 'a' with '@' resulting in D@niel \n Testing: #{"Daniel".gsub(/[a]/,'@')}"
}

answers.each{|k,v| puts "#{k.to_s}: #{v} \n\n"}

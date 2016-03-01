# I'm not going to ask for user input now, I'm going to provide it with 
# some stock addresses and people and do the sort stuff on it.

address1 = {
	street: "474 Murray Steet",
	city: "Perth",
	state: "WA",
	post_code: "6000",
	email: "swain.daniel.c@gmail.com"
}

person1 = {
	name: "Daniel",
	surname: "Swain",
	phone: "0401546989",
	address: address1
}

address2 = {
	street: "500 Murray Steet",
	city: "Perth",
	state: "WA",
	post_code: "6000",
	email: "swain.c@gmail.com"
}

person2 = {
	name: "Aldous",
	surname: "Huxley",
	phone: "0401549899",
	address: address2
}

address3 = {
	street: "500 Murray Steet",
	city: "Perth",
	state: "WA",
	post_code: "6000",
	email: "swain.c@gmail.com"
}

person3 = {
	name: "Aldous",
	surname: "Spencer",
	phone: "0401549899",
	address: address3
}

address_book = [person1, person2, person3]

puts "\n\nWe have the following addresses in our address_book\n"
address_book.each { |entry| puts "#{entry}\n\n"}

puts "\n\nNow I'll sort by whole name\n"
address_book = address_book.sort do |p_a, p_b|
	name1 = "#{p_a[:name]} #{p_a[:surname]}"
	name2 = "#{p_b[:name]} #{p_b[:surname]}"

	#sort via whole name
	name1 <=> name2
end
address_book.each { |entry| puts "#{entry}\n\n"}


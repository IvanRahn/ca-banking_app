require_relative "json_to_hash.rb"
require_relative "methods.rb"

puts "Please enter your customer ID"
#get the customer name and check if it's an existing customer
customer = customer_info(gets.chomp)
#display the menu
menu
#run the app
logic(customer)

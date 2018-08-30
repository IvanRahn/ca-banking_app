#check if the file exists
require "io/console"

def existing_customer?(user_name)
  File.file?("#{user_name}.txt")
end

# if the file exists then return the customer hash, if not - create a new customer
def customer_info(name)
  existing_customer?(name) ? customer = read_from_file("#{name}.txt")[0] : customer = {
    "name" => name,
    "balance" => 0,
    "history" => [],
  }
  customer
end

def save_hash_to_file(customer_data)
  File.open("#{customer_data["name"]}.txt", "w") { |file| file.write(hash_to_json(customer_data)) }
end

#menu for the app
def menu
  puts "1) Balance"
  puts "2) Deposit"
  puts "3) Withdrawal"
  puts "4) Transaction history"
  puts "5) Exit"
end

#this block controls the flow
def logic(customer)
  puts "----------------------------------------------"
  input = STDIN.noecho(&:gets).chomp.to_i

  case input
  when 1
    balance(customer)
  when 2
    deposit(customer)
  when 3
    withdraw(customer)
  when 4
    history(customer)
  when 5
    save_hash_to_file(customer)
    return
  when 6
    menu
  end
  puts "----------------------------------------------"
  sleep(1)
  puts "How else would we be able to assist you today? \nPlease press 6 if you would like to see the menu again."
  logic(customer)
end

#methods for the operations
def deposit(customer)
  dep = 0
  puts "How much would you like to deposit?"
  dep += gets.chomp.to_i
  customer["balance"] += dep
  puts "Processing transaction..."
  sleep(1)
  puts "Updating your balance..."
  sleep(1)
  puts "Your balance is $#{customer["balance"]}"
  customer["history"] << "Deposit: $#{dep}"
end

def withdraw(customer)
  draw = 0
  puts "How much would you like to withdraw?"
  draw = gets.chomp.to_i
  puts "Procesing transaction..."
  sleep(1)
  if customer["balance"] < draw
    puts "Insufficient funds"
  else
    customer["balance"] -= draw
    puts "Updating your balance..."
    sleep(1)
    puts "Your balance is $#{customer["balance"]}"
  end
  customer["history"] << "Withdraw: $#{draw}"
end

def balance(customer)
  sleep(1)
  puts "Your balance is $#{customer["balance"]}"
end

def history(customer)
  puts customer["history"]
end

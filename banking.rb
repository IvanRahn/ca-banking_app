puts "Welcome, how could I be of service?"

balance = 0
input = 0
history = []
while input != "exit" do
    input = gets.chomp
case input 
when "balance"
    puts "Your balance is #{balance}\n What would you like to do?"
when "deposit"
    puts "How much would you like to deposit?"
    deposit = gets.chomp.to_i 
    balance = balance + deposit
    puts "Your balance is #{balance}\nHow else could we help you today?"
    history.push("Deposit: #{deposit}")
when "withdraw"
    puts "How much would you like to withdraw?"
    withdraw = gets.chomp.to_i
    if withdraw > balance
        puts "Insufficient funds"
    else
    balance = balance - withdraw
    end
    puts "Your balance is #{balance}\nHow else could we help you today?"
    history.push("Withdrawal: #{withdraw}")
when "exit"
    break
when "history"
    puts history
else
    puts "I did not recognize the command, try again"
end
end
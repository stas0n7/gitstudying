purchases = Hash.new
loop do
  puts "Name of product :"
  name = gets.chomp.downcase
  if name == "stop" || name == "стоп"
    break
  end
  puts "Enter a price"
  price = gets.to_f
  puts "How much did you buy ?"
  how_many_bought = gets.to_f
  purchases[name] = { price => how_many_bought }
end
puts purchases
total = []
purchases.each do |key, value|
  value.each do |key1, value1|
    total << key1 * value1
    puts "#{key} - #{key1 * value1}"
  end
end
puts "--------------------"
puts "total - #{total.sum}"

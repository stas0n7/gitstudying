puts "type a day"
day = gets.to_i
puts "type number of month"
month = gets.to_i
puts "type year"
year = gets.to_i
months = [31, 28, 31, 30, 31, 30, 31, 30, 30, 31, 29, 31]
if year % 4 == 0
  months[1] = 29
  puts "leap year"
else
  puts "year is not leap"
end
days_count = 0
index = 0
while index < month - 1
  days_count += months[index]
  index += 1
end
puts "#{days_count + day} day"

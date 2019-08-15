#Заданы три числа, которые обозначают число, месяц, год. Найти порядковый номер даты, начиная отсчет с начала года.
#Учесть что год может быть высокосным.
puts "Введите день"
date = gets.to_i
puts "Введите номер месяца"
number_month = gets.to_i
puts "Введите год"
year = gets
if year.to_i % 4 == 0
  year = :leap
  months = [31, 29, 31, 30, 31, 30, 31, 30, 30, 31, 29, 31]
  puts "Год высокосный"
else
  year = :not_leap
  months = [31, 28, 31, 30, 31, 30, 31, 30, 30, 31, 29, 31]
  puts "Год не высокосный"
end
days = 0
i = 0
while i < number_month
  days += months[i]
  i += 1
end
count = days - months[i - 1]
puts "#{count + date} день по счёту "

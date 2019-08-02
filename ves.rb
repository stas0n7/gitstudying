puts "Как ваше имя?"
name = gets.chomp
puts "Какой у вас рост?"
height = gets.chomp
puts "#{name} ваш идеальный вес #{height.to_i - 110}"
if height.to_i - 110 < 0
    puts "Ваш вес уже оптимальный"
end










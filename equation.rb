puts "Квадратное уравнение :"
puts "Введите первый коэффициент"
a = gets.to_f
puts "Введите второй коэффициент"
b = gets.to_f
puts "Введите третий коэффициент"
c = gets.to_f
D = b**2 +(-4*a*c)
if D > 0
    X = (-b - Math.sqrt(D)) / 2*a
    Y = (-b + Math.sqrt(D)) / 2*a
    puts "Дискриминант = #{D} , имеет два корня #{X} и #{Y}"
elsif D == 0
    X = (-b - Math.sqrt(D)) / 2*a
    puts "Дискриминант = #{D} , имеет один корень #{X}"
else
    puts "Дискриминант = #{D} , корней нет!"
end

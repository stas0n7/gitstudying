puts "Укажите длинну первой стороны треуголника"
sta = gets
puts "Укажите длинну второй стороны треуголника"
stb = gets
puts "Укажите длинну третьей стороны треуголника"
stc = gets
if sta.to_i > stb.to_i && sta.to_i > stc.to_i && sta.to_i**2 == stb.to_i**2 + stc.to_i**2
    puts "Треугольник прямоуголный"
elsif sta.to_i > stb.to_i && sta.to_i > stc.to_i && sta.to_i**2 != stb.to_i**2 + stc.to_i**2
    puts "Треугоник не прямоугольный"
elsif stb.to_i > sta.to_i && stb.to_i > stc.to_i && stb.to_i**2 == sta.to_i**2 + stc.to_i**2
    puts "Треуголник прямоугольный"
elsif stb.to_i > sta.to_i && stb.to_i > stc.to_i && stb.to_i**2 != sta.to_i**2 + stc.to_i**2
    puts "Треугольник не прямоугольный"
elsif stc.to_i > sta.to_i && stc.to_i > stb.to_i && stc.to_i**2 == sta.to_i**2 + stb.to_i**2
    puts "Треуголник прямоугольный"
elsif stc.to_i > sta.to_i && stc.to_i > stb.to_i && stc.to_i**2 != sta.to_i**2 + stb.to_i**2
    puts "Треугольник не прямоугольный"
end

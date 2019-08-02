puts "Укажите длинну первой стороны треуголника"
sta = gets
puts "Укажите длинну второй стороны треуголника"
stb = gets
puts "Укажите длинну третьей стороны треуголника"
stc = gets
if sta.to_f > stb.to_f && sta.to_f > stc.to_f && sta.to_f**2 == stb.to_f**2 + stc.to_f**2
    puts "Треугольник прямоуголный"
elsif sta.to_f > stb.to_f && sta.to_f > stc.to_f && sta.to_f**2 != stb.to_f**2 + stc.to_f**2
    puts "Треугоник не прямоугольный"
elsif stb.to_f > sta.to_f && stb.to_f > stc.to_f && stb.to_f**2 == sta.to_f**2 + stc.to_f**2
    puts "Треуголник прямоугольный"
elsif stb.to_f > sta.to_f && stb.to_f > stc.to_f && stb.to_f**2 != sta.to_f**2 + stc.to_f**2
    puts "Треугольник не прямоугольный"
elsif stc.to_f > sta.to_f && stc.to_f > stb.to_f && stc.to_f**2 == sta.to_f**2 + stb.to_f**2
    puts "Треуголник прямоугольный"
elsif stc.to_f > sta.to_f && stc.to_f > stb.to_f && stc.to_f**2 != sta.to_f**2 + stb.to_f**2
    puts "Треугольник не прямоугольный"
end

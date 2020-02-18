fi = [0, 1]
while fi.last < 100
  fi << fi.last + fi[-2]
end
if fi.last > 100
  fi.pop
end
puts fi

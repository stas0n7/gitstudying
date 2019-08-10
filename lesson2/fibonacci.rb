fi = [0,1]
while fi[-1] < 100 
    fi << fi[-1] + fi[-2]
    end
if fi[-1] > 100
    fi.delete_at(-1)
end
puts fi

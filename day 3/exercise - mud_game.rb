class Room
  def initialize(description,objetos,thing,moves)
    @description = description
    @objetos = objetos
    @thing = thing
  end

  def generate_random(array)
    arr_leng = array.length
    array[random(arr_leng-1)]
  end

  def generate_description(luces,objetos,clima,interactive)

  end

end

# class player
#   def initialize
#     current_position[0,0]
#   end
# end



objetos_arr = ["","espada","pistola","lapiz","escudo","botas magicas","veneno","flor","botella","liquido", "cofre","caliz","basura"]
objeto = objetos_arr[rand(objetos_arr.length-1)]
interactive_things_arr = ["","orco","lobo","vaca","monstruo","hada","serpiente"]
interactive = interactive_things_arr[rand(interactive_things_arr.length-1)]

clima_arr = ["calurosa","helada","maldita","lugubre"]
clima = clima_arr[rand(clima_arr.length-1)]
luces_arr = ["oscura","luminosa"]
luces = luces_arr[rand(luces_arr.length-1)]
allowed_moves_arr = [["N","S","E","O"],["N","S","E"],["N","S","O"],["S","E","O"],["N","S"],["S","O"],["S","E"],["S"]]
allowed_m = allowed_moves_arr[rand(allowed_moves_arr.length-1)]
if clima == "maldita"
  allowed_m.delete("S")
end


if interactive == "" && objeto != ""
  description = "Has entrado en una habitación #{luces}, esta #{clima}. No hay nadie, pero encuentras un #{objeto}. Hay puertas en #{allowed_m}"
elsif interactive == "" && objeto == ""
    description = "Has entrado en una habitación #{luces}, esta #{clima}. No hay nadie, pero encuentras un #{objeto}. Hay puertas en #{allowed_m}"
else
  description = "Has entrado en una habitación #{luces}, esta #{clima}. Ves un #{interactive} y hay un  #{objeto}. Hay puertas en #{allowed_m}"
end

puts description
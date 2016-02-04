names = Array.new
names =["Javier","Rashed","Adrián","Juan Antonio","J. Lucas","Mario","José María","Christopher","Joaquín","Elisa","Manuel","Pau","Rubén","Rachel","Juan"]

names.each {|alumnos| puts "Hola #{alumnos}"}
# names.each {|alumnos| 
#   puts "Hola #{alumnos}"
# }

names2 = Hash.new
names2 = {Javier: 20, Rashed: 28, Adrián: 30, JuanAntonio: 21, JLucas: 26, Mario: 29, JoséMaría: 29, Christopher: 32, Joaquín: 31, Elisa: 19, Manuel: 22, Pau: 28, Rubén: 25, Rachel: 20, Juan: 30}

puts names2.select {|nombre , edad| edad >= 25 }

# cities =Array.new
# cities = ["madrid","alicante","barcelona","valencia","sevilla"]
# puts cities_captitalized = cities.map{ |city| city.capitalize}

# longest_city= ""
# cities.each do |city|
#   if longest_city.length < city.length
#     longest_city = city
#   end
# end
# puts longest_city

# longest_city = cities.reduce do | longest,city |
#   if longest.length < city.length
#     city
#   else
#     longest
#   end
# end

# puts longest_city
# longest_city = cities.reduce {|longest,city| longest.length < city.length ? city : longest}
# puts longest_city
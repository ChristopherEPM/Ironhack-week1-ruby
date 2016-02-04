#---- Day 1--- Ruby, classes , functions ,variables------
# class Dog
# 	def initialize
# 		@name = "Jack" # @ variable de instancia, para que esten disponibles en la instancias
# 		@bred = "English bulldog"
# 	end
# 	def bark
# 		puts "woof"
# 	end
# end

# class Dog
# 	def initialize(arg1, arg2) #le pasamos valores con parentesis, o con una separacion 
# 		@name = arg1 
# 		@bred = arg2
# 	end
# 	def bark(sound)
# 		puts sound
# 	end

# end

# perro.new( "JAck","english bulldod");
# perro.bark("wof")


class Dog #otra forma
	attr_accessor :nam, :file, :personsSmelled ## --- Atrtibute accesors -- leer y modificar
	attr_reader :bark ## --- Atribute reader -- leer
	def initialize(arg1, arg2, bark) #le pasamos valores 
		@name = arg1 
		@bred = arg2
		@bark = bark
		@personsSmelled = Array.new # == @personsSmelled = []
    file = File.open("smelled_by_#{@name}.txt","w")
    file.close
	end
	def bark
		puts sound
	end
	def smell(person) #iteration 2 save the people smelled in a file
    file = File.open("smelled_by_#{@name}.txt","a")# appneds añade al fine write sobrescribe
    file.puts(person)
    file.close

	#	@personsSmelled << person ## = a @personsSmelled.push(person)
	end
	def peopleSmelled
    file = File.open("smelled_by_#{@name}.txt","r")
    people = file.readlines 
    file.close
    people
		#@personsSmelled #devolemos el array
	end
  # def clear_file
  #   @file = File.open("people_smelled.txt","w")
  #   @file.puts("")
  #   @file.close
  # end
	# esto seria una forma menos eficiante de utilizar el attr_accesor y attr_reader
	# def setName= (str) #al ser setter le pones un= en la parte del nombre,(una regla de nombre, no hace nada)
	# 	@name = str  #establemcemos name
	# end
	# def getName
	# 	@name 	#devolvemos name
	# end

end

perro = Dog.new( "JAck","english bulldod","grrrr");

# metodos de clases. self. (en busqueda de base de datos por ejemplo)

#herencia   heredamos todo lo del padre , manteniendo, modificiando o añadiendo. La Herencia en rubi solo  se puede de un

class Hound < Dog
	def bark
		puts "bark!"
	end
	def track
		puts "snifff snifff snifff"
	end
end

# class PetDog < Dog
# 	def initialize (name, breed, owner) # sobrescribiendo el metodo pero no es util, si son muchas lineas el padre
# 		@name = name
# 		@owner = owner
# 		@breed = breed
# 	end
# 	def fetch
# 		puts "Im playing with  the ball,... i mean, wooof woof"
# 	end	
# end

class PetDog < Dog
	def initialize (name, breed, owner) # llamamos a la classe supper (padre) pasandoles los argumentos. Mas eficiente, porque no habra que repetir codigo y lo hara el padre
		super(name, breed, "wof")
		@owner = owner
	end
	def fetch
		puts "Im playing with  the ball,... i mean, wooof woof"
	end	
	def hip
		self.bark + "Hip"+ " Hip!" #preguntar
	end
end

myPet = PetDog.new("billy","pug","maeeow?")
myPet.fetch

toby = Dog.new("toby","tecjke","bow")
#toby.name =("joe")

##la ultima cosa que evalua en ruby sera un return implicito ( en los metodos)

toby.smell("pepe")
toby.smell("luis")
toby.smell("paco")
puts toby.peopleSmelled # mostramos el contenido del array
#toby.clear_file
# ######### METHOD SCOPE
# #
# class Midas
#   def initialize(initial_gold)
#     @gold = initial_gold
#   end

#   def take_gold_from(other)
#     @gold += other.gold
#   end

#   private # solo lo lo puede usar el propio bjeto , protected solo el objeto y los herederos (no en superiores). por defecto son publicos
#   def gold
#     @gold
#   end
#   def gold2
#     @gold
#   end
#   # otra forma de ponerlo(pero menos utilizado)=  protected :gold, :gold2
# end

# m1 = Midas.new(10)
# m2 = Midas.new(20)
# m1.take_gold_from(m2)
# NoMethodError: private method 'gold' called

# ---

# class Midas
#     protected :gold
#   end


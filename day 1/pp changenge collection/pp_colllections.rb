class ProgrammingLanguages
  attr_accessor :name, :age, :type 

  def initialize (name, age, type)
    @name = name
    @age = age 
    @type = type
  end
end

class Array_Languages
  def array_each_printer(array)
    array.each {|language| puts "language: #{language.name}, Age: #{language.age}, Type: #{language.type}"}
  end

  def array_map_printer(array)
    puts "the programing leanguages aged 1 year are:"

    @array_maped = array.map do |language| 
      language.age+=1
      language
    end
    self.array_each_printer(@array_maped)
  end

  def array_sort_printer
    puts " the programing languages sorted by age are:"
    puts self.array_each_printer(@array_maped)
    array_sorted =@array_maped.sort{|languages, languagesB| languages.age <=> languagesB.age}.reverse
   # array_sorted =@array_maped.sort_by{|languages| languages.age }
    self.array_each_printer(array_sorted)
  end
end


ruby = ProgrammingLanguages.new("Ruby", 21, "Dynamic")
python = ProgrammingLanguages.new("Python", 24, "Dynamic")
javaScript = ProgrammingLanguages.new("JavaScript", 20, "Dynamic")
go = ProgrammingLanguages.new("Go", 6, "Static")
rust = ProgrammingLanguages.new("Rust", 5, "Static")
swift = ProgrammingLanguages.new("Swift", 2, "Static")
java = ProgrammingLanguages.new("Java", 20, "Static")

array_l = Array_Languages.new
array_languages = [ruby, python, javaScript, rust, swift, java]
#array_l.array_each_printer array_languages
array_l.array_map_printer(array_languages)
array_l.array_sort_printer


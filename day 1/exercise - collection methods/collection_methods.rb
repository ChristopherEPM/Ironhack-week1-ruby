require "pry"
class Home
  attr_reader(:name, :city, :price, :capacity)

  def initialize(name, city, price, capacity)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end

end

class HomesBag
  def show_homes(homes)
    homes.each do |hm|
      puts "House name: #{hm.name}, House city: #{hm.city}, House price: #{hm.price}k, House capacity: #{hm.capacity}" 
    end
  end

  def show_only_homes(homes)
    homes.each do |hm|
      puts "House name: #{hm.name}" 
    end
    self.show_average_homes(homes, homes.length)
  end

  def show_average_homes(homes, length)
    total_price = 0.0
    homes.each do |hm|
      total_price += hm.price
    end
    puts "The average price is: #{(total_price/length).round(2)}k €"
  end

  def sort_homes(homes)
    puts "****** Homes sorted by price *******"
    homes_sorted = homes.sort_by{|hm| hm.price }
    self.show_homes(homes_sorted)
    sort_option = question_option
    sort_homes_options(sort_option,homes)
    
    #binding.pry
  end

  def question_option
    puts "---------[ Comands: ]------ \n capacity : to sort by capacity\n highest : to sort by highest price\n lower :  to sort by lower price\n city : start a search by the city´s name\n price : find the houses with that price\n exit : Terminate the aplication"
    gets.chomp.downcase
  end

  def sort_homes_options(option,homes)
    while option != "exit"
      if option == "city" || option == "highest" || option == "lower" || option == "price"
        puts "****** Homes sorted by #{option} *******"
      end
      case option
        when "highest"
          homes_sorted = homes.sort_by{|hm| hm.price }.reverse
        when "capacity"
          homes_sorted = homes.sort_by{|hm| hm.capacity }.reverse
        when "lower"
          homes_sorted = homes.sort_by{|hm| hm.price}
        when "city"
          self.sort_by_city(homes)
        when "price"
          self.found_by_price(homes)
        else
          puts "not allowed comand"
        end

      if option == "highest" || option == "lower" || option == "capacity"  
        self.show_homes(homes_sorted)
      end
      option = question_option
    end
  end

  def sort_by_city(homes)
    puts "Type the city where u want see homes"
    city = gets.chomp
    exist_city = homes.find do |hm|
      hm.city.downcase == city.downcase
    end
    #binding.pry
    if exist_city == nil 
      puts "we dont have house in that places,want to do another city search? type 'yes' or 'no' \n (if not we will return to the main menu)"
      another_city_option = gets.chomp
      if another_city_option.downcase == "yes"
        self.sort_by_city(homes)
      end
    else
      select_city = homes.select do |hm|
        hm.city.downcase == city.downcase
      end
      show_only_homes(select_city)
    end
  end

  def found_by_price(homes)
    puts "Type the price what u want to found"
    price = gets.chomp
    exist_price = homes.find do |hm|
      hm.price.to_f == price.to_f
    end
    if exist_price == nil 
      puts "we dont have a house with that price,want to do another price search? type 'yes' or 'no' \n (if not, we will return to the main menu)"
      another_price_option = gets.chomp
      if another_price_option.downcase == "yes"
        self.found_by_price(homes)
      end
    else
      select_price = homes.select do |hm|
        hm.price.to_f == price.to_f
      end
      show_homes(select_price)
    end
  end

end

homes = [
  Home.new("Nizar's place", "San Juan", 40, 2),
  Home.new("Fernando's place", "Seville", 47, 5),
  Home.new("Josh's place", "Pittsburgh", 41, 3),
  Home.new("Gonzalo's place", "Málaga", 45, 2),
  Home.new("Ariel's place", "San Juan", 49, 4),
  Home.new("Callao's place", "Madrid", 20, 2),
  Home.new("Coliseum's place", "Madrid", 30, 3),
  Home.new("New place", "Alicante", 15, 4),
  Home.new("Catalunya stadium's place", "Barcelona", 40, 4),
  Home.new("Mayor's place","Madrid", 36, 2)
]
homes_bag1 = HomesBag.new
homes_bag1.show_homes(homes)
homes_bag1.sort_homes(homes)
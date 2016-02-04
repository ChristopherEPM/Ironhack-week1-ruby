
#  Exercise
# Write two data structures that fulfill the lines of code below .
# Can they go that deep? There's only one way to find out!
 
has = {
  :what =>[ 
    {},{},{
    :wut => [
      [],[
          [
            [
              {},{},{},{},{},{},{},{},{},{
                :bbq => "hi"
              }
            ]
          ]
        ]
      ]
    }
  ]
}

#puts hash[:wat][2][:wut][1][0][9][:bbq]


arr =[
  [0,1,2,3,4,{
      :secret => {
        :unlock => [0,1]
      }
    }
  ]
]
# puts arr[0][5][:secret][:unlock][1]

#  Exercise
# Create a class CarDealer which has an inventory of cars. We want to be able to quickly locate all Cars of a given brand to show them to customers.
# We should be able to get all the cars of a brand with
# car_dealer.cars("Ford")
# We also need a method to print the inventory in a form like
# Ford: Fiesta, Mustang
# Seat: Ibiza, Leon, Toledo
 # --- my modelo
# class CarDealer

#   def initialize(inventory)
#     @inventory << inventory
#   end

#   def search_model(model)

    
#   end

#   def exist()
#       exist_models = homes.find do |hm|
#       hm.city.downcase == city.downcase
#     end
#   end

# end

# class Car
#   def initialize(mark,model)
#     @mark = mark
#     @model = model
#   end

# end

# #inventory = { :ford => ["Fiesta","Mierda","Mustang"], :Seat => ["Ibiza","Leon","Toledo"], :Opel => ["Corsa"]}
# cars_list = [ 
#   Cars.new("Ford","Fiesta"), 
#   Cars.new("Ford","Mierda"),
#   Cars.new("Ford","Mustang"), 
#   Cars.new("Seat","Ibiza"),
#   Cars.new("Seat","Leon"),
#   Cars.new("Seat","Toledo"),
#   Cars.new("Open","Corsa")
# ]

# inventory = CarDealer.new(car_list) 

#modelo porfesor

#si no tubiera valor le mete array , si lo tiene se queda como esta. operador "orequal" ||=.
        #a =17
        # a ||=23
        # a-> 17
        # a=nil
        # a ||=23
        # a=23
class CarDealer

  def initialize(inventory)
    @inventory = inventory
  end

  def cars(brand)
    @inventory.select { |car| car[:brand].downcase == brand.downcase }
  end

  def pretty_print_inventory
      pretty_print_inventory = {}
      @inventory.each do |car|
        brand = car [:brand].downcase
        pretty_print_inventory[brand] ||= [] #si ya tenemos una key con ese brand lo dejamos.. sino creamos array
        pretty_print_inventory[brand] << car [:model].downcase.capitalize
        end
      pretty_print_inventory.each do |brand,models|
        puts "#{brand.capitalize}: #{models.join(", ")}"
      end
  end

end

inventory = [
  {brand: "Ford", moled: "fiesta", year: 2010, license: "ASKA123"},
  {brand: "Ford", moled: "Mustang", year: 2011, license: "AUHF123"},
  {brand: "Tesla", moled: "S", year: 2014, license: "EGDA123"},
  {brand: "Mini", moled: "Coope", year: 2011, license: "ASDA123"},
]
car_dealer = CarDealer.new(inventory)
puts car_dealer.cars("Ford").inspect
puts car_dealer.pretty_print_inventory

require "pry"
class ShoppingCart
  def initialize
      @items = []
      @total_cost = 0
      @final_total_cost = 0
      @item_list = []
      @final_list_price = {}
      @time = Time.now
    if time.month == 3 || time.month ==  4 ||  time.month == 5
        @precio_frutas = { :apple => 10, :orange => 5, :grape => 15, :banana => 20, :watermelon => 50 } 
    elsif time.month ==  6 || time.month ==  7 || time.month ==  8
        @precio_frutas = { :apple => 10, :orange => 2, :grape => 15, :banana => 20, :watermelon => 50 } 
    elsif time.month == 9 || time.month ==  10 || time.month == 11
        @precio_frutas = { :apple => 15, :orange => 5, :grape => 15, :banana => 20, :watermelon => 50 } 
    elsif time.month ==  1 || time.month ==  2 || time.month ==  12 
        @precio_frutas = { :apple => 12, :orange => 5, :grape => 15, :banana => 21, :watermelon => 50 } 
    end
    @cart_content={}
  end

  def add_item_to_cart(haskey)
      @items << haskey
  end

  def count
    @item_unit_counts = Hash.new(0)
    @items.each { |name | @item_unit_counts[name] +=1 }
  end
  def cost
    @items.each do | item |
      @total_cost += @precio_frutas[item]
    end
    puts "total cost: #{@total_cost} $"
    puts "------------"
    deals
  end

  def final_cost
    @final_list_price.each do | key,item |
      @final_total_cost += @final_list_price[key]
    end
    puts "Final total cost: #{@final_total_cost} $"
    puts "------------"
  end 

  def show
    @items.uniq.each do | element |
      puts "#{@item_unit_counts[element]} #{element} : #{@final_list_price[element]} $" #{@precio_frutas[element.to_sym]* @counts[element.to_sym]}
    end
  end

  def items_total_price
      @items.uniq.each do | element |
      @final_list_price[element] = @precio_frutas[element] * @item_unit_counts[element]
    end
  end
  def deals
      @items.uniq.each do | element |
        if element == :apple && @item_unit_counts[element] >= 2
          @final_list_price[element] = ((@item_unit_counts[element] - @item_unit_counts[element]/2) * @precio_frutas[element])
        elsif element == :orange && @item_unit_counts[element] >= 3
          @final_list_price[element] = ((@item_unit_counts[element] - @final_list_price[element]/3) * @precio_frutas[element])
          #binding.pry
        elsif element == :grape && @item_unit_counts[element] >= 4
          @item_unit_counts[:banana] += @item_unit_counts[element]/4 
        elsif @time.wday == 0 && element == :watermelon
          @final_list_price[element] = @item_unit_counts[element] * (@precio_frutas[element]*2)
        end 
    end
    show

  end

end

#@precio_frutas[item.to_sym] ##obtenemos el valor transformando el valor introducido en simbolo


cart = ShoppingCart.new
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :watermelon
cart.count
cart.items_total_price
cart.show
cart.cost
cart.final_cost
# Buy 3 oranges and pay just 2!
# Buy 4 grapes you get one banana for free if you want!

# puts d= 12*3
# puts a=3/2
# puts b= a*12
# puts  d - b
# 1 apple: 10$
# 2 bananas: 40$

# cart.cost = 50
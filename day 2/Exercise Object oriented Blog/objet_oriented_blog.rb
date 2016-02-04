require "pry"
require "colorize"
#cambiar variables de instancia a locales, segun coonvenga
class Blog
  attr_accessor :post_container, :blog_page
  attr_reader :pages, :blength

  def initialize
    @post_container = Array.new
    @blog_page = 0
  end

  def add_post(post)
    @post_container << post 
  end
  
  def order_post
    @post_container.sort_by!{ |post| post.date}.reverse! # ordenamos por fecha y revertimos el inverso
  end

  def show_post(pages,blength)
    @start = 0
    @actual_page=1
    begin
    #cambiar a while
      @pages = pages  
      @blength = blength
      @container_sliced = cachos(@post_container, @start)

      @container_sliced.each do |post|
        if post.sponsored == false
          puts post.title
        else 
          puts "******#{post.title}******"
        end 
        puts "--**************--"
        puts post.text
        puts "--------------"
      end
       # binding.pry
      # realizar funcion con el for

      print_number_pages(pages)
      response = gets.chomp

      if response == "next" && @actual_page  !=@pages #revisar condiciones la ultima no la coge
        @start += 3
        @actual_page += 1
      elsif response == "back" && @actual_page >1
        puts @actual_page
        @start -= 3
        @actual_page -= 1
        puts @actual_page
      end

      end while response != "exit"
  end

  def get_blog_length
    @post_container.length
  end

  def cachos(post,start= 0)
    @post = post
    @start =start
    @post.slice(start,3)
  end

  def print_number_pages(pages)
    for i in 1..pages
        if i == @actual_page
          print print " [#{ i }] ".red # sacarlo a color
        else
          print " [#{ i }] "    
        end
      end
      puts ""
      puts "use 'next', 'back', or exit" 
  end

end


class Post
  attr_reader :title, :text, :date, :sponsored

  def initialize(title, text, date, sponsor = false) #sera false salvo que le llegue un true
    @title = title
    @text = text
    @date = date
    @sponsored = sponsor
  end
end

blog = Blog.new
post_a = Post.new("Hellow world 1","this is my first post",Time.now + 1234567)
blog.add_post(post_a)
post_b = Post.new("Hellow world 2","this is my second post",Time.now - 1234567)
blog.add_post(post_b)
post_c = Post.new("Hellow world 3","this is my third post", Time.now,true)
blog.add_post(post_c)
post_d = Post.new("Hellow world 4","this is my fourth post",Time.now - 2212222,true)
blog.add_post(post_d)
post_e = Post.new("Hellow world 5","this is my fifth post",Time.now + 3333322)
blog.add_post(post_e)
post_f = Post.new("Hellow world 6","this is my six post",Time.now + 1111111)
blog.add_post(post_f)
post_g = Post.new("Hellow world 7","this is my 7 post",Time.now + 2222222,true)
blog.add_post(post_g)
blog.order_post
blog_pages = (blog.get_blog_length.to_f/3.to_f).ceil
blog_length= blog.get_blog_length
blog.show_post(blog_pages,blog_length)
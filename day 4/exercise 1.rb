#  Exercise
# Create a command line tool. This command line tool will ask you for a user and a password. If it’s correct it will ask to enter a text and the program will count the number of words.
# Passwords can be hardcoded into the source code.
class Line_tool
  def initialize
    @user_nick = "Bloodaxe"
    @user_password = "password1234"
  end

  def user_question
     print "Please enter your username: "
     @user_response = gets.chomp
  end

  def password_question
    print "Please enter your password: "
    @password_response = gets.chomp
  end

  def user_data_verify
     @user_password == @password_response && @user_nick.downcase == @user_response.downcase 
  end

  def user_verify_result
    if user_data_verify
      print "Enter the phrase where you want count words : "   
      sentence_splited = transform_sentence(gets.chomp)
      count_sentence(sentence_splited)
    else
      puts "Validation incorrect. Try another time dude"
    end 
  end

  def transform_sentence(sentence)
      sentence.split(" ")
  end
  def count_sentence(sentence)
    puts "The words amount of the sentece typed is: #{sentence.count}"
  end

end

user_login = Line_tool.new
user_login.user_question
user_login.password_question
user_login.user_verify_result


####HAREK SOLUTIONSSS #

# MI SCRIPT HACE MUCHAS COSAS

# class Counter
#     def self.word_count(text)
#         text.split.size
#     end
# end

# class User
#     def initialize (username, password)
#         @username = username
#         @password = password
#     end
#     def authenticate
#         @password == "12345" ? true : false
#     end
# end


# puts "enter your username:"
# username = gets.chomp
# puts "enter your password:"
# password = gets.chomp
# user = User.new(username, password)
# if user.authenticate
#     puts "enter a text:"
#     text = gets
#     size = Counter.word_count(text)
#     puts "Your text has #{size} word#{size == 1? '' : 's'}"
# else
#     puts "wrong password"
# end

# [10:19] 
# AHORA HACE MENOS COSAS PORQUE HE EXTRAIDO COMPORTAMIENTO A OTRA CLASE

# class Counter
#     def self.word_count(text)
#         text.split.size
#     end
# end

# class User
#     def initialize (username, password)
#         @username = username
#         @password = password
#     end
#     def authenticate
#         @password == "12345" ? true : false
#     end
# end

# class Authenticator
#     def self.authenticateUser
#         puts "enter your username:"
#         username = gets.chomp
#         puts "enter your password:"
#         password = gets.chomp
#         user = User.new(username, password)
#         user ? user : nil
#     end
# end



# if Authenticator.authenticateUser
#     puts "enter a text:"
#     text = gets
#     size = Counter.word_count(text)
#     puts "Your text has #{size} word#{size == 1? '' : 's'}"
# else
#     puts "access denied"
# end
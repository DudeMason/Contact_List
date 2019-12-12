require './contact.rb'

@users = []
@contacts = []

def intro
  puts "Welcome, please login or create an account to view your contact list"
  puts "1) Log In"
  puts "2) Create Account"
  choice = gets.strip.to_i

  if choice == 1
    login
  elsif choice == 2
    account_create
  else
    puts "********************************"
    puts "Invalid entry, please try again!"
    puts "********************************"
    intro
  end
end

def login
  puts "Enter your username"
  user = gets.strip
  puts "Enter your password"
  pass = gets.strip
  @users.each {|u|
  if u.log == user + pass
    @current_user = u
    puts "----------------------------------------------"
    puts "Login successfull! Welcome #{@current_user.username}!"
    puts "----------------------------------------------"
    menu
  end}
  @users.each {|u|
  if u.username == user
    puts "********************"
    puts "*Incorrect password*"
    puts "********************"
    intro
  end}
  puts "*****************"
  puts "**Invalid Entry**"
  puts "*****************"
  intro
end

def account_create
  puts "What will be your username? (case sensitive)"
  @a = gets.strip.to_s
  password
end

def password
  puts "What will be your password?"
  p = gets.strip.to_s
  puts "Please confirm your password."
  p2 = gets.strip.to_s
  if p == p2
    bruh = User.new(@a, p)
    @users << bruh
    puts "-------------"
    puts "User created!"
    puts "-------------"
    intro
  elsif p != p2
    puts "****************************"
    puts "*The passwords did not match*"
    puts "****************************"
    password
  else
    puts "**********************"
    puts "*Something went wrong*"
    puts "**********************"
    intro
  end
end


def menu
  puts "What would you like to do?"
  puts "1) View Contact List"
  puts "2) Edit Account Info"
  puts "3) Add Contact"
  puts "4) Edit Contact"
  puts "5) Log Out"
  choice = gets.strip.to_i

  case choice
  when 1
    contact_view
  when 2
    account_edit
  when 3
    add_contact
  when 4
    edit_contact
  when 5
    intro
  else puts "Invalid entry, please try again!"
    menu
  end
end

def contact_view
  puts "-----------------"
  puts "Your contact list"
  @contacts.each {|c|
  puts c.display}
  menu
end

def account_edit
  puts "What would you like to change/add?"
  puts "1) Username"
  puts "2) Password"
  puts "3) Email"
  puts "4) Phone Number"
  puts "5) Address"
  num = gets.strip.to_i

  case num
  when 1

  when 2

  when 3

  when 4

  when 5

  end
end

intro

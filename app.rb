require './contact.rb'
require 'io/console'

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
    puts "**********************************"
    puts "*Invalid entry, please try again!*"
    puts "**********************************"
    intro
  end
end

def login
  puts "Enter your username"
  user = gets.strip
  puts "Enter your password"
  pass = STDIN.getpass("Password:").strip
  @users.each {|u|
    if u.log == user + pass
      @current_user = u
      puts "------------------------------------------"
      puts "-Login successfull! Welcome, #{@current_user.username}!-"
      puts "------------------------------------------"
      menu
    end
  }
  @users.each {|u|
    if u.username == user
      puts "********************"
      puts "*Incorrect password*"
      puts "********************"
      intro
    end
  }
  @users.each {|u|
    if u.password == pass
      puts '******************************'
      puts '*That username does not exist*'
      puts '******************************'
      intro
    end
  }
  puts "***************"
  puts "*Invalid Entry*"
  puts "***************"
  intro
end

def account_create
  puts "What will be your username? (case sensitive)"
  @username = gets.strip
  if @username == "back"
    intro
  elsif @username == "exit"
    intro
  elsif @username.to_i >= 1
    puts '*****************************'
    puts "*Username cannot be a number*"
    puts '*****************************'
    account_create
  elsif @username == ""
    puts '**************************'
    puts "*Username cannot be empty*"
    puts '**************************'
    account_create
  else
    password
  end
end

def password
  puts "What will be your password?"
  p = STDIN.getpass("Password:").strip
    if p.length < 8
      puts '*********************************************'
      puts '*Password must be at least 8 characters long*'
      puts '*********************************************'
      password
    end
  puts "Please confirm your password."
  p2 = STDIN.getpass("Password:").strip
  if p == p2
    bruh = User.new(@username, p, 0, 0, '')
    @users << bruh
    puts "---------------"
    puts "-User created!-"
    puts "---------------"
    intro
  elsif p != p2
    puts "*****************************"
    puts "*The passwords did not match*"
    puts "*****************************"
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
  else
    puts '**********************************'
    puts "*Invalid entry, please try again!*"
    puts '**********************************'
    menu
  end
end

def contact_view
  if @contacts.length == 0
    puts "**********************************"
    puts "*You don't have any contacts yet!*"
    puts "**********************************"
    menu
  else
    puts "-------------------"
    puts "↓Your contact list↓"
    puts "-------------------"
    @contacts.each {|c|
    puts c.display}
    menu
  end
end

def account_edit
  puts "What would you like to change/add?"
  puts "1) Username"
  puts "2) Password"
  puts "3) Email"
  puts "4) Phone Number"
  puts "5) Address"
  puts "6) Main Menu"
  num = gets.strip.to_i

  case num
  when 1
    puts "Your current username is '#{@current_user.username}'"
    puts "What would you like to change it to?"
    puts "Or type 'back' to return"
    new = gets.strip
    if new == "back"
      account_edit
    elsif new == "exit"
      account_edit
    elsif new.to_i >= 1
      puts '*****************************'
      puts "*Username cannot be a number*"
      puts '*****************************'
      account_edit
    elsif new == ""
      puts '**************************'
      puts "*Username cannot be empty*"
      puts '**************************'
      account_edit
    else
      @current_user.username = new
      puts '-------------------'
      puts "-Username updated!-"
      puts '-------------------'
      account_edit
    end
  when 2
    puts "Type your current password"
    currentpass = STDIN.getpass("Password:").strip
    if currentpass == @current_user.password
      puts "Type your new password"
      newpass = STDIN.getpass("Password:").strip
      puts "Please confrim your new password"
      passconfirm = STDIN.getpass("Password:").strip
      if newpass == passconfirm
        @current_user.password = newpass
        puts "-------------------"
        puts "-Password updated!-"
        puts "-------------------"
        account_edit
      elsif newpass != passconfirm
        puts "*****************************"
        puts "*The passwords did not match*"
        puts "*****************************"
        account_edit
      else
        puts "**********************"
        puts "*Something went wrong*"
        puts "**********************"
        account_edit
      end
    else
      puts '*********************'
      puts '*Incorrect Password!*'
      puts '*********************'
      account_edit
    end
  when 3
    if @current_user.email == ''
      puts "You don't have an email set."
      puts "What's your email address?"
      puts "Or type 'back' to exit this menu."
      addy = gets.strip
      ## how to verify if email format??
      # if addy == addy.match(VALIDATE_EMAIL_REGEXP)
      #   puts "good"
      #   account_edit
      # elsif addy != addy.match(VALIDATE_EMAIL_REGEXP)
      #   puts 'bad'
      #   account_edit
      # else
      #   puts 'oops'
      #   account_edit
      # end
      @current_user.email = addy
      puts "------------------------"
      puts "-Email Address Updated!-"
      puts "------------------------"
      account_edit
    else
      puts "Your current email address is '#{@current_user.email}'"
      puts 'What would you like to change it to?'
      puts "Or type 'back' to exit this menu."
      new_addy = gets.strip
      @current_user.email = new_addy
      puts "------------------------"
      puts "-Email Address Updated!-"
      puts "------------------------"
      account_edit
    end
  when 4 #phone
    account_edit
  when 5 #address
    account_edit
  when 6
  else
    puts '**********************************'
    puts '*Invalid entry, please try again!*'
    puts '**********************************'
    account_edit
  end
end

def add_contact

end

def edit_contact

end

intro

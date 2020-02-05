class Contact
  attr_accessor :first_name, :last_name, :address, :phone_number, :email

  def initialize(first_name, last_name, address, phone_number, email)
    @first_name = first_name
    @last_name = last_name
    @address = address
    @phone_number = phone_number
    @email = email
  end

  def display
    puts "Name: #{@first_name} #{@last_name}"
    puts "Address: #{@address}"
    puts "Phone: #{@phone_number}"
    puts "Email: #{@email}"
    puts "----------------------------"
  end

  def first
    @first_name
  end
end


class User
  attr_accessor :username, :password, :phone_number, :address, :email

  def initialize(username, password, phone_number, address, email)
    @username = username
    @password = password
    @phone_number = phone_number
    @address = address
    @email = email
  end

  def log
    @username + @password
  end

end

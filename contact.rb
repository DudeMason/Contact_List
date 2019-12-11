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
    puts "----------------------------"
    puts "#{@first_name} #{@last_name}"
    puts "#{@address}"
    puts "#{@phone_number}"
    puts "#{@email}"
    puts "----------------------------"
  end

  def first
    @first_name
  end
end


class User
  attr_accessor :username, :password

  def initialize(username, password)
    @username = username
    @password = password
  end

  def log
    @username + @password
  end

end

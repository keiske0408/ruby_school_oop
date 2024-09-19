class Student
  attr_accessor :id, :name, :birth_date, :email, :phone_number
  @@records = []

  def save
    @@records << self
  end

  def destroy
    @@records.clear
  end

  def display
    puts "(id: #{id} |name: #{name} |birth_date: #{birth_date} |email: #{email} |phone_number: #{phone_number})"
  end

  def self.all
    return @@records
  end

  def self.find_id(id)
    @@records.find{|student|student.id == id}
  end

  def self.find_email(email)
    @@records.find{|student|student.email = email}
  end

  end

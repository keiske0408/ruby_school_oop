require './person'
class Teacher < Person
  attr_accessor :department

  def display
    return if deleted_at
    "(ID: #{id}, Name: #{name}, Birth_date: #{birth_date}, Email: #{email}, Phone_number: #{phone_number}, Department: #{department})"
  end
end
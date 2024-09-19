require './student.rb'


# id, name, birth_date, :email, :phone_number
puts "======Add new Student======"
new_students = Student.new
print "name: "
new_students.name = gets.chomp
print "birth_date: "
new_students.birth_date = gets.chomp
print "email: "
new_students.email = gets.chomp
print "phone_number: "
new_students.phone_number = gets.chomp

id = Student.all.size + 1
new_students.id = id

new_students.save
new_students.display
puts"Student added successfully!"





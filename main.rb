require './student.rb'

def add_student

# id, name, birth_date, :email, :phone_number
puts "•      Add new Student      •"
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
puts"Student added successfully!"
puts new_students.display
end

def delete_student
  puts "Input student ID to delete:"
  student_id = gets.chomp.to_i
  student = Student.find_id(student_id)

  if student
    student.destroy
    puts "Student successfully deleted!"
  else
    puts "ID not found"

  end
end


while true
puts '✦---------------------------✦'
puts '===========OPTIONS=========='
puts '1. Add student'
puts '2. Delete Student'
puts '3. Exit'
puts '✦---------------------------✦'

print 'Pick option: '
option = gets.to_i

case option
when 1
  add_student
when 2
  delete_student
when 3
  puts "Exiting the program"
  break
else
  puts "invalid option. Please try again."
end
end




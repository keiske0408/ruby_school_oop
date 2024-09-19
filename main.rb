require './course.rb'
require './student.rb'

def add_student

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
  puts "Student added successfully!"
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

def student_management
  puts "===========OPTIONS=========="
  print "Add/Delete:"
  option = gets.chomp.downcase
  if option == "add"
    add_student
  else
    if option == "delete"
      delete_student
    end
  end
  puts "invalid option"
end

def add_course
  puts "•      Add new Course      •"
  new_course = Course.new
  print "Course Name: "
  new_course.name = gets.chomp

  id = Course.all.size + 1
  new_course.id = id

  new_course.save
  puts "Course added successfully!"
  puts new_course.display
end

def delete_course
  puts "Input Course ID to delete:"
  course_id = gets.chomp.to_i
  course = Course.find_id(course_id)

  if course
    course.destroy
    puts "Course successfully deleted!"
  else
    puts "Course ID not found"

  end
end

def course_management

  puts "===========OPTIONS=========="
  print "Add/Delete:"
  option = gets.chomp.downcase
  if option == "add"
    add_course
  elsif option == "delete"
    delete_course
  else
    puts "invalid option"
    course_management
  end
end



while true
  puts "\n✦---------------------------✦"
  puts "\n===========OPTIONS==========\n"
  puts '1. Student management'
  puts '2. Course management'
  puts '3. Exit'
  puts "\n✦---------------------------✦\n"

  print 'Pick option: '
  option = gets.to_i

  case option
  when 1
    student_management
  when 2
    course_management
  when 3
    puts "Exiting the program"
    break
  else
    puts "invalid option. Please try again."
  end
end




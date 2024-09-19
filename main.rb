require './course.rb'
require './student.rb'
require './subject.rb'
require './teacher.rb'

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
  elsif
    if option == "delete"
      delete_student
    end
  else
    puts "invalid option"
  end

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
  print "Input Course ID to delete:"
  course_id = gets.chomp.to_i
  course = Course.find_course_id(course_id)

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

def add_subject
  puts "•      Add new Subject      •"
  new_subject = Subject.new
  print "Subject Name: "
  new_subject.name = gets.chomp

  id = Subject.all.size + 1
  new_subject.id = id

  new_subject.save
  puts "Subject added successfully!"
  puts new_subject.display
end

def delete_subject
  puts "Input Subject ID to delete:"
  subject_id = gets.chomp.to_i
  subject = Subject.find_id(subject_id)

  if subject
    subject.destroy
    puts "Subject successfully deleted!"
  else
    puts "Subject ID not found"
  end
end

def subject_management

  puts "===========OPTIONS=========="
  print "Add/Delete:"
  option = gets.chomp.downcase
  if option == "add"
    add_subject
  elsif option == "delete"
    delete_subject
  else
    puts "invalid option"
    subject_management
  end
end

def add_teacher
  puts "•      Add new Teacher      •"
  new_teacher = Teacher.new
  print "name: "
  new_teacher.name = gets.chomp
  print "birth_date: "
  new_teacher.birth_date = gets.chomp
  print "email: "
  new_teacher.email = gets.chomp
  print "phone_number: "
  new_teacher.phone_number = gets.chomp
  print "department: "
  new_teacher.department = gets.chomp

  id = Teacher.all.size + 1
  new_teacher.id = id

  new_teacher.save
  puts "Teacher added successfully!"
  puts new_teacher.display
end

def delete_teacher
  puts "Input student ID to delete:"
  teacher_id = gets.chomp.to_i
  teacher = Teacher.find_id(teacher_id)

  if teacher
    teacher.destroy
    puts "Teacher successfully deleted!"
  else
    puts "ID not found"
  end
end

def teacher_management
  puts "===========OPTIONS=========="
  print "Add/Delete:"
  option = gets.chomp.downcase
  if option == "add"
    add_teacher
  elsif option == "delete"
    delete_teacher
  else
    puts "invalid option"
    teacher_management
  end
end

while true
  puts "\n✦---------------------------✦"
  puts "===========OPTIONS=========="
  puts '1. Student management'
  puts '2. Course management'
  puts '3. Subject management'
  puts '4. Teacher management'
  puts '5. Exit'
  puts "✦---------------------------✦"

  print 'Pick option: '
  option = gets.to_i

  case option
  when 1
    student_management
  when 2
    course_management
  when 3
    subject_management
  when 4
    teacher_management
  when 5
    puts "Exiting program..."
    break
  else
    puts "invalid option. Please try again."
  end
end




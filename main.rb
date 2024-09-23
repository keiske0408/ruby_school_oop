require './course.rb'
require './student.rb'
require './subject.rb'
require './teacher.rb'

def add_student
  puts "•      Add new Student      •"
  new_student = Student.new
  print "name: "
  new_student.name = gets.chomp
  print "birth_date: "
  new_student.birth_date = gets.chomp
  print "email: "
  new_student.email = gets.chomp
  print "phone_number: "
  new_student.phone_number = gets.chomp

  id = Student.all.size + 1
  new_student.id = id

  new_student.save
  puts "Student added successfully!"
  puts new_student.display
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

def display_student
  students = Student.all
  if students.empty?
    puts "No students found."
  else
    students.each do |student|
      puts student.display
    end
  end
end

def update_student
  print "Input ID:"
  student_id = gets.chomp.to_i
  id_found = Student.find_id(student_id)

  if id_found
    puts "•      Edit Student      •"
    print "name: "
    id_found.name = gets.chomp
    print "birth_date: "
    id_found.birth_date = gets.chomp
    print "email: "
    id_found.email = gets.chomp
    print "phone_number: "
    id_found.phone_number = gets.chomp

    puts "Student updated successfully"
  else
    puts "ID not found"

  end
end
def student_management
  puts "===========OPTIONS=========="
  print "Add/Delete/Display/Update: "
  option = gets.chomp.downcase

  if option == "add"
    add_student
  elsif option == "delete"
    delete_student
  elsif option == "display"
    display_student
  elsif option == "update"
    update_student
  else
    puts "Invalid option"
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
  print "Input Course ID to delete: "
  course_id = gets.chomp.to_i
  course = Course.find_course_id(course_id)

  if course
    course.destroy
    puts "Course successfully deleted!"
  else
    puts "Course ID not found"
  end
end

def display_course
  courses = Course.all
  if courses.empty?
    puts "No courses found."
  else
    courses.each do |course|
      puts course.display
    end
  end
end

def course_management
  puts "===========OPTIONS=========="
  print "Add/Delete/Display: "
  option = gets.chomp.downcase
  if option == "add"
    add_course
  elsif option == "delete"
    delete_course
  elsif option == "display"
    display_course
  else
    puts "Invalid option"
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

def display_subject
  subjects = Subject.all
  if subjects.empty?
    puts "No subjects found."
  else
    subjects.each do |subject|
      puts subject.display
    end
  end
end

def subject_management
  puts "===========OPTIONS=========="
  print "Add/Delete/Display: "
  option = gets.chomp.downcase
  if option == "add"
    add_subject
  elsif option == "delete"
    delete_subject
  elsif option == "display"
    display_subject
  else
    puts "Invalid option"
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
  puts "Input Teacher ID to delete:"
  teacher_id = gets.chomp.to_i
  teacher = Teacher.find_id(teacher_id)

  if teacher
    teacher.destroy
    puts "Teacher successfully deleted!"
  else
    puts "ID not found"
  end
end

def display_teacher
  teachers = Teacher.all
  if teachers.empty?
    puts "No teachers found."
  else
    teachers.each do |teacher|
      puts teacher.display
    end
  end
end

def teacher_management
  puts "===========OPTIONS=========="
  print "Add/Delete/Display: "
  option = gets.chomp.downcase
  if option == "add"
    add_teacher
  elsif option == "delete"
    delete_teacher
  elsif option == "display"
    display_teacher
  else
    puts "Invalid option"
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
    puts "Invalid option. Please try again."
  end
end
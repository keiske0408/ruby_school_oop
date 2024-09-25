require './course.rb'
require './student.rb'
require './subject.rb'
require './teacher.rb'
require './course_subject.rb'
require './student_subject.rb'
require './person.rb'

def add_student
  puts "•      Add new Student      •"
  new_student = Student.new
  print "Name: "
  new_student.name = gets.chomp
  print "Birth date: "
  new_student.birth_date = gets.chomp
  print "Email: "
  new_student.email = gets.chomp
  print "Phone number: "
  new_student.phone_number = gets.chomp

  puts "Available Courses:"
  Course.all.each(&:display)

  print "Select Course ID: "
  new_student.course_id = gets.chomp.to_i

  new_student.id = Student.all.size + 1
  new_student.save
  puts "Student added successfully!"
  puts new_student.display

  # Enrollment logic...
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
  print "Input Student ID to view details: "
  student_id = gets.chomp.to_i
  student = Student.find_id(student_id)

  if student
    puts student.display
    puts "Enrolled Subjects:"
    subjects = student.enrolled_subjects
    if subjects.empty?
      puts "No subjects enrolled."
    else
      subjects.each { |subject| puts subject.display }
    end
  else
    puts "Student ID not found."
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
  print "Add/Delete/Display/Update/(Back)School Management:"
  option = gets.chomp.downcase

  if option == "add"
    add_student
  elsif option == "delete"
    delete_student
  elsif option == "display"
    display_student
  elsif option == "update"
    update_student
  elsif option == "back"
    school_management
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
    puts " "
    courses.each do |course|
      course.display
    end
  end
  print "\nInput Course ID: "
  course_id = gets.chomp.to_i
  id_founder = Course.find_course_id(course_id)
  if id_founder
    puts id_founder.display

  else
    puts "ID not found"
  end

end

def update_course
  print "Input ID:"
  course_id = gets.chomp.to_i
  id_found = Course.find_course_id(course_id)

  if id_found
    puts "•      Edit Course      •"
    print "Course name: "
    id_found.name = gets.chomp

    puts "Course updated successfully"
  else
    puts "ID not found"
  end
end

def course_management
  puts "===========OPTIONS=========="
  print "Add/Delete/Display/Update/Add Subject/Remove Subject/(Back)School Management: "
  option = gets.chomp.downcase

  case option
  when "add"
    add_course
  when "delete"
    delete_course
  when "display"
    display_course_with_subjects
  when "update"
    update_course
  when "add subject"
    add_subject_to_course
  when "remove subject"
    remove_subject_from_course
  when "back"
    school_management
  end
end

def display_course_with_subjects
  print "Input Course ID: "
  course_id = gets.chomp.to_i
  course = Course.find_course_id(course_id)

  if course
    puts course.display
    loop do
      puts "\nOptions: [1] View Students [2] View Subjects [3] Back"
      option = gets.chomp.to_i

      case option
      when 1
        students = course.students
        if students.empty?
          puts "No students found for this course."
        else
          students.each { |student| puts student.display }
        end
      when 2
        subjects = course.subjects
        if subjects.empty?
          puts "No subjects found for this course."
        else
          subjects.each { |subject| puts subject.display }
        end
      when 3
        break
      else
        puts "Invalid option."
      end
    end
  else
    puts "ID not found"
  end
end

def add_subject_to_course
  print "Input Course ID to add a subject: "
  course_id = gets.chomp.to_i
  course = Course.find_course_id(course_id)

  if course
    puts "Available Subjects:"
    Subject.all.each { |subject| puts subject.display }
    print "Select Subject ID: "
    subject_id = gets.chomp.to_i
    subject = Subject.find_id(subject_id)

    if subject
      cs = Course_subject.new
      cs.course_id = course_id
      cs.subject_id = subject_id
      cs.save
      puts "Subject added to course successfully!"
    else
      puts "Subject ID not found."
    end
  else
    puts "Course ID not found."
  end
end

def remove_subject_from_course
  print "Input Course Subject ID to remove: "
  cs_id = gets.chomp.to_i
  cs = Course_subject.find_id(cs_id)

  if cs
    cs.destroy
    puts "Subject removed from course successfully!"
  else
    puts "Course Subject ID not found."
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

def update_subject
  print "Input ID:"
  subject_id = gets.chomp.to_i
  id_found = Subject.find_id(subject_id)

  if id_found
    puts "•      Edit Subject      •"
    print "Subject name: "
    id_found.name = gets.chomp

    puts "Subject updated successfully"
  else
    puts "ID not found"
  end
end

def subject_management
  puts "===========OPTIONS=========="
  print "Add/Delete/Display/Update/(Back)School Management:"
  option = gets.chomp.downcase
  if option == "add"
    add_subject
  elsif option == "delete"
    delete_subject
  elsif option == "display"
    display_subject
  elsif option == "update"
    update_subject
  elsif option == "back"
    school_management
  else
    puts "Invalid option"
  end
end

def add_teacher
  puts "•      Add new Teacher      •"
  new_teacher = Teacher.new
  print "Name: "
  new_teacher.name = gets.chomp
  print "Birth date: "
  new_teacher.birth_date = gets.chomp
  print "Email: "
  new_teacher.email = gets.chomp
  print "Phone number: "
  new_teacher.phone_number = gets.chomp
  print "Department: "
  new_teacher.department = gets.chomp

  new_teacher.id = Teacher.all.size + 1
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

def update_teacher
  print "Input ID:"
  teacher_id = gets.chomp.to_i
  id_found = Teacher.find_id(teacher_id)

  if id_found
    puts "•      Edit Teacher      •"
    print "name: "
    id_found.name = gets.chomp
    print "birth_date: "
    id_found.birth_date = gets.chomp
    print "email: "
    id_found.email = gets.chomp
    print "phone_number: "
    id_found.phone_number = gets.chomp
    print "department: "
    id_found.department = gets.chomp

    puts "Teacher updated successfully"
  else
    puts "ID not found"
  end
end

def teacher_management
  puts "===========OPTIONS=========="
  print "Add/Delete/Display/Update/(Back)School Management: "
  option = gets.chomp.downcase
  if option == "add"
    add_teacher
  elsif option == "delete"
    delete_teacher
  elsif option == "display"
    display_teacher
  elsif option == "update"
    update_teacher
  elsif option == 'back'
    school_management
  else
    puts "Invalid option"
  end
end

def school_management
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
      exit
    else
      puts "Invalid option. Please try again."
    end
  end
end

while true
  school_management
end
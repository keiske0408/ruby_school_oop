require './person'
class Student < Person
  attr_accessor :course_id

  def subjects
    Student.all.select { |student| student.course_id == id }
  end

  def enrolled_subjects
    Student_subject.all.select { |ss| ss.student_id == id }.map { |ss| Subject.find_id(ss.subject_id) }
  end
end
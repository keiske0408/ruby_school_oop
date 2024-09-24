class Student_subject
  attr_accessor :id, :student_id, :subject_id
  @@records = []

  def save
    @@records << self
  end

  def destroy
    self.delete(self)
  end

  def display
    "ID:#{id} Course_ID:#{course_id} Subject_ID:#{subject_id}"
  end

  def self.all
    return @@records
  end

  def self.find_id(id)
    @@records.find{ |stud_subject| stud_subject.id == id }
  end

end

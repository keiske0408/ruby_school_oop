class Course
  attr_accessor :id, :name
  @@records = []

  def save
    @@records << self
  end

  def destroy
    @@records.delete(self)
  end

  def display
    "Course_ID:#{id} Course_Name:#{name}"
  end

  def self.all
    return @@records
  end

  def self.find_course_id(id)
    @@records.find { |course| course.id == id }
  end

end
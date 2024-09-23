class Course
  attr_accessor :id, :name , :deleted_at
  @@records = []

  def save
    @@records << self
  end

  def destroy
    self.deleted_at = Time.now
  end

  def display
    return if deleted_at
    "Course_ID:#{id} Course_Name:#{name}"
  end

  def self.all
    @@records.reject { |course| course.deleted_at }
  end

  def self.find_course_id(id)
    @@records.find { |course| course.id == id }
  end

end
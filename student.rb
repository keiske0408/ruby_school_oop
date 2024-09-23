class Student
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :deleted_at, :course_id
  @@records = []

  def save
    @@records << self
  end

  def destroy
    self.deleted_at = Time.now
  end

  def display
    return if deleted_at
    course_name = Course.find_course_id(course_id)&.name || "N/A"
    "ID: #{id}, NAME: #{name}, BIRTH_DATE: #{birth_date}, EMAIL: #{email}, PHONE_NUMBER: #{phone_number},"
  end

  def self.all
    @@records.reject { |student| student.deleted_at }
  end

  def self.find_id(id)
    @@records.find{ |student|student.id == id }
  end

  def self.find_email(email)
    @@records.find{ |student|student.email == email }
  end

end


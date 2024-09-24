class Course
  attr_accessor :id, :name , :deleted_at

  def initialize(id=nil,name=nil)
    @id = id
    @name = name
  end

  @@records = [Course.new(1,"BSBA"),
               Course.new(2,"BSA")]
  def save
    if id.nil? || id > @@records.size
      id ||= @@records.size + 1
    @@records << self
  end
  end

  def destroy
    self.deleted_at = Time.now
  end

  def display
    return if deleted_at
    puts "Course_ID:#{id} Course_Name:#{name}"
  end

  def self.all
    @@records.reject { |course| course.deleted_at }
  end

  def self.find_course_id(id)
    @@records.find { |course| course.id == id }
  end

end
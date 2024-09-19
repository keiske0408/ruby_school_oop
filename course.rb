class Course
  attr_accessor :id, :name
  @@records
end

def save
  @@records << self
end

def destroy
  @@records.delete(self)
end

def display
  "\n course id: #{id}, name: #{name} \n"
end

def self.all
  return @@records
end

def self.find_id(id)
  @@records.find{|course_id| course_id == id}
end

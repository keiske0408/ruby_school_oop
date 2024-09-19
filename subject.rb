class Subject
  attr_accessor :id, :name
  @@records = []

  def save
    @@records << self
  end

  def destroy
    @@records.delete(self)
  end

  def display
    "\nSubject ID: #{id},Subject Name: #{name} \n"
  end

  def self.all
    return @@records
  end

  def self.find_id(id)
    @@records.find { |subject_id| subject_id == id }
  end

end

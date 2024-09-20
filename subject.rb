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
    "Subject_ID:#{id} Subject_Name:#{name}"
  end

  def self.all
    return @@records
  end

  def self.find_id(id)
    @@records.find{ |subject| subject.id == id }
  end

end

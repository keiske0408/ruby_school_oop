class Subject
  attr_accessor :id, :name, :deleted_at
  @@records = []
  def initialize(id=nil,name=nil)
    @id = id
    @name = name
  end

  @@records = [Subject.new(1,"math"),
               Subject.new(2,"science")]

  def save
    @@records << self
  end

  def destroy
    self.deleted_at = Time.now
  end

  def display
    return if deleted_at
    "Subject_ID:#{id} Subject_Name:#{name}"
  end

  def self.all
    @@records.reject { |subject| subject.deleted_at }
  end

  def self.find_id(id)
    @@records.find{ |subject| subject.id == id }
  end

end

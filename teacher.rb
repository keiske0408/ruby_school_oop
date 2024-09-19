class Teacher
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :department
  @@records = []

  def save
    @@records << self
  end

  def destroy
    @@records.delete(self)
  end

  def display
    "\nID:#{id} Name:#{name} Birth_date:#{birth_date} Email:#{email} Phone_number:#{phone_number} Department:#{department}\n"
  end

  def self.all
    return @@records
  end

  def self.find_id(id)
    @@records.find { |subject| subject.id == id }
  end

  def self.find_email(id)
    @@records.find { |subject| subject.email == id }
  end

end

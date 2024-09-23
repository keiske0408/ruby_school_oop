class Teacher
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :department, :deleted_at
  @@records = []

  def save
    @@records << self
  end

  def destroy
    self.deleted_at = Time.now
  end

  def display
    return if deleted_at
    "(ID:#{id} Name:#{name} Birth_date:#{birth_date} Email:#{email} Phone_number:#{phone_number} Department:#{department})"
  end


  def self.all
    @@records.reject do |teacher| teacher.deleted_at
    end
  end

  def self.find_id(id)
    @@records.find { |subject| subject.id == id }
  end

  def self.find_email(id)
    @@records.find { |subject| subject.email == id }
  end

end

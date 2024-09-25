class Person
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :deleted_at

  @@records = []

  def save
    @@records << self
  end

  def destroy
    self.deleted_at = Time.now
  end

  def display
    return if deleted_at
    "ID: #{id}, NAME: #{name}, BIRTH_DATE: #{birth_date}, EMAIL: #{email}, PHONE_NUMBER: #{phone_number}"
  end

  def self.all
    @@records.reject { |person| person.deleted_at }
  end

  def self.find_id(id)
    @@records.find { |person| person.id == id }
  end

  def self.find_email(email)
    @@records.find { |person| person.email == email }
  end
end
class Course_subject
    attr_accessor :id, :course_id, :subject_id , :deleted_at
    @@records = []

    def save
      @@records << self
    end

    def destroy
      self.deleted_at = Time.now
    end

    def display
      return if deleted_at
      "ID:#{id} Course_ID:#{course_id} Subject_ID:#{subject_id}"
    end

    def self.all
      @@records.reject { |subject| subject.deleted_at }
    end

    def self.find_id(id)
      @@records.find{ |course_sub| course_sub.id == id }
    end

  end

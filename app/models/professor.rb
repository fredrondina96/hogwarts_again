class Professor <ApplicationRecord
  validates_presence_of :name, :age, :specialty
  has_many :professor_students
  has_many :students, through: :professor_students

  def average_student_age
    average_age = 0.0
      self.students.each do |student|
        average_age += student.age
      end
    return (average_age/self.students.length).round(1)
  end
end

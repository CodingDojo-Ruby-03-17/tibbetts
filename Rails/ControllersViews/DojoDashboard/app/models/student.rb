class Student < ApplicationRecord
  belongs_to :dojo

  validates :first_name, :last_name, :email, presence: true

  def name
    return self.first_name + " " + self.last_name
  end
end

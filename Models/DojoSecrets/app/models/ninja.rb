class Ninja < ApplicationRecord

  # relations
  belongs_to :dojo

  # validations
  validates :first_name, :last_name, :dojo_id, presence: true

  # callbacks
  before_save :titleize_names

  private
    def titleize_names
      self.first_name = self.first_name.titleize
      self.last_name = self.last_name.titleize
    end

end

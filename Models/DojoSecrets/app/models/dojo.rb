class Dojo < ApplicationRecord
  has_many :ninjas, dependent: :destroy
  validates :name, :city, :state, presence: true
  validates :state, length: { is: 2 }

  before_save :correct_casing

  private

    def correct_casing
      self.name = self.name.titleize
      self.city = self.city.titleize
      self.state.upcase!
    end

end

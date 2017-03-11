class Blog < ApplicationRecord

  # relations
  has_many :posts, dependent: :destroy
  has_many :owners
  has_many :users, through: :owners
  has_many :comments, as: :commentable

  # validations 
  validates :name, :description, presence: true 

  # callbacks 
  before_save :titleize_name

  private
    def titleize_name
      self.name = self.name.titleize
    end

end

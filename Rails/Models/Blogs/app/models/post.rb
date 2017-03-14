class Post < ApplicationRecord

  # associations
  belongs_to :blog
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :comments, as: :commentable

  # validations 
  validates :title, :content, :blog_id, :user_id,  presence: true
  validates :content, length: { minimum: 7 } 

  # callbacks 
  before_save :titleize_title

  private
    def titleize_title
      self.title = self.title.titleize
    end

end

class Message < ApplicationRecord

  # associations
  belongs_to :post
  belongs_to :user
  has_many :comments, as: :commentable

  # validations
  validates :author, :message, :post_id, :user_id, presence: true
  validates :message, length: { minimum: 15 }

  # callbacks
  before_save :titleize_author

  private 
    def titleize_author
      self.author = self.author.titleize
    end


end

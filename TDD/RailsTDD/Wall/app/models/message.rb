class Message < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :message, :user_id, presence: true
  validates :message, length: { minimum: 10 }
end

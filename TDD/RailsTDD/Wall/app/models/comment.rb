class Comment < ApplicationRecord
  belongs_to :message
  belongs_to :user

  validates :comment, :user_id, :message_id, presence: true
  validates :comment, length: { minimum: 10 }

end

class User < ApplicationRecord
  has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: true }, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

  def email=(value)
    write_attribute(:email, value.downcase)
  end

#  before_save :email_downcase

  def email_downcase
    email.downcase!
    return nil
  end 



end

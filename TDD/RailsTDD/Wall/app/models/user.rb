class User < ApplicationRecord

  has_many :messages, dependent: :destroy
#  has_many :comments, dependent: :destroy


  validates :first_name, :username, :email, :password, presence: true
  validates :first_name, length: { minimum: 2, message: "First name must be at least 2 characters" }

  validates :username, length: { minimum: 5, message: "Username must be at least 5 characters long" }
  validates :username, uniqueness: { message: "Username is taken" } 

  validates :email, uniqueness:  { message: "Email is taken" } 
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ , message: "Email syntax is incorrect"  

  validates :password, length: { minimum: 8, maximum: 22, message: "Password must be between 8-22 characters" }

end

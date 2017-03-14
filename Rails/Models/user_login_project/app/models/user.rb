class User < ApplicationRecord
  validates :first_name, :last_name, :address, :age, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :age, numericality: { less_than: 151, greater_than: 9, only_integer: true } 
end

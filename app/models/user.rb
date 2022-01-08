class User < ApplicationRecord
  has_secure_password
  has_many :books
  has_many :conversations
  has_many :messages
  validates :username, presence: true
  validates :email, presence: true
end

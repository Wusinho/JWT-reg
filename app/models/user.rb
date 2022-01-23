class User < ApplicationRecord
  has_secure_password
  has_many :books
  has_many :conversations
  has_many :messages
  validates :username, presence: true
  validates :email, presence: true

  def self.check_admin
    check = where('role = true').count 
    
    return if check == 1
    
  end

end

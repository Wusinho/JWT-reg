class Conversation < ApplicationRecord
  has_many :messages
  belongs_to :user
  validates :title, presence: true, uniqueness: true
end

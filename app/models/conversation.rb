class Conversation < ApplicationRecord
  has_many :messages
  belongs_to :user_id
end

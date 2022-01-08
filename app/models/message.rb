class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user_id
end

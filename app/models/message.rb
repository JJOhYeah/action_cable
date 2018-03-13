class Message < ApplicationRecord
  belongs_to :user
  # allows background job to broadcast message back to front end
  after_create_commit { BroadcastMessageJob.perform_later self }
end

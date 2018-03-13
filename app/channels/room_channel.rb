class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # Receives message from room.coffee speak method and saves to db.
    # We need to broadcast the message back to the front end.  
    # We do that in the message model with the after_create_commit.
    Message.create content: data['message'], user: current_user
  end
end

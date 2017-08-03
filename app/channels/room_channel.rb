class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{private_chat_id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

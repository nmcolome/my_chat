class MessagesController < ApplicationController
  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "room_channel_#{message.private_chat_id}", 
                                  content: message.content,
                                  user: message.user.username
      head :ok
    end
  end

  private
    def message_params
      params.require(:message).permit(:content, :private_chat_id)
    end
end
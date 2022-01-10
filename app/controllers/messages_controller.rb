require_relative '../services/authenticate_user'

class MessagesController < ApplicationController
  include AuthenticateUser
  before_action :authorized, only: %i[show update destroy]

  def create
    @message = Message.new(message_params)
    @conversation = Conversation.find(message_params[:conversation_id])
    if @message.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(MessageSerializer.new(@message)).serializable_hash
      MessagesChannel.broadcast_to @conversation, serialized_data
      head :ok
    else
      render json: { error: 'error' }, status: :unprocessable_entity

    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :conversation_id).merge(user_id: current_user.id)
  end

end

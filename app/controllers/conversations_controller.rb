require_relative '../services/authenticate_user'

class ConversationsController < ApplicationController
  include AuthenticateUser
  before_action :authorized, only: %i[show update destroy]

  def index
    @conversations = Conversation.all
    render json: @conversations
  end

  def create
    @conversation = Conversation.new(conversation_params)

    if @conversation.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ConversationSerializer.new(@conversation)
      ).serializable_hash
      ActionCable.server.broadcast 'conversations_channel', serialized_data
      head :ok
    # else
      # render json: { error: 'error' }, status: :unprocessable_entity

    end


  end

  private

  def conversation_params
    params.require(:conversation).permit(:title).merge(user_id: current_user.id)
  end

end

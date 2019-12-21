class MessagesController < ApplicationController
  def new
    if customer_signed_in?
        @conversation = Conversation.find(params[:conversation_id])
        @conversations = current_customer.conversations
        @messages = Message.where(conversation_id: @conversation.id)
    elsif owner_signed_in?
        @conversation = Conversation.find(params[:conversation_id])
        @conversations = current_owner.conversations
        @messages = Message.where(conversation_id: @conversation.id)
    end
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    # メッセージがcustomerのものis_customer=true
    # メッセージがowner のものis_customer=false
    if customer_signed_in?
      @message.is_customer = true
    elsif owner_signed_in?
      @message.is_customer = false
    else
      @message.is_customer = false
    end

    @message.conversation_id = @conversation.id

    # メッセージの保存
    if @message.save
      redirect_to new_conversation_message_path(@conversation.id)
    else
      redirect_to nconversations_path(@conversation.id)
    end
  end

  def message_params
  	params.require(:message).permit(:message)
  end
end

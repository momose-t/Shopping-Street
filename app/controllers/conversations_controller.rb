class ConversationsController < ApplicationController
  # ボタンを押したらここを呼ぶ(オーナーのid)
  # Conversation.newで新しく作る
  # 作ったConversationId に対応するConversation詳細画面にリダイレクト
  def create
  	owner = Owner.find(params[:owner_id]) #storeのshowから持ってきたowner_idをownerモデルの中から探してくる
  	# ちゃとルームを持っているかどうか
  	if conversation = Conversation.find_by(customer_id: current_customer.id, owner_id: owner.id)
  		redirect_to conversation_path(conversation.id)#詳細へ
  	  	# new
  		# saveできたら
  	else
  		@conversation = Conversation.new
  		@conversation.owner_id = owner.id
  		@conversation.customer_id = current_customer.id
  		if @conversation.save
			redirect_to conversation_path(id: @conversation.id)#詳細へ
		else
			redirect_to root_path
		end
  	end
  end

  def show
    if customer_signed_in?
        @conversation = Conversation.find(params[:id])# createで作ったconversationのidがほしい
        @messages = Message.where(conversation_id: @conversation.id)
        # @conversations = current_customer.conversations
    elsif owner_signed_in?
        @owner = Owner.find(current_owner.id)
        @conversation = Conversation.find(params[:id])
        @messages = Message.where(conversation_id: @conversation.id)
    end
  end

  def index
	  	if owner_signed_in?
        @owner = Owner.find(current_owner.id)
	  		@conversations = Conversation.where(owner_id: current_owner.id)
	        # 自分が入っているconversationの相手のidを格納
	        @customer_ids = []
		    @conversations.each do |r|
		    	@customer_ids << r.customer_id
		    end
	  	else customer_signed_in?
	  		@conversation = Conversation.where(customer_id: current_customer.id)
	        # 自分が入っているconversationの相手のidを格納
	        @owner_ids = []
	        @conversation.each do |r|
	          	@owner_ids << r.owner_id
	        end
          @store = Store.where(owner_id: @owner_ids)
          @store_ids = []
          @store.each do |r|
            @store_ids << r.image_id
          end
	  	end
  end
end
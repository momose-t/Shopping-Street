class ConversationsController < ApplicationController
  def index
	  	if owner_signed_in?
	  		@conversations = Conversation.where(owner_id: current_owner.id).limit 1
	        # 自分が入っているconversationの相手のidを格納
	        @customer_ids = []
	        if @customer_ids.empty?
	        	flash[:notice] = "やりとりはありません"
	        else
		        @conversations.each do |r|
		          @customer_ids << r.customer_id
		        end
		    end
	  	else customer_signed_in?
	  		@conversations = Conversation.where(customer_id: current_customer.id).limit 1
	        # 自分が入っているconversationの相手のidを格納
	        @owner_ids = []
	        if @owner_ids.empty?
	        	flash[:notice] = "やりとりはありません"
	        else
	        	@conversation.each do |r|
	          	@owner_ids << r.owner_id
	        	end
	        end
	  	end
  end
end
class StoresController < ApplicationController
  def index
  	@stores = Store.all
  end

  def new
  end

  def show
  	@store = Store.find(params[:id])
  	@posts = Post.where(store_id: @store.id)
    if customer_signed_in?
    @conversation = Conversation.where("owner_id", @store.owner_id)
                                .where("customer_id", current_customer.id)
    end
    # @posts = Post.all

  end

  def edit
  end
end

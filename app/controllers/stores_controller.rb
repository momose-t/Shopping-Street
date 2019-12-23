class StoresController < ApplicationController
  def index
  	@stores = Store.all
    if owner_signed_in?
      @owner = Owner.find(current_owner.id)
    end
  end

  def new
    @store = Store.new
    if owner_signed_in?
      @owner = Owner.find(current_owner.id)
    end
    #binding.pry
    #@params = params
  end

  def create
    store = Store.new(store_params)
    store.owner_id = current_owner.id
    if store.save
      redirect_to root_path
    else
      redirect_to new_store_path
    end
  end

  def show
    if owner_signed_in?
      @owner = Owner.find(current_owner.id)
    end
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

  private
  def store_params
    params.require(:store).permit(:store_name, :store_postal_cade, :store_prefecture_code, :store_city, :store_building, :store_phone_number, :store_category, :good, :image, :introduction, :owner_id)
  end
end

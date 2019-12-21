class StoresController < ApplicationController
  def index
  	@stores = Store.all
  end

  def new
  end

  def show
  	@store = Store.find(params[:id])
  	@posts = Post.where(store_id: @store.id)
  	# @posts = Post.all

  end

  def edit
  end
end

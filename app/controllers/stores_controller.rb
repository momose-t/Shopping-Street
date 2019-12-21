class StoresController < ApplicationController
  def index
  	@stores = Store.all
  end

  def new
  end

  def show
  	@store = Store.find(params[:id])
  end

  def edit
  end
end

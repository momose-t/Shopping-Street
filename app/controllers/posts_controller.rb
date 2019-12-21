class PostsController < ApplicationController
  def new
  	@post = Post.new
  end
  def create
  	post = Post.new(post_params)
  	#store = Store.find(params[:store_id])
  	#post.store_id = store.id
  	post.store_id = params[:store_id]
  	if post.save
  		redirect_to root_path
    else
    	flash[:notice] = "投稿できませんでした"
    end

  end
  def show
  end
  private
  def post_params
  	params.require(:post).permit(:image, :comment)
  end
end

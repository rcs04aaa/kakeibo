class Public::FavoritesController < ApplicationController
  
  def index
    @post = Post.all
  end
  
  def create
    @favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
    @favorite.save
    # redirect_to post_path(params[:post_id])
  end
  
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    @favorite.destory
    # redirect_to post_path(params[:post_id])
  end
  
end

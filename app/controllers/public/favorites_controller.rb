class Public::FavoritesController < ApplicationController
  
  def create
    @post_favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
    @post_favorite.save
    redirect_to post_path(params[:post_id])
  end
  
  def destroy
    @post_favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post_favorite.destory
    redirect_to post_path(params[:post_id])
  end
  
end

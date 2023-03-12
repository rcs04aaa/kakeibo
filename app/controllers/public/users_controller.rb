class Public::UsersController < ApplicationController
  def show
    # @posts = @user.posts
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update
      redirect_to user_path(current_user), notice: "更新が完了しました"
    else
      render :edit
    end
  end
  
  def favorites
    @user = User.find(params[:id])
    @favorite_posts = Post.find(favorites)
  end
  
end

class Public::UsersController < ApplicationController

  def show
    # @posts = @user.posts
    @user = current_user
    @total = 0
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_my_page_path(current_user), notice: "更新が完了しました"
    else
      render :edit
    end
  end

  def favorites
    @user = User.find(params[:id])
    @favorite_posts = Post.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :is_deleted)
  end

end

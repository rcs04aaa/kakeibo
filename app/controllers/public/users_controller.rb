class Public::UsersController < ApplicationController

  def show
    @user = current_user
    @posts = Post.group(:category_id).sum(:amount)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_my_page_path(current_user)  #, notice: "更新が完了しました"
    else
      render :edit
    end
  end
  
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:user_name, :email, :is_deleted)
  end

end

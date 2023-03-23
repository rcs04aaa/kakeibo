class Public::UsersController < ApplicationController

  def show
    @user = current_user
    # @category = Category.find(params[:category_id])
    # @posts = current_user.posts.where(payment_at: params["date"] )
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
  
  private

  def user_params
    params.require(:user).permit(:user_name, :email, :is_deleted)
  end

end

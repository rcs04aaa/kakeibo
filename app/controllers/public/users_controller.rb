class Public::UsersController < ApplicationController

  def show
    @user = current_user
    @category_total = Post.all.where(user_id: @user.id).group(:category_id).sum(:amount)
    if params[:start_date].blank?
      current_date = Date.current
    else
      current_date = Date.parse(params[:start_date])
    end
    @month = current_date.month
    @monthly_amount = current_user.posts.where(payment_at: current_date.all_month).sum(:amount)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_my_page_path(current_user)
    else
      render :edit
    end
  end

  def withdraw
    @user = current_user
    if @user.email == 'guest@guest.com'
      reset_session
      redirect_to users_my_page_path
    else
      @user.update(is_deleted: true)
      reset_session
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :is_deleted)
  end

end

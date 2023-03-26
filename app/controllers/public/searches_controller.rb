class Public::SearchesController < ApplicationController
   before_action :authenticate_user!

  def index
    @word = params[:word]
    if params[:word].present?
      @posts = Post.where(user_id: current_user.id).where("content like ?", "%" + params[:word] + "%")
    elsif params[:category_id].present?
      @posts = Post.joins(:category).where(user_id: current_user.id).where(categories: {id: params[:category_id]})
      @category = Category.find(params[:category_id])
    else
      render :new
    end
  end
  
end

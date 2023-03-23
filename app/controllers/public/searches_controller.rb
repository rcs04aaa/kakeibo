class Public::SearchesController < ApplicationController
   before_action :authenticate_user!

  def index
    @word = params[:word]
    if @word.present?
      @posts = Post.where("content like ?", "%" + params[:word] + "%")
    else
      @posts = Post.joins(:category).where(categories: {id: params[:category_id]})
      @category = Category.find(params[:category_id])
    end
  end
  
end

class Public::SearchesController < ApplicationController
   before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "Post"
      @posts = Post.looks(params[:search], params[:word])
    else
      @categories = Category.looks(params[:search], params[:word])
    end
  end

  def index
    @posts = Post.all
  end

end

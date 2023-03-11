class Public::PostsController < ApplicationController
  
  def new
    @post = Book.new
  end
  
  def index
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def create
    @post = Book.new(post_params)
  end
  
  def destroy
  end

end

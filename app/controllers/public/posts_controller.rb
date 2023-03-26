class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def index
    @month = params["month"]
    @posts = Post.where(user_id: current_user.id, category_id: params[:category_id])
    @category_name = Category.find(params[:category_id]).category_name
  end
  
  def date
    @date =  params["date"] 
    @posts = current_user.posts.where(payment_at: params["date"])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to date_posts_path(date: @post.payment_at)
    else
      render 'edit'
    end
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to users_my_page_path(current_user)
    else
      render 'new'
    end
  end
  
  def bookmark
    @post = Post.find(params[:id])
    if @post.bookmark
      @post.update(bookmark: false)
    else
        @post.update(bookmark: true)
    end
    redirect_back(fallback_location: root_path)
  end
  
  def bookmarks
    @bookmarks = Post.where(bookmark: true).where(user_id: current_user.id)
    @posts = current_user.posts.where(payment_at: params["date"] )
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to  date_posts_path(date: post.payment_at)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:category_id, :content, :quantity, :price, :payment_at)
  end

end

class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def index
    @posts = @user.posts(current_user)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post.params)
      redirect_to post_path(@post), notice: "更新が完了しました"
    else
      render 'edit'
    end
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.amount = @post.price* @post.quantity
    if @post.save
      redirect_to users_my_page_path(current_user), notice: "登録が完了しました"
    else
      render 'new'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    post.destory
    redirect_to '/posts', notice: "削除が完了しました"
  end
  
  private
  
  def post_params
    params.require(:post).permit(:category_id, :content, :quantity, :price, :payment_at)
  end

end

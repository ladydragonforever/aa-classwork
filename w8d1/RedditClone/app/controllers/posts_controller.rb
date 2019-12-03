class PostsController < ApplicationController
  before_action :require_logged_in

  def new
    @post = Post.new
    render :new
  end
  
  def index
    @posts = Post.all
    render :index
  end


  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id  
    @post.sub_id = params[:sub_id]
    if @post.save 
      redirect_to sub_url(@post.sub_id)
    else 
      flash.now[:errors] = @post.errors.full_messages 
      render :new 
    end 
  end
  
  def edit

    @post = Post.find(params[:id])

  end
  
  def update 
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id && @post.update(post_params)
      redirect_to sub_url(@post.sub_id)
    else 
      flash.now[:errors] = @post.errors.full_messages 
      render :edit 
    end 

  end 

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id 
    @post.destroy 
    end
    redirect_to sub_url(@post.sub_id)

  end 





  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end
end

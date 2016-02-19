class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def new 
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash[:danger] = @post.errors.full_messages
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :bootsy_image_gallery_id)
  end
end
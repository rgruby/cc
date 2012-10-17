class PostsController < ApplicationController
  def new
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.page(params[:page])
  end

#  def endless
#    # endless page
#    @users = User.page(params[:page]).per_page(10)
#  end
end
